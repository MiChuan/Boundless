#!/usr/bin/env bash
#
# Boundless Advisor - 知识同步脚本
#
# 作用：从 GitHub 仓库 MiChuan/Boundless 拉取最新的 Markdown 文档，
#       覆盖本 Skill 的 references/ 目录，使 Skill 内容与仓库保持同步。
#
# 用法：
#   bash scripts/sync-knowledge.sh
#
# 说明：
#   - 优先使用 git（若可用）；否则回退到下载 zip 归档。
#   - 本脚本只读远程内容，不会向仓库推送任何改动。
#   - 若网络不可用，本地 references/ 的快照仍可正常使用。

set -euo pipefail

REPO_OWNER="MiChuan"
REPO_NAME="Boundless"
BRANCH="main"

# 定位 Skill 根目录（脚本所在目录的上一级）
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
REF_DIR="${SKILL_DIR}/references"

echo "==> Boundless Advisor 知识同步"
echo "    仓库: ${REPO_OWNER}/${REPO_NAME} (${BRANCH})"
echo "    目标: ${REF_DIR}"
echo

mkdir -p "${REF_DIR}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

# ---------- 方式一：git clone（浅克隆） ----------
sync_via_git() {
  command -v git >/dev/null 2>&1 || return 1
  echo "--> 尝试通过 git 拉取..."
  if git clone --depth 1 --branch "${BRANCH}" \
      "https://github.com/${REPO_OWNER}/${REPO_NAME}.git" "${TMP_DIR}/repo" >/dev/null 2>&1; then
    return 0
  fi
  return 1
}

# ---------- 方式二：下载 zip 归档 ----------
sync_via_zip() {
  local zip_url="https://codeload.github.com/${REPO_OWNER}/${REPO_NAME}/zip/refs/heads/${BRANCH}"
  echo "--> 回退为下载 zip 归档..."
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL -o "${TMP_DIR}/repo.zip" "${zip_url}" || return 1
  elif command -v wget >/dev/null 2>&1; then
    wget -q -O "${TMP_DIR}/repo.zip" "${zip_url}" || return 1
  else
    echo "!! 未找到 curl 或 wget，无法下载。" >&2
    return 1
  fi

  command -v unzip >/dev/null 2>&1 || { echo "!! 未找到 unzip。" >&2; return 1; }
  mkdir -p "${TMP_DIR}/extract"
  unzip -q "${TMP_DIR}/repo.zip" -d "${TMP_DIR}/extract" || return 1

  local extracted
  extracted="$(find "${TMP_DIR}/extract" -maxdepth 1 -mindepth 1 -type d | head -n 1)"
  [ -n "${extracted}" ] || return 1
  mv "${extracted}" "${TMP_DIR}/repo"
  return 0
}

# ---------- 执行同步 ----------
if ! sync_via_git; then
  if ! sync_via_zip; then
    echo
    echo "!! 同步失败：无法访问远程仓库。" >&2
    echo "   本地 references/ 中的快照仍然可用，Skill 功能不受影响。" >&2
    exit 1
  fi
fi

SRC_DIR="${TMP_DIR}/repo"
UPDATED=0

for f in philosophy.md sunxue.md tongxue.md partner.md sure.md annaofenpei.md; do
  if [ -f "${SRC_DIR}/${f}" ]; then
    cp "${SRC_DIR}/${f}" "${REF_DIR}/${f}"
    echo "    [更新] ${f}"
    UPDATED=$((UPDATED + 1))
  else
    echo "    [跳过] ${f}（远程不存在，保留本地版本）"
  fi
done

# 检测远程新增的其他 markdown 文件
for f in "${SRC_DIR}"/*.md; do
  [ -e "${f}" ] || continue
  base="$(basename "${f}")"
  case "${base}" in
    philosophy.md|sunxue.md|tongxue.md|partner.md|sure.md|annaofenpei.md|README.md|LICENSE) continue ;;
  esac
  if [ ! -f "${REF_DIR}/${base}" ]; then
    cp "${f}" "${REF_DIR}/${base}"
    echo "    [新增] ${base}  <-- 仓库中出现了新文档"
    UPDATED=$((UPDATED + 1))
  fi
done

echo
if [ "${UPDATED}" -gt 0 ]; then
  echo "==> 同步完成，共更新 ${UPDATED} 个文件。"
  echo "    提示：若出现 [新增] 项，建议将其补充到 SKILL.md 的知识来源表中。"
else
  echo "==> 同步完成，内容无变化。"
fi

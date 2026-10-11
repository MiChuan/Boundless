# Boundless

> 余生也有涯，而知也无涯。

一个持续整理的个人思想与方法论笔记集，并提供配套的 **AI Skill**。这里记录的是关于**如何在有限的生命里，用有限的金钱、时间、精力和认知，获得尽可能多的快乐、自由与人生选择权**的思考。

它更像一份不断生长的个人知识库（Personal Knowledge Base），内容会随着阅读、经历和反思持续更新。配套 Skill 让 AI 助手能直接基于这些内容，为你提供结构化的**行动指南与生活决策建议**。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Markdown](https://img.shields.io/badge/docs-Markdown-000000.svg)](https://commonmark.org/)
[![Skill](https://img.shields.io/badge/skill-boundless--advisor-blue.svg)](#-ai-skillboundless-advisor)

---

## 📖 目录

| 文档 | 主题 | 简介 |
| --- | --- | --- |
| [philosophy.md](philosophy.md) | 人生哲学 | 融合多种思想流派，构建一套完整的人生决策框架 |
| [sunxue.md](sunxue.md) | 行动方法论 | 「孙学」：小镇青年的 12 条落地执行清单 |
| [partner.md](partner.md) | 关系与择偶 | 关于吸引力、约会与择偶标准的排序笔记 |
| [boundless-advisor/](boundless-advisor/) | AI Skill | 可安装到 AI 编辑器的决策顾问 Skill |

---

## 📚 内容概览

### [philosophy.md](philosophy.md) — 融合多思想的完整人生哲学

把六种思想放在同一个模型里讨论，并划分出**认知、身体、消费、处世、生命观**五个层次：

- **孙学、黄毛理论** —— 如何提升自己，以及怎样不被外界评价牵着走
- **薄肌理论、性压抑理论** —— 身体、欲望、自信与亲密关系
- **田忌赛马式消费** —— 怎样分配有限的钱，让每一分钱产生更高价值
- **李伯清的快乐经济** —— 赚钱究竟是为了什么（十六字方针：**耍中找钱，找钱来耍，找耍结合，以耍为主**）
- **上善若水、顺其自然** —— 什么时候进取，什么时候顺势，什么时候放手
- **生也有涯，知也无涯** —— 时间与注意力有限时，该学什么、追求什么、放弃什么

文末给出一份可当作**每月复盘清单**的个人生活决策框架，覆盖事业、身体、行动、金钱、快乐、关系、变化、时间八个模块。

核心结论：

> **尽力而为，不强求一切；持续进步，不与所有人竞争；认真赚钱，也认真生活。**

### [sunxue.md](sunxue.md) — 孙学：小镇青年落地执行版

从一场四小时的对谈中浓缩出的 12 条行动建议，主题包括：把数据投喂给 AI、建立自己的信息库、零成本套利免费额度、把人生当游戏体验、走出去看世界、用自媒体记录、去全球找价差、顺势而为、大胆做异类等。

### [partner.md](partner.md) — 恋爱与择偶笔记

以排序形式整理的个人观察笔记，包含吸引力要素排序、脱单难度城市排序、约会地点推荐度排序、约会流程，以及结婚择偶标准的优先级。

---

## 🗂 仓库结构

```text
Boundless/
├── README.md                    # 本文件
├── philosophy.md                # 融合多思想的完整人生哲学
├── sunxue.md                    # 孙学：小镇青年落地执行版
├── partner.md                   # 恋爱与择偶笔记
├── boundless-advisor/           # 配套 AI Skill
│   ├── SKILL.md                 #   技能主入口（决策流程与触发规则）
│   ├── references/              #   知识快照（离线可用）
│   │   ├── philosophy.md
│   │   ├── sunxue.md
│   │   └── partner.md
│   └── scripts/
│       └── sync-knowledge.sh    #   从本仓库同步最新知识
├── LICENSE                      # MIT License
└── .gitignore
```

---

## 🚀 使用方式

仓库内容均为纯 Markdown 文本，可被任意编辑器或 Markdown 阅读器直接打开：

- **在线阅读**：直接点击对应文件的 GitHub 页面
- **本地阅读**：克隆到本地后用任意 Markdown 编辑器打开

```bash
git clone https://github.com/MiChuan/Boundless.git
cd Boundless
```

---

## 🧭 AI Skill：boundless-advisor

把本仓库的思想体系打包成了一个可安装的 Skill。安装后，你可以直接用自然语言询问人生规划与生活决策问题，AI 会按结构化的六步流程给出建议。

### 它能做什么

| 场景 | 示例提问 |
| --- | --- |
| 职业与行动 | 「我该不该辞职创业？」「怎么规划未来五年？」 |
| 金钱与消费 | 「钱不够花，该怎么分配？」「这笔钱该不该花？」 |
| 处世与心态 | 「我总在意别人怎么看」「学不完，很焦虑」 |
| 生命观 | 「赚钱到底为了什么？」「工作太累，没时间生活」 |
| 关系 | 「择偶应该看重什么？」 |

### 工作方式

Skill 内置一条 **六步决策流程**：定位问题类型 → 追问关键信息 → 用四资源模型（时间/精力/金钱/认知）拆解 → 用八模块框架定位 → 给出可执行建议 → 收束成一句判断。

知识来源为 `references/` 下的三份文档快照，**离线可用**；也可运行脚本同步仓库最新内容：

```bash
bash boundless-advisor/scripts/sync-knowledge.sh
```

### 安装

**方式一：使用 WorkBuddy**

在 WorkBuddy 中导入 `boundless-advisor` 目录（或 `.skill` 包）即可，Skill 会自动被识别。

**方式二：Cursor**

将 `boundless-advisor` 目录放入项目的 skills 目录：

```bash
# 项目级（推荐，随项目共享）
mkdir -p .cursor/skills
cp -r boundless-advisor .cursor/skills/

# 或全局安装
mkdir -p ~/.cursor/skills
cp -r boundless-advisor ~/.cursor/skills/
```

**方式三：Codex / 其他支持 Skill 的工具**

这些工具遵循通用的 Skill 规范（`SKILL.md` + 资源目录）。将 `boundless-advisor` 整个目录复制到对应工具的 skills 目录即可：

```bash
# 通用做法：克隆仓库后复制 skill 目录
git clone https://github.com/MiChuan/Boundless.git
cp -r Boundless/boundless-advisor <你的工具的 skills 目录>/
```

> Skill 本质是一个纯文本目录，不依赖任何编译产物。若你的工具只支持上传压缩包，可自行打包：
> `cd boundless-advisor && zip -r ../boundless-advisor.zip .`

---

## 📝 写作约定

为保证良好的阅读与渲染体验，仓库内所有文档遵循以下规范：

- 使用标准 **CommonMark** 语法
- **中英文与数字之间加空格**，中文标点使用全角
- 引用先哲原文与核心结论统一使用引用块（`>`）
- 对比性内容优先使用表格，并列内容优先使用列表
- 文件末尾保留一个换行符
- 所有文档通过 Markdown 语法校验，无告警
- `boundless-advisor/SKILL.md` 的 frontmatter 仅使用标准字段（`name`、`description`、`license`、`metadata`），以保证跨平台兼容

---

## 🤝 贡献

本仓库以个人记录为主，暂不接受内容类 Pull Request。

如果你发现了**格式问题、错别字或失效链接**，欢迎通过以下方式反馈：

1. 提交 [Issue](https://github.com/MiChuan/Boundless/issues) 说明问题
2. 或直接提交 Pull Request 修正

提交前请确保改动符合上述「写作约定」。

---

## 📄 许可

本项目采用 [MIT License](LICENSE) 授权，Copyright (c) 2026 CodeAnt。

---

<div align="center">

**余生也有涯，而知也无涯。**

</div>

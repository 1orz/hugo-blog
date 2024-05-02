---
title: "如何正确的书写Git Commit"
slug: "how-to-write-git-commit-properly"
description: "  - 让你的Git Commit更加规范"
date: 2024-04-18T14:21:54+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [笔记]
tags: [Git]
---

## 前言

啊🤔 马上毕业面临找工作= =，然后上课发呆。突然想起来工作室的一位前辈去腾讯实习期间积累下的一些知识，并传授给了我们。然后就有了这次的博文：如何正确且规范的书写Git Commit。一直想记在博客里来着。最近一堆没用的破事儿压着我喘不过气。好在这次趁着闲下来，凭借几年前的记忆以及搜集到的知识整理好书写如下。

先上干货:

## Git Commit规范

直接上干货，Git Commit规范的格式如下：

```plaintext
feat: 表示引入了新功能或功能改进。

docs: 表示文档的变更，如更新文档或添加注释。

style: 表示代码风格的变更，如格式调整、空格和缩进的修改，但不涉及功能修改。

refactor: 表示代码重构，既不修复错误也不添加新功能。

test: 表示添加或修改测试。

chore: 表示与构建过程或辅助工具相关的变更，如修改构建脚本、配置文件等。

```

## 为什么要写规范的Git Commit

先说现在存在的痛点。

拿一个我的反面例子来说：

![junk-commit-msg](junk-commit-msg.png)

文档: 为一些代码增加了一些文档。

这还算基本合格，至少你还能通过commit msg能看出大致干了什么。但是有时候我们会遇到更糟糕的情况，

比如我直接在`Github`上在线编辑某个仓库中的某一段代码，顺带直接`commit`。默认情况下，`Github`缺省`commit comment`是update xxx(文件名)

刚开始几天可能觉得没什么。等过了几天你就忘了你`update`了啥。或者堆了一堆`Commit`, `message`都是通篇的`update xxx`。

痛点来了!! = =

如果恰好这时候你想让你的仓库想回溯到某个版本，你就会发现前面提到的痛点：你根本不知道你`update`了啥。这时候你就会后悔当初为什么不写一个规范的commit message 来规避这个问题

## Git Commit规范的好处

- 有助于团队协作，提升团队效率。
- 有助于代码的维护, 追踪, 回滚, 审查, 发布, 迭代, 管理, 规范, 整洁, 可读性, 可维护性, 可扩展性, 可测试性, 可靠性, 稳定性, 安全性, 性能, 质量, 效率, 可用性。(让ChatGPT帮我想了一些词)

## Git Commit规范的实践

未完待续 没时间写= =

## Git Commit规范的工具

未完待续

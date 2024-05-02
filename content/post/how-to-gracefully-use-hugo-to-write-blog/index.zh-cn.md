---
title: "如何优雅使用Hugo撰写博客"
slug: "how-to-use-hugo-gracefully-when-write-blog"
description: "- 让你优雅的写博客，从此不再痛苦"
date: 2024-03-27T17:51:18+08:00
lastmod: 2024-03-28T17:13:15+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [Hugo]
tags: [Hugo, Typora, Github Pages, Git, Markdown]
---
## 前言

最近经常在挤时间来写博客 :(因为在忙校招双选会嘛...投了几家中意的而且符合自身实际的岗位。面试前恶补一些以前立下的Flag..欠下的总是要还的..)

+ 吐槽一下学校的双选会: ~~依托答辩~~ 太好了! 63个席位全是名企!感觉我已经手拿40个offer,全球前500强任我挑选~! 我们普通`本科`软件工程专业的学生真的是: `前程似锦`，`乾坤未定`，你我皆是~~牛~~黑马! `稳了!` `都他妈稳了!` ~~(反串)~~

而且对我来说。写博客时并非一直文思汹涌，而是经常在某个时间点突然有了灵感，然后想赶紧趁思路热乎记录下来。所以我需要一个能够`快速撰写`，`并发表`博客的工具。而`Hugo`就是这样一个工具:

其采用Markdown写作，轻量化，纯静态，快速部署，主题丰富，插件丰富，社区活跃，甚至可以不需要服务器，直接托管部署在 `Github Page`上等等..这也是我为什么选择Hugo的原因

如你所见，这篇文章就是用Hugo写的。主题采用的是[hugo-theme-stack](https://github.com/CaiJimmy/hugo-theme-stack). 这是一个非常简洁，却又功能强大的主题，正合我意。

至于痛点，列出几个:

## 现存问题

> 多平台撰写时同步的问题

目前只列出两个出来我想到的，后续再补充:

+ 这里特指的是在不同设备上写博客的问题。比如在电脑上写了一半，然后出门在外，在公交车/路上突然来灵感手机上继续写。这时候就需要一个同步的工具，来加载之前的步骤.
+ 在 `Windows`上写和 `Mac`上写受限于系统环境问题，会有一点点不一致。比如 `Windows`上的换行符和 `Mac`上的换行符不一样。需要一个工具来处理这个问题,这里参考我上一篇博客:[点击直达](https://blog.cloudorz.com/post/configure-zsh-for-windows-terminal/)

下面我将带你一步一步解决上述问题，让你从此可以~~优雅的使用Hugo撰写博客~~

## 步骤

> 由于这篇文章主要介绍双平台，所以我会尽量保持平台无关性。但是在某些步骤上，除非有特别需要时，我会特别指出 `Windows`和 `macOS`的区别，否则默认为通用步骤。

### 安装Hugo

概述: Hugo是一个用Go语言编写的 `高性能`~~我说的~~静态网站生成器。它可以将 `Markdown`文件转换为 `HTML`文件，然后部署到服务器上。

> 如果你已经阅读了我的上一篇博客 [配置Windows Terminal 的zsh + Oh-My-Zsh! [非WSL]](https://blog.cloudorz.com/post/add-unix-likes-preference-on-windows/). (强烈建议) 的话，那么在 `Windows`和 `macOS`上安装Hugo将会非常简单。直接往下看。

```bash
# macOS
brew install hugo

# Windows
choco install hugo -confirm
```

就这么简单，现在不出意外的话，你的电脑就已经有 `Hugo`了。

### 安装Git

概述: Git是一个分布式版本控制系统，用于跟踪文件的更改。

e .. 这个不多说了，如果你还不会(??????). 没关系，你可以参考我的上一篇博客 [配置Windows Terminal 的zsh + Oh-My-Zsh! [非WSL]](https://blog.cloudorz.com/post/add-unix-likes-preference-on-windows/)

### 安装Typora-VSCode插件

概述: Typora是一个轻量级的Markdown编辑器，支持实时预览。VSCode是一个非常强大的编辑器，支持多种语言，插件丰富。二者结合起来，可以让你在写作时更加得心应手。

这个插件是我最近才发现的，非常好用。它的官网是[这里](https://typora.io/ "官网")。安装VSCode的[Typora插件](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-typora)后会进一步提升你的写作体验。

### 未完待续

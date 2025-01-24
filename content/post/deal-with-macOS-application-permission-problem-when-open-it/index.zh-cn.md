---
title: "解决macOS提示下载的文件已损坏，打不开的问题"
description: '- 这来自macOS该死的"安全"机制'
slug: "deal-with-macOS-application-permission-problem-when-open-it"
date: 2023-11-03T16:20:39+08:00
lastmod: 2023-11-01T16:20:39+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: ["macOS"]
tags: ["macOS"]
---
## 起因

`macOS`最通常的安装软件方法就是下载 `xxx.dmg`文件，双击挂载镜像->拖入Application的快捷方式->Dock找到安装的软件，~~原神~~，启动！开箱即用舒服的很。

但是打开时提示 `xxx已损坏，打不开。您应该将它移到废纸篓`

## 解决方案

打开终端，输入

```bash
xattr -cr /Applications/xxx.app
```

回车，问题解决。

## 问题原因

`macOS`的安全机制会对下载的文件进行检查，如果文件没有被签名，或者签名不对，就会提示 `已损坏`。这个时候就需要手动去除 `quarantine`属性。

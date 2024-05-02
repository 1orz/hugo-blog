---
title: "在小米12Pro (zeus) 上使用KernelSU"
slug: "use-kernelsu-on-xiaomi12-pro-zeus"
description: "- 替代Magisk, 隐藏Root"
date: 2023-12-12T15:58:43+08:00
lastmod: 2024-03-28T11:11:11+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [Android]
tags: [XiaoMi12-Pro, Zeus, KernelSU, Recovery, Root, LSPosed]
---

## 前言

Magisk已经玩腻了。继Magisk v23.x以后，Magisk的作者topjohnwu加入了Google，`Magisk Hide`被移除，这会导致我 为了体验新版本带来的特性时，不得不使用升级到后续的Magisk版本带来的其他弊端：很多对环境安全要求比较高的App无法在手机上运行。典型的例子就是一些`银行App` 直接无法打开，交管12123会出现一些问题。虽然后续有了Magisk Delta(现已更名为Kitsune Mask) 但毕竟非Magisk主分支。不确定是否有一天会停止开发带来的一段时间内没有好的替代方案出现。所以我决定转向使用KernelSU。

## 关于KernelSU

KernelSU 是 Android GKI 设备的 root 解决方案，它工作在内核模式下，直接在内核空间向用户空间应用程序授予 root 权限。

详情请见 [官方文档](https://kernelsu.org/guide/what-is-kernelsu.html)

## 安装KernelSU

这里只介绍在小米12Pro 基于HyperOS Android14 上安装KernelSU的方法。其他设备请参考[官方文档](https://kernelsu.org/guide/installation.html)。

### 准备工作

+ 小米12Pro 确认代号为 `zeus` 已经解锁 `Bootloader`
+ 有adb和fastboot 且驱动安装正确
+ 前往Github Release页面下载 [KernelSU](https://github.com/tiann/KernelSU/releases),这里我根据手机当前的`内核版本号`(关于本机页面查看)选择了`AnyKernel3-android12-5.10.177_2023-07.zip`
+ 前往[Sourceforge](https://sourceforge.net/projects/recovery-for-xiaomi-devices/files/zeus/)下载TWRP Recovery。 截止到`2024-03-28T11:09:17+08:00` 最新版本为`twrp-3.7.1_12-v8.6_A14-zeus-skkk.img`
+ 前往[Github Release](https://github.com/tiann/KernelSU/releases)下载`KernelSU Apk` 并安装

### 具体步骤

1.手机进入`Fastboot`模式刷入`TWRP Recovery`

```bash
fastboot flash recovery_ab twrp-3.7.1_12-v8.6_A14-zeus-skkk.img
```

2.重启到Recovery

```bash
fastboot reboot recovery
```

现在您应该处于TWRP Recovery界面。

3.进入adb sideload模式

在TWRP Recovery界面，点击`Advanced高级`->`ADB Sideload`->`Swipe to Start Sideload`，现在您的手机已经进入了adb sideload模式。

4.使用adb sideload刷入KernelSU

```bash
adb sideload AnyKernel3-android12-5.10.177_2023-07.zip
```

5.重启手机

现在您应该可以看到已经成功的刷入了KernelSU。

## 后续功能完善

至于在Maigisk中使用的一些功能，比如`LSPosed`，等各种模块，绝大部分模块都是互相兼容的。只是有一些模块需要额外的做法：
比如Magisk提供的zygisk

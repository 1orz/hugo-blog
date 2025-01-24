---
title: "使用KernelSU / KernelSU Next"
slug: "use-ksu-on-your-device"
description: "- 新的基于内核级的Root方案"
date: 2023-12-12T15:58:43+08:00
lastmod: 2025-01-17T17:02:49+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [Android]
tags: [XiaoMi, Redmi, KernelSU, KernelSU Next, Recovery, Root, LSPosed]
---

## 前言

~~Magisk已经玩腻了。继Magisk v23.x以后，Magisk的作者topjohnwu加入了Google，`Magisk Hide`被移除，这会导致我为了体验新版本带来的特性时，不得不使用升级到后续的Magisk版本带来的其他弊端：很多对环境安全要求比较高的App无法在手机上运行。典型的例子就是一些`银行App` 直接无法打开，`交管12123`会出现无法过人脸识别问题。虽然后续有了Magisk Delta(现已更名为Kitsune Mask) 但毕竟非Magisk主分支。不确定是否有一天会停止开发带来的一段时间内没有好的替代方案出现。所以我决定转向使用KernelSU。~~

2025年了，如今[Apatch](https://github.com/bmax121/APatch)和新发布的[KernelSU Next](https://github.com/rifsxd/KernelSU-Next) 也相继进入大众眼中，成为了新的Root解决方案。这里我将介绍如何在小米12Pro上使用[KernelSU](https://github.com/tiann/KernelSU) / [kernelSU Next](https://github.com/rifsxd/KernelSU-Next)。

## 关于KernelSU / KernelSU Next

KernelSU 是 Android GKI 设备的 root 解决方案，它工作在内核模式下，直接在内核空间向用户空间应用程序授予 root 权限，但是自v0.9以后，放弃了对非GKI设备的支持。这导致一些设备无法使用KernelSU。详情见 [官方文档](https://kernelsu.org/guide/what-is-kernelsu.html)

KernelSU Next 是 KernelSU 的一个分支，它在KernelSU的基础上增加了一些新的特性，比如支持直接在Magic Mount和OverlayFS切换，相比于KernelSU它同时支持及GKI/非GKI设备。详情见 [官方文档](https://rifsxd.github.io/KernelSU-Next/)

## 安装KernelSU / KernelSU Next

二者安装方法基本一致，无非两种：

- 直接修补现有的boot镜像(LKM模式，简单方便)
- 编译内核时集成KernelSU(KernelSU Next)(GKI模式)

  本文二者均介绍，这里以小米12Pro(支持GKI) 基于HyperOS Android 14 上安装KernelSU / KernelSU Next 为例。

### 准备工作

- 小米12Pro 确认代号为 `zeus` 已经解锁 `Bootloader`
- 有adb和fastboot 且驱动安装正确
- 前往Github Release页面下载 [KernelSU](https://github.com/tiann/KernelSU/releases) Apk安装包并安装。
- 系统设置-系统更新中找到自己的系统版本号，随后到[HyperOS Fans](https://www.hyperos.fans/zh/devices/zeus) 找到自己对应版本的`卡刷包`的下载链接，为提取`boot.img`做准备。
- 安装Payload Dumper工具，用于提取`boot.img`。[Payload Dumper](https://github.com/5ec1cff/payload-dumper) 这个版本是`5ec1cff`的版本，有两个新特性：
  - 直接从包含 payload.bin 的 zip 档案中提取分区，而无需解压它。
  - 直接从网络中包含payload.bin的URL（比如OTA更新URL）提取分区，而无需下载整个文件。

### 具体步骤

#### LKM模式

先介绍直接修补现有的boot镜像(LKM模式)的方法。

1. 安装[Payload Dumper](https://github.com/5ec1cff/payload-dumper)

    ```bash
    pip install git+https://github.com/5ec1cff/payload-dumper
    ```

2. 下载&提取boot镜像

    ```bash
    # usage: payload_dumper --partitions <partitions you need> <file path or url>
    payload_dumper --partitions boot --out . xx.zip
    ```

    你会在当前目录下看到一个`boot.img`文件。

3. 修补boot镜像

    把上一步提取出的`boot.img`文件通过你喜欢的方式传输到手机中，用KernelSU / KernelSU Next修补，虽有你会在/sdcard/Download 下看到一个`kernelsu***-patched.img`文件,回传到电脑中。

4. 手机重启到`Fastboot`模式刷入修补后的`boot.img`镜像

    ```bash
    fastboot flash boot kernelsu***-patched.img
    ```

5. 重启手机

现在您应该可以看到已经成功的刷入了KernelSU / KernelSU Next。

#### GKI模式

篇幅有限，我为此特地维护了一个仓库 直接下载`Github Actions`编译的img文件刷入即可：[KernelSU-Next-For-Zeus](https://github.com/1orz/android-gki-custom/actions)

## 后续功能完善

至于在Maigisk中使用的一些功能，比如`LSPosed`，等各种模块，绝大部分模块都是互相兼容的。只是有一些模块需要额外的做法：
比如Magisk内置的`zygisk`功能 在KernelSU / KernelSU Next中无法使用，需要使用`ZygiskNext`，详情见 [ZygiskNext](https://github.com/Dr-TSNG/ZygiskNext)

## 附录

- TWRP Recovery For XiaoMi12-Pro [Sourceforge](https://sourceforge.net/projects/recovery-for-xiaomi-devices/files/zeus/)

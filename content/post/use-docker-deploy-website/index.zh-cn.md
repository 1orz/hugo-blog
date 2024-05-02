---
title: "使用Docker定制化自己博客基础环境"
slug: "use-docker-depoly-your-website"
description: "- 无非就是在造重复的轮子啦OvO"
date: 2023-10-31T15:20:39+08:00
lastmod: 2023-11-01T16:20:39+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [docker,docker-compose]
tags: [docker,docker-compose]
---

## 前言

本文将主要介绍 为什么选用`docker`和`docker-compose`作为搭建本站的基础环境的原因及其详细方法。提供一些思路给建站初学者。

## 起因

最初是为了解决环境的问题。从5年前野路子学来的`lnmp.org`一键搭建(目前似乎已经被收购？)，到宝塔面板一键部署环境。似乎(不是)都是一个~~很好~~的选择。毕竟都是人家已经写好的嘛= =,可供自己定制化发挥的空间太小。你所使用的功能，都是他们已经高度`集成化`、`模块化`、`一键化`、`懒人化`的。况且他们的产品定位大多是服务于政企网站。实现低运维的愿景。这与个人博客的 `技术选型激进性`，`高可折腾性`的目标背道而驰的XD。so自己动手，丰衣足食！

## 实现目标

用于快速的构建常用开发语言所需要的运行时或开发环境（基于服务）。并且能`统一管理`各服务的状态，`轻量化`配置服务，`简化`数据备份流程，`方便`本地调试及`跨平台`迁移、部署。

已实现的服务：

+ Nginx/Caddy -- Web服务器
+ PHP(Only FPM) -- 世界上最好的语言(确信)
+ MySQL -- 数据库
+ Redis -- 缓存
+ Gitea -- 代码托管
+ Portainer -- Docker管理工具
+ phpMyAdmin -- 数据库管理工具

## 工具介绍及其安装

为什么使用docker及其docker-compose？

在使用docker之前，我们来介绍一下docker和docker-compose的概念。

### 什么是Docker?

>容器是在主机上运行的沙盒进程，与该主机上运行的所有其他进程隔离。 这种隔离利用了内核命名空间和 cgroup，这些功能在 Linux 中已经存在很长时间了。 Docker 使这些功能变得平易近人且易于使用。 总而言之，容器：

+ 是图像的可运行实例。 您可以使用 Docker API 或 CLI 创建、启动、停止、移动或删除容器。
+ 可以在本地机、虚拟机上运行，也可以部署到云端。
+ 是可移植的（并且可以在任何操作系统上运行）。
+ 与其他容器隔离并运行自己的软件、二进制文件、配置等。
如果您熟悉 chroot，那么可以将容器视为 chroot 的扩展版本。 文件系统来自图像。 然而，容器增加了使用 chroot 时不可用的额外隔离。

-- 来自[Docker官方文档](https://docs.docker.com/get-started/#what-is-a-container)

### 什么是Docker-compose

>Docker-Compose 是一个帮助您定义和共享多容器应用程序的工具。 使用 Compose，您可以创建一个 YAML 文件来定义服务，并且使用单个命令就可以启动或拆除所有内容。
使用 Compose 的一大优点是您可以在文件中定义应用程序堆栈，将其保存在项目存储库的根目录中（现在是版本控制的），并轻松地让其他人为您的项目做出贡献。 有人只需要克隆您的存储库并使用 Compose 启动应用程序。 事实上，您现在可能会在 GitHub/GitLab 上看到不少项目正是这样做的。

-- 来自[Docker官方文档](https://docs.docker.com/get-started/08_using_compose/)

### docker的安装

> 安装的详细说明可参考[官方文档](https://docs.docker.com/get-docker/)

快速安装：在安装前确保已经卸载了旧版本的docker。且假定操作系统为Ubuntu/Debian/CentOS

> Tips: 鉴于国内网络环境，如果遇到下载缓慢问题。你使用国内镜像源安装docker，例如移步到[北京外国语大学的镜像源](https://mirrors.bfsu.edu.cn/help/docker-ce/)。

```bash
# 可选，设置镜像源
export DOWNLOAD_URL="https://mirrors.bfsu.edu.cn/docker-ce"
# 如您使用 curl
curl -fsSL https://get.docker.com/ | sudo -E sh
# 如您使用 wget
wget -O- https://get.docker.com/ | sudo -E sh
```

### docker-compose的安装

> 可参考[Docker-compose安装-官方文档](https://docs.docker.com/compose/install/)

快速安装：使用包管理器。

```bash
# Ubuntu/Debian
sudo apt install docker-compose
# CentOS
sudo yum install docker-compose
```

## 使用docker-compose构建基础环境

这里开始介绍如何使用docker-compose构建基础环境。

### 代码拉取

```bash
git clone https://git.cloudorz.com/mt/server.git --depth=1
```

### 服务配置

这里需要配置一些服务的配置文件。这里以`Caddy`为例。

### 启动服务

按需启动服务。这里以启动`Caddy`+`PHP`+`MySQL`+`phpMyAdmin`为例。

```bash
docker-compose up -d caddy php-fpm-82 mysql phpmyadmin
```

随后查看服务状态

```bash
docker-compose ps
```

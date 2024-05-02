---
title: "Use Docker Depoly Website"
slug: "use-docker-depoly-your-website"
description: Tech save the world!
date: 2023-10-31T15:20:39+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [docker,docker-compose]
tags: [docker,docker-compose]
---

# Introduction
This article will primarily introduce the reasons for choosing `docker` and `docker-compose` as the foundation for setting up this website's environment and provide a detailed method for doing so. It provides some insights for beginners in website development.

# Background
Initially, the motivation was to address environmental issues. From using the "lnmp.org" one-click setup I learned from the wild five years ago (which seems to have been acquired?), to using the Baota panel for one-click deployment of environments. It seems (not really) to be a ~~good~~ choice. After all, they are pre-built by others, right? However, the space for customization and personalization is too small. The functions you use are already highly integrated, modular, one-click, and user-friendly. Moreover, their products are mostly aimed at serving government and enterprise websites, aiming for low maintenance. This is quite the opposite of the "technological radicalness" and "high customizability" goals of a personal blog. So, do it yourself to make a living!

# Goals
Quickly build the runtime or development environment (based on services) required for common development languages and be able to "unify management" of the status of each service, "simplify" service configuration, "simplify" data backup processes, "facilitate" local debugging and "cross-platform" migration and deployment.

Services needed:

+ Nginx/Caddy - Web server
+ PHP (Only FPM) - The best language in the world (believe it)
+ MySQL - Database
+ Redis - Cache
+ Gitea - Code hosting
+ Portainer - Docker management tool
+ phpMyAdmin - Database management tool

## Technology Choices
Why use docker and docker-compose?

Before using docker, let's introduce the concepts of docker and docker-compose.

### What is Docker?

> A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI. You can also use Compose, and you can also use Compose to define a multi-container application. To define the services, you can use a single command to start or dismantle all the content.

-- From [Docker Official Documentation](https://docs.docker.com/get-started/#what-is-a-container)

### What is Docker-compose?

> Docker-Compose is a tool that helps you define and share multi-container applications. With Compose, you can create a YAML file to define services, and use a single command to start or dismantle all content.

-- From [Docker Official Documentation](https://docs.docker.com/get-started/08_using_compose/)

### Installing Docker

> Detailed installation instructions can be found in the [official documentation](https://docs.docker.com/get-docker/).

> Tips: Due to the network environment in China, if you encounter slow downloads, you can install Docker using a domestic mirror source, for example, visit [Beijing Foreign Studies University's mirror source](https://mirrors.bfsu.edu.cn/help/docker-ce/).

Quick installation: Before installing, make sure you have uninstalled old versions of Docker. Assuming the operating system is Ubuntu/Debian/CentOS.

```bash
# Optional: Set mirror source
export DOWNLOAD_URL="https://mirrors.bfsu.edu.cn/docker-ce"
# If you use curl
curl -fsSL https://get.docker.com/ | sudo -E sh
# If you use wget
wget -O- https://get.docker.com/ | sudo -E sh
```
### docker-compose的安装


>参考[Docker-compose安装-官方文档](https://docs.docker.com/compose/install/)

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
---
title: "Windows10/11 配置 OpenSSH Server 以及密钥登陆"
slug: "configure-openssh-server-on-windows-with-private-key-authentication"
description: "密钥登陆更安全"
date: 2024-04-16T09:56:35+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [Windows11]
tags: [OpenSSH, Windows, SSH, Windows10, Windows11]
---

## 前言

Windows 10/11 自带了 OpenSSH Server，可以通过 PowerShell 安装和配置。本文将介绍如何配置 OpenSSH Server 以及如何使用密钥登陆。

## 安装 OpenSSH Server

1. 打开 PowerShell 以管理员身份运行。
2. 运行以下命令安装 OpenSSH Server：

```powershell
Add-WindowsFeature -Name OpenSSH-Server
```

3. 运行以下命令启动 OpenSSH Server：

```powershell
Start-Service sshd
```

4. 运行以下命令设置 OpenSSH Server 开机自启：

```powershell
Set-Service -Name sshd -StartupType 'Automatic'
```

5. 运行以下命令检查 OpenSSH Server 是否已经启动：

```powershell
Get-Service sshd
```

## 配置 OpenSSH Server

1. 打开 PowerShell 以管理员身份运行。
2. 运行以下命令生成密钥对，如果已经有密钥对可以跳过这一步，密钥有这几种类型：`rsa`, `dsa`, `ecdsa`, `ed25519`，这里使用 `ed25519`：

```powershell
ssh-keygen -t ed25519
```

3. 将你的将公钥添加到 `~/.ssh/authorized_keys` 文件中。

4. 编辑 `sshd_config` 文件

```plaintext
PasswordAuthentication no # 这一步是为了禁止密码登陆。确保安全性。
PubkeyAuthentication yes # 启用密钥登陆
```

> 特别注意！！与Linux下的OpenSSH Server不同，在Windows OpenSSH中，默认的授权密钥存放位置为ProgramData\ssh\administrators_authorized_keys，推荐vscode打开ProgramData\ssh\sshd_config，修改以下条目.注释掉默认授权文件位置，确保以下条目被注释掉

```plaintext
# Match Group administrators
#       AuthorizedKeysFile __PROGRAMDATA__/ssh/administrators_authorized_keys
修改完成后保存并退出(注意修改sshd_config需要管理员权限)。
```

7. 在PowerShell(管理员)中重启sshd服务

```powershell
Restart-Service sshd
```

## 连接

没啥说的了吧。你肯定会了

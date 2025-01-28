---
title: "为 Git 配置 GPG 签名"
slug: "configure-gpg-sign-for-git"
description: "- 从此让你的 Git 提交/追溯更加安全"
date: 2024-03-29T20:32:12+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [git]
tags: [git, gpg, trace]
---

## 前言

在 Git 中，GPG 签名是一种非常重要的安全机制，它可以确保提交的真实性，防止提交被篡改。本文将介绍如何为 Git 配置 GPG 签名。

## 生成 GPG 密钥

首先，我们需要生成 GPG 密钥。如果你已经有 GPG 密钥，可以跳过这一步。

    ```bash
    gpg --full-generate-key
    ```

接下来，按照提示输入你的姓名、电子邮件地址和密码。生成密钥后，可以使用以下命令查看密钥列表：

    ```bash
    gpg --list-secret-keys --keyid-format LONG
    ```

## 配置 Git 使用 GPG 签名

首先，我们需要查询 GPG 密钥的id：

    ```bash
    gpg --list-secret-keys --keyid-format=long
    ```

随后将你的密钥告知git：

    ```bash
    git config --global user.signingkey <GPG_KEY_ID>
    ```

然后，我们需要告诉 Git 使用 GPG 签名提交：

    ```bash
    git config --global commit.gpgsign true
    git config --global tag.gpgSign true
    ```

## 配置 Git 使用 GPG 签名追溯

如果你想要在 Git 中使用 GPG 签名追溯，可以使用以下命令：

    ```bash
    git config --global log.showSignature true
    ```

## 结语

至此，你已经成功为 Git 配置了 GPG 签名。从此，你的 Git 提交/追溯更加安全。祝你使用愉快！

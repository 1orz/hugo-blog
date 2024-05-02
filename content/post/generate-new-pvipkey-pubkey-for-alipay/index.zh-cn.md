---
title: "支付宝当面付-公钥私钥生成"
slug: "generate-new-pvipkey-pubkey-for-alipay"
description: "- 谁还用官方的生成工具啊= ="
date: 2024-01-16T16:42:05+08:00
lastmod: 2024-03-28T11:15:37+08:00
image: 
math: 
license: 
hidden: false
comments: true
draft: false
categories: [alipay]
tags: [alipay, openssl]
---

## 步骤

1. 生成`私钥`。注意：私钥需要保存好，不要泄露。

    ```bash
    openssl genpkey -algorithm RSA -out private_key.pem
    ```

2. 从上述`私钥`中导出`公钥`。注意：公钥需要上传到支付宝开放平台，不要泄露`私钥`。

    ```bash
    openssl rsa -pubout -in private_key.pem -out    public_key.pem
    ```

3. 上传`公钥`上传到支付宝开放平台.获取`支付宝公钥`。

4. 将第一步获取到的`私钥` 和`支付宝公钥`配置到项目中即可。

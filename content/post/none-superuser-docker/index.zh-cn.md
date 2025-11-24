---
title: "Linux 非root用户使用Docker"
slug: "none-superuser-docker"
description: "  -非root用户使用Docker"
date: 2025-11-24T08:55:59+08:00
image:
math: false
license: false
hidden: false
comments: true
draft: false
categories: ["Linux", "Docker"]
tags: ["Linux", "Docker"]
---

## 背景

Docker 默认安装时只有 `root` 用户能访问 Docker daemon。  
将当前用户加入 `docker` 组后，Docker CLI 会通过 unix socket `/var/run/docker.sock` 以组权限访问 daemon。

---

## 操作步骤

在终端执行以下命令：

```bash
# 1. 创建 docker 用户组（如果它不存在）
sudo groupadd docker

# 2. 将当前用户加入 docker 组
sudo usermod -aG docker $USER

# 3. 让组权限立即生效（不用重启）
newgrp docker

# 4. 验证配置是否成功
docker ps
```

---

如果上面第 4 步输出容器信息或空表（没有报 “permission denied”），说明配置成功。

---

### 可选：如果还是不生效

如果你执行 `docker ps` 仍然提示需要 `sudo`，说明 shell session 未刷新。可以：

```bash
# 登出再登录，或重新连接 SSH
exit
# 然后重新登录，再执行
docker ps
```

---

### 安全提示

把用户加入 `docker` 组，就等价于赋予了 **root 权限** —— 因为任何能访问 Docker daemon 的人都能执行宿主机任意命令。挂载宿主机文件系统。即：你可以为所欲为。
请只对受信任用户、开发机器使用，不建议在共享服务器上这么配置。

---

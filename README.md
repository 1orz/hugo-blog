# Blog Source Code
Sync my blog source code with GitHub.

Welcome to my personal [blog](https://blog.cloudorz.com)

+ Visit: https://blog.cloudorz.com.

## Instructions 简介

Here is My Blog Source Code, You can visit my blog at [here](https://blog.cloudorz.com).

这里是我的博客文章源码, 你可以在[这里](https://blog.cloudorz.com)访问我的博客。

## Deploy 部署

### 1.Clone Repo and Initialize Submodule

```bash
# Highly recommend to use gh-cli to clone this private repository

gh repo clone hugo-blog
cd hugo-blog
bash init.sh

# Now youcan write your own article in content/post....
```

### 2.Push or Publish

+ Build and Deploy

```bash
bash push.sh <commit message>
```

+ Publish Only (With Git Push Action)

```bash
bash publish.sh
```

## Additions 附加

### Pull Submodule

```bash
git submodule init themes/hugo-theme-stack
git submodule update
```

### Clean All History Commit

```bash
bash push.sh clean
# This will be clean all history commit, and push to github repo with "refactor: clean history commits." commit message.
```

### Normal Push

```bash
bash push.sh "Commit Message"
# This will be push to github repo with "Commit Message" commit message.
```
#!/bin/bash

USER=root
HOST=cloudorz.com
DIR=/root/server/data/wwwroot/blog

push() {
    echo -e "\033[33m  Now Compile and Pushing Blog Source Code to Web Server.. \033[0m \n"
    if [[ "$(uname)" == "MINGW"* ]]; then
        echo -e "\033[31m  You are Now using Windows OS!!!  Please use WSL or Linux OS to run this script. \033[0m \n"
        echo -e "\033[33m  Skipping Push for Windows System... \033[0m"
        exit 1
    fi
    hugo && rsync -a --delete public/ ${USER}@${HOST}:${DIR}
    if [ $? -eq 0 ]; then
        echo -e "\033[32m  Succeed to Compile and Pushing Blog Source Code to Web Server! \033[0m \n"
    else
        echo -e "\033[31m  Failed to Compile Or Pushing Blog Source Code to Web Server.. \033[0m \n"
    fi
}

echo -e "\033[33m  Fetching Hugo Theme with git submodule command. \033[0m \n"
git submodule init themes/hugo-theme-stack
git submodule update
[ $? -eq 0 ] && echo -e "\033[32m  Succeed to Fetch Hugo Theme with git submodule command. \033[0m \n" || echo -e "\033[31m  Failed to Fetch Hugo Theme with git submodule command. \033[0m \n"

if [[ "$*" == *"clean"* ]] || [[ "$*" == *"clear"* ]] ; then
    git checkout --orphan temp_branch &&
        git add . &&
        git branch -D main &&
        git branch -M main &&
        git commit -am "refactor: clean history commits." &&
        git push --set-upstream origin main --force
    echo -e "\033[32m  History Commit Cleaned Successfully! \033[0m \n"
    push
    exit 0
fi

git add .
[ -z "$1" ] && git commit -am "docs: Add new Posts." || git commit -am "$1" &&
    git push origin main
if [ $? -eq 0 ]; then
    echo -e "\033[32m  Git push Succeed! \033[0m \n"
    hugo && rsync -a --compress --delete public/ ${USER}@${HOST}:${DIR}
    if [ $? -eq 0 ]; then
        echo -e "\033[32m  Succeed to Compile and Pushing Blog Source Code to Web Server! \033[0m \n"
    else
        echo -e "\033[31m  Failed to Compile Or Pushing Blog Source Code to Web Server.. \033[0m \n"
    fi
else
    echo -e "\033[31m  Failed to Push changes with git.. Maybe try it later will be fine.. \033[0m \n"
fi
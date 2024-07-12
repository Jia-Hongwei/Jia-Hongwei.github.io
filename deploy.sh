#!/usr/bin/env sh
# 确保脚本抛出遇到的错误
set -e
npm run build # 生成静态文件
cd docs/.vuepress/dist # 进入生成的文件夹

# deploy to github
echo 'Jia-Hongwei.github.io.git' > CNAME
if [ -z "$GITHUB_TOKEN" ]; then
  msg='deploy'
  githubUrl=git@github.com:Jia-Hongwei/Jia-Hongwei.github.io.git
else
  msg='来自github action的自动部署'
  githubUrl=https://Jia-Hongwei:${GITHUB_TOKEN}@github.com:Jia-Hongwei/Jia-Hongwei.github.io.git
  git config --global user.name "jiahongwei"
  git config --global user.email "1095514902@qq.com"
fi
git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github
#
## deploy to coding
#echo 'www.jia.com\njia.com' > CNAME  # 自定义域名
#if [ -z "$CODING_TOKEN" ]; then  # -z 字符串 长度为0则为true；$CODING_TOKEN来自于github仓库`Settings/Secrets`设置的私密环境变量
#  codingUrl=git@git.dev.tencent.com:jia/jia.git
#else
#  codingUrl=https://jia:${CODING_TOKEN}@git.dev.tencent.com/jia/jia.git
#fi
#git add -A
#git commit -m "${msg}"
#git push -f $codingUrl master # 推送到coding
#
#cd -
#rm -rf docs/.vuepress/dist

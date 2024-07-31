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
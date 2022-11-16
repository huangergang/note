#/bin/bash
git add .
read -p "请输入提交描述信息:  " message
git commit -m "$message"
git push

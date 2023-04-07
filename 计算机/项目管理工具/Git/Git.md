# Git

Git 是一个分布式版本控制及源代码管理工具 

https://git-scm.com/docs 官方文档

## 1.版本控制

​	版本控制系统就是根据时间来记录一个或多个文件的更改情况的系统。

## 2.分布式版本控制

**在程序设计中，分布式版本控制（英语：distributed revision control 或 distributed version control，又译为分布式版本控制），又称去中心化版本控制（decentralized version control），是一种版本控制的方式，它允许软件开发者可以共同参与一个软件开发项目，但是不必在相同的网络系统下工作。其作法是在每个开发者电脑中复制一份完整的代码库以及完整历史。因此在无法连接网络时，仍可以进行软件的分支及合并，可以加速大部分的作业，增加此情形可以进行的工作，而且系统的代码库可以在多家电脑上备份，不需靠单一位置的备份。而多个位置的代码库再透过其他机制来达到同步。**

**以分布式版本控制方法，作出的软件版本控制系统，称为分布式版本控制系统（distributed revision control system，缩写为DRCS，或是distributed version control system，缩写为DVCS）。著名的分布式版本控制系统有Monotone、Git等。**

## 3.三个区

**工作区**

**暂存区**

**Git库**

## 4.命令

```bash
# 初始化git本地仓库
git init  	

# 推送文件到暂存区
git add file.txt         	# 把工作区的file.txt推到暂存区
git add .			        # 把工作区的所有文件推到暂存区
# 查看暂存区状态
git status
# 查看提交信息
git log
git log --pretty=oneline      # 提交信息只显示一行
# 提交
git commit -m "提交描述"
git commit -am "提交描述"      # 直接提交所有文件


# 从暂存区移除文件
git restore --staged <file>   # 一点一点移除
git reset HEAD <file>  		  # 取消上次操作

# 回退版本
git reset --hard HEAD^ 		  # ^ 指回退一个版本
git reset --hard HEAD^^
git reset --hard HEAD~n		  # 回退n个版本
git reset --hard "版本标识"                                                                                                                                         # 回退到指定标识的版本，用git log 产看标识信息
git reflog       			  # 查看所有日志

# 从仓库拉取文件
git checkout <file>
git rm <file>  # 删除仓库文件，会将工作区文件一起删除
# 产看仓库文件
git ls-files


# 推送远程仓库
git remote add origin "url" 	# 绑定远程仓库
git push -u roigin master       # 本地全部记录推送远程
git push


# 本地分支
git checkout <name>    			 # 切换指定分支
git checkout -b <new_branck>     # 创建新分支并切换
git branch -d <name>             # 删除分支
git branch 						 # 查看所有分支
git merge  branch				 # 合并分支
git branch -m|-M <old_name>  <new_name>   # 重命名分支，-M强制重命名

# 远程分支
git branch -a                   # 查看本地与远程分支
git push origin name_branch		# 推送本地分支到远程
git push origin :name_branch	# 删除远程分支（保留本地分支）
git checkout -b <loc_name_branch> origin/name_branch			# 拉取指定远程分支并在本地创建分支
git fetch    				# 获取远程最新状态
```

### 强制推送远程（不建议）

```bash
git push -u origin master -f
```

 

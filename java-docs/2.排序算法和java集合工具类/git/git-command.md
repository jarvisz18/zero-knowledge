## Git实用命令

#### 1远程仓库相关命令  

````shell script
检出仓库: $ git clone  git://github.com/jquery/jquery.git  
查看远程仓库: $ git remote -v  
添加远程仓库: $ git remote add [name][url]  

删除远程仓库: $ git remote rm [name]  
修改远程仓库: $ git remote set-url --push[name][url] 
拉取远程仓库: $ git pull [remoteName][localBranchName]  
推送远程仓库: $ git push [remoteName][localBranchName]  
````

#### 2.git比较两个分支的文件的差异

````shell script
显示出所有有差异的文件列表: $ git diff branch1 branch2 --stat
显示指定文件的详细差异:   $ git diff branch1 branch2 文件名(带路径)
显示出所有有差异的文件的详细差异:  $ git diff branch1 branch2 
````

#### 3.常用命令

````shell script
git branch -D master develop  删除本地库develop
git checkout -b dev  建立一个新的本地分支dev
git merge origin/dev 将分支dev与当前分支进行合并
git checkout dev 切换到本地dev分支
git remote show 查看远程库

git add .
git rm文件名(包括路径) 从git中删除指定文件
git clone git://github.com/schacon/grit.git  从服务器上将代码给拉下来
git config --list  看所有用户
git Is-files  看已经被提交的
git rm [file name]  删除一个文件
git commit -a 提交当前repos的所有的改变
git add [file name]添加一个文件到git index 

git commit -v  当你用- v参数的时候可以看commit的差异
git commit -m "This is the message describing the commit"  添加commit信息
git commit -a -a是代表add,把所有的change加到git index里然后再commit
git commit-a-v 一般提交命令
````

#### 4.撤销git commit的内容

````shell script
git reset --soft HEAD^  撤销commit, 但是不撤销add动作
git reset --hard HEAD^  撤销commit, 并且撤销add动作
git reset HEAD <文件名>  撤回add动作
git checkout .          丢弃本次修改的内容
````

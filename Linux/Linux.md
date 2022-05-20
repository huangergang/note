#                GNU/Linux

## 1.初步认识

### 000.操作系统认识

> 操作系统是可以与用户交互，扩展应用程序的东西。

### 001.Linux操作系统的认识及开源

> 世界上流行的操作系统：**Windows、Linux(服务器端)、Unix(政府机关、研究所)**

> 开源：开放源代码    
>
> **Android**   **Google Pixel**

> **Linux（发行版）**：**Ubuntu、Red hat、Kali、CentOS、Arch....**

### 002.开源一定免费？

> Red hat：普通用户免费，企业用做商用收费

### 003.Linux用途及发行版

>Linux kernel（Linux 内核最早的作者----›Linus Torvalds)

> Linux 运行在企业的服务器上、大型计算机、超级计算机、嵌入式、路由器.....

> Debian—>Ubuntu、Kali、Deepin、Raspberry Pi OS（树莓派官方操作系统）....
>
> Fedora—>CentOS、Red hat、Linpus（来自台湾）...
>
> openSUSE

## 2.Ubuntu 20.04

### 004.Ubuntu 安装

> Desktop----界面版      Server----服务器版

> VMware虚拟机
>
> VMware Tools   使用物理映射
>
> 更改国内镜像

### 005.一些设置

### 006.XXXXX

### 007.其他发行版安装

> 选择它的发行版进行安装

### 008.CentOS

> 自行百度（-_-）

## 3.步入Linux世界

### 001.Linux四大组成部分

> **1.Linux kernel (内核)**
>
> **2.GNU工具**
>
> **3.GUI Desktop环境**
>
> **4.Application**

### 002.GNU/GUI---------系统组成

> GUI 界面程序
>
> GNU 命令---------Shell
>
> 可以在GUI下和Shell中操作软件、编辑文件

### 003.Linux kernel 组成部分

> Linux kernel： 
>
> * 硬件设备    (鼠标、显示器.....)
> * 软件程序  （系统）-----操作、管理进程
> * 系统内存  （内存分配、调度）
> * 文件管理    (保存、删除、修改) 

### 004.文件系统

> 文件系统：**读和写的标准**
>
> 种类格式：NTFS、ext、ext2、ext3、ext4、tmtps......

``` shell
df -T   #  (查看文件格式)
```

### 005.GNU核心

> GNU组织为Linux写了一些软件

> 1.GNU核心：
>
> * Unix上的一些命令和工具，被移植到了Linux上。
>
> * 这套工具：coreutils coreutilities 软件包，操作文本、处理文本、管理进程
>
> 2.Shell
>
> shell：图形界面（GUI）      命令行界面（CLI）
>
> CLI：Command Line Interface

### 006.Shell-----CLI/GUI

> CLI   Shell

> bash Shell

> 第三方: ash、korn、tcsh、zsh

### 007.GUI Desktop

> GUI：
>
> * X Windows----
> * KDE----macOS
> * GNOME-----Red hat
> * Unity（并非一个桌面套件）-----Ubuntu

## 4.Shell 命令

### 001.CLI准备

> Terminal-----终端  (字体、声音、颜色......自行设置)

### 002.ev4

显示当前目录下所有文件、文件夹（不包括隐藏文件）

``` shell 
ls
```

显示隐藏文件

``` shell
ls -a
```

### 003.xxx

> **~**     表示当前用户home/目录

> **$**      表示等待用户输入

### 004.Linux参数

显示

``` shell
ll
```

查询命令用法 man + 命令所查询命令用法

``` shell
man 命令
```

> 翻页键----page up  | page down

退出

``` shell
q
```

中文Linux命令查询网站

``` 
https://wangchujiang.com/linux-command/
```

> **蓝色是文件夹      白色是文件**

###  005.根目录

> 没有盘符的概念    一切皆文件

 ``` shell
 cd                 #   (切换目录)
 ```

>  **/**      （正斜线）  表示最根目录

``` shell
cd /               #   (切换到根目录)
```



``` shell
cd ..              #  (返回到上一级目录)
```

**根目录解析**

<img src="..\Linux\Linux目录.png" style="zoom:100%;" />

* **/bin**    二进制文件目录，二进制文件可以直接运行，存放GNU工具，命令....
* **/cdrom**  光盘
* **/etc**    系统配置目录
* **/home**   显示所有用户目录，主目录
* **/lib、/lib32、/lib64**      存放系统库目录，依赖
* **/lost+found**    断电存放
* **/mnt**    挂载目录，U盘、外在设备（显示在此目录）
* **/proc**    伪文件系统
* **/run**    零时运行目录
* **/snap**  ..........................沙盒
* **/tmp**    零时文件目录
* **/var**     可变文件，日志......
* **/boot**   存放启动时所需文件目录
* **/dev**    设备目录-----硬件设备
* **/media**   媒体目录，挂载目录
* **/opt**    可选目录，安装第三方软件
* **/root**   管理员， root用户目录，权限最高
* **/sbin**    系统二进制目录，高级管理员GNU工具
* **/srv**      服务目录
* **/usr**      普通用户二进制目录

> **FHS**  ------   文件系统层级标准
>
> 标准制定、规定网站
>
> ``` 网站
> pathname.com/fhs
> ```

### 006.cd命令

>  **cd**   切换当前工作目录

> 
>
> ``` shell
> cd /home/turing
> ```

> 
>
> ``` shell
> #   . 表示当前目录     
> #   ..  表示上上一层目录
> 
> cd ../..  #   返回上上一层目录
> ```
>
> 
>
> ``` shell
> pwd    # 显示当前目录
> ```

### 007.ctrl

> 
>
> ``` shell
> ctrl + c    # 强制退出
> ```

> Ctrl+ Shift+c     复制
>
> Ctrl+Shift+v      粘贴

### 008.绝对路径

> 全路径

### 009.相对路径

> 相对当前目录的路径

 ### 010.gedit

> ``` shell
>gedit  路径      # （打开文件）
> ```

### 011.练习

### 012. ls 

> ``` shell
>ls -F -R              #  (-F 区分文件)（-R 重新遍历）
> ```

>
>
>****

> 参数的顺序无所为

> ls 过滤文件
>
> ``` shell
> ls -l wenjian_* .txt       # (多个名子相似的文件，* 表示任意多个字符，？表示一个字符)
> ```

> 文件扩展匹配符过滤
>
> ``` shell
> ls *.pdf
> ls *.txt
> .....
> ```

> 范围过滤
>
> ``` shell
> ls -l f[a-z]ck.txt  
> ls -l f[!a-z]ck.txt    #  (非)
> ```

### 013.touch

> 创建文件
>
> ``` shell
> touch name.txt      #  (创建空文件并更新时间)
> ```
>
> 组合命令
>
> ``` shell
> cd ../ && ls        #  (切换目录并显示所有文件)
> ```

### 014.cp

> 复制、覆盖文件（更新目标文件时间）
>
> **cp   (源文件) （目标文件）**
>
> ``` shell
> cp -i 1.txt 2.txt           # （-i 提示用户）
> ```
>
> **把doc文件夹复制到Down下，-r表示连同文件夹一起复制，遍历**
>
> ``` shell
> cp -r /home/turing/Documents/doc /home/turing/Download/
> ```
>
> 
>
> ``` shell
> cp -r 1.txt /home/turing/Download/               # (把文件复制到文件夹)
> ```

### 015.cp练习

> 练习........................
>
> ``` shell
> cd -                      # 返回上一个操作目录
> ```

### 016.光标移动

> Tab 键补全

> Ctrl + 方向键 （可以跳单词）

> Ctrl + a          （跳到命令开头）

> Ctrl + e            (跳到命令结尾)

> Ctrl + h            (退格键)

> Ctrl + r             (搜索以使用命令)

> Ctrl + k            (删除光标之后所有字符)

> Ctrl + u            (删除光标之前所有字符)

### 017.lnk链接文件

> 软链接（符号链接）----类似Windows快捷方式
>
> 改了名字影响软链接
>
> 
>
> 硬链接----类似于文件副本

### 018.软链接和硬链接

软链接

> 
>
> ``` shell
> ln -s 1.java 1_linkfile
> ```

硬链接

> 
>
> ``` shell
> ln 1.java 1_linkfile
> ```

> 硬链接只能在同一块硬盘中创建

> **不能cp一个链接文件** 

### 019.注意事项

> Symboilc   links

### 020.mv重命名、移动文件

> 
>
> ``` shell
> mv oldname.c newname.c
> ```

> 
>
> ``` shell
> mv file <要移动到的路径>
> ```

> 
>
> ``` shell
> cd !$         # 移动到上一个命令的最后一个路径
> ```

### 021.rm删除文件

> 
>
> ``` shell
> rm <file>
> ```

> 
>
> ``` shell
> rm -i <file>      #   (提醒你是否删除)
> ```

**<font color="red">最危险命令</font>**

> ``` shell
>rm -rf /*        #   (删除所有) 
> ```

### 022.创建文件和删除文件

> make directories 创建文件夹
>
> ``` shell
> mkdir <文件夹名>
> ```
>
> 
>
> ``` shell
> mkdir -p <多级文件夹>
> ```

> 删除文件夹
>
> ``` shell
> rm <文件夹>
> ```

### 023.文件类型

> 查看文件类类型
>
> ``` shell
> file <文件>
> ```

> 判断是否为文件夹
>
> ``` shell
> file <文件夹>
> ```

### 024.查看文件

> 用于比较短的文件
>
> ``` shell
> cat  <文件>
> ```
>
>  将文件中的回车替换为$，Tab替换为^I
>
> ``` shell
> cat -A <文件>
> ```
>
> 按页的方式查看文件
>
> 空格向上，B向下
>
> ``` shell
> more <文件>
> ```
>
> 按页的方式查看文件
>
> ``` shell
> less <文件>
> ```
>
> **：/字符 ** -----》可以查看文件中的字符

### 025.tail和head

> 指定文件末尾若干行
>
> ``` shell
> tail <file>                   # （显示最后10行）
> ```
>
> 
>
> ``` shell
> tail -n <number> <file>          # (显示最后number行)
> ```
>
> 指定文件开头若干行
>
> ``` shell
> head <file>                      # (显示开头10行)
> ```
>
> 
>
> ``` shell
> head -n <number> <file>         # (显示开头number行)
> ```

## 5.更上一层Shell

### 001.任务管理器

> 进程管理、各种服务、内存使用情况、网络数据传输监测

### 002.Linux中的进程管理 System Monitor

> 显示系统进程服务
>
> ``` shell
> top 
> ```
>
> 报告用户当前使用进程状态
>
> ``` shell
> ps
> ```
>
> **Linux PID** ----> 进程ID
>
> ``` shell
> ps -aux | grep named   # 查看named进程详细信息 
> ```
>
> 
>
> ``` shell
> ps -l
> ps -A
> ```

### 003.kill

> 强制终止进程
>
> ``` shell
> kill <PID>
> ```

### 004.挂载

> **挂载：插上U盘显示虚拟盘符**
>
> **Linux自动挂载目录为  /media/user/USB**

### 005.mount

> 更改挂载目录   U盘、光盘...... 
>
> ``` shell
> sudo mount 挂载点 目标挂载点  
> sudo nmount 挂载点            # （删除挂载点）
> ```
>
> 挂载的是分区

> 挂载隐患、自动挂载

### 006.Android挂载

>  **自动挂载目录-------/run/user/1000**

### 007.df和du

> 
>
> ``` shell
> df -h   #  (查询所有磁盘空间)
> ```
>
> 
>
> ``` shell
> du -h   #  (当前目录磁盘使用情况)
> ```

### 008.sort file

> 
>
> ``` shell
> sort   file   #  (按字符排序展示)
> ```
>
> 
>
> ``` shell
> sort -n file   #（按数字大小排序）
> ```
>
> 
>
> ```shell
> sort -nr  file   #（按数字大小倒序）
> ```
>
> 
>
> ``` shell
> sort -M   file.log       #  (按月份正排序)
> ```
>
> 
>
> ``` shell
> sort -Mr  file.log      #   (按月份倒序)
> ```
>
> 
>
> ``` shell
> du -sh * | sort -nr
> ```

### 009.grep 搜索

> 字符搜索
>
> ``` shell
> grep <所搜索字符> file
> ```

### 010.压缩归档解压缩

| 压缩软件 | 后缀 |
| -------- | ---- |
| gzip     | .gz  |
| zip      | .zip |
| bzip2    | .    |

> ``` shell
>tar     #    打包
> ```
> 
> ``` shell
>tar -zvcf <newname> 文件夹     #  (打包后，用gzip压缩)
> ```
>
> ``` shell
> tar -zxvf  file      # (解压)
> ```

## 6.父子Shell

### 001.父子shell

> ``` shell 
>bash       # 运行一个shell
> ```

### 002.分号；的作用

>  ```shell
>ls ; pwd ; cd /     # (依次执行)
>  ```
>  
>  ``` shell
>（ls ; pwd ; cd / ）        #  （创建一个子shell执行）
>  ```
>
>  ``` shell
>  echo $BASH_SUBSHELL      #   (查看是否创建了子shell)
>  ```

### 003.sleep和jobs

> ```shell
>sleep <number>    # (延迟执行number秒)
> ```
> 
> ```shell
>sleep number&    # (挂载后台)
> ```
>
> ```shell
> jods       #（查看后台进程）
> ```
>
> ```bash
>jobs -l    #（查看后台进程PID）
> ```

### 004.后台用法举例

### 005.coproc协程

创建子shell挂载

> ```shell
>coproc  turing { sleep 10; }
> ```

### 006.外部命令和内建命令

> 有些命令不单独创建一个进程，有些则要创建一个进程。

> ``` shell
>ps -f
> ```
> 
> **PPID**  **基于谁创建的 PID**

> 查看命令是否为外部命令或内建命令
>
> ```shell
> type <命令>
> ```

### 007.alias别名

> ```shell
>history   # (查看历史命令)
> ```
> 
> **所有历史命令保存在 ./bash_history/**
>
> ```shell
>!number   # (历史命令行号)
> ```

> 修改命别名
>
> ```shell
> alias -p
> ```
>
> 例子
>
> ```shell
> alias li='ls -i'
> ```

## 7.环境变量

### 001.环境变量是什么

>  **环境变量是在任意目录下都可以直接运行此软件**

### 002.全局变量和局部变量

windows

>  **系统变量：切换变量照样可以用**
>
>  **用户变量：仅此用户应用**

Linux

>  **全局变量： **

> ```shell
>printenv  # (显示所有全局环境变量)
> ```
> 
> ```shell
>printenv  <环境变量>
> echo      <环境变量> 
>```
> 
> ```shell
> $HOME=/home/user
> ```

> **set为局部变量**

### 003.用户变量和局部变量的设定

> ```shell
>america="us"   #  (设定局部变量)
> ```
> 
> 局部变量只能在所创建的shell中使用， 子shell中不可用，shell销毁则变量销毁。
>
> 全局变量用大写（单词之间用下划线隔开），局部变量、用户变量用小写。

### 004.定义全局变量

> ```shell
>export america="us"
> ```
> 
> **shell销毁则销毁**

> 销毁全局变量
>
> ```shell
> unset <全局变量>
> ```

> 如果在子shell中删除，只会删除子shell中的，不对父shell中的全局变量产生影响

### 005.默认的全局变量

> 自行百度或自己看

### 006.设置系统路径

> ```shell
>PATH=:/home/user/Projext/
> ```
> 
> Project/下的所有软件都可以在Terminal中直接运行

### 007.永久配置系统变量

>  ubuntu---    ~/.bashrc
>
> ​                      ~/.bash_profile
>
> ​                      ~/.profile
>
> ​                      ~/.bash_login

> **必须在文件中通过编辑器直接改**

> 不同的发行版配置文件不同

## 8.安装软件

### 001.PMS和软件安装

> PMS---->包管理系统
>
> 软件安装、更新、卸载......

> 不同发行版PMS不同

> PMS消除了工具依赖
>
> 工具：dpkg、rpm
>
> dpkg：apt-get、apt-cache

### 002.安装、更新、卸载

> ```shell
>apt  list    # (查看安装软件)
> ```
> 
> ```shell
>sudo apt update   #  （查询更新）
> ```
>
> ```shell
> sudo apt upgrade    #  (一键更新)
> ```
>
> ```shell
>sudo apt remove <软件名>  # （卸载软件）
> ```

### 003.其他发行版

> Red Hat
>
> ```shell
> yum list
> ```

### 004.安装第三方软件

***thefuck项目***

> baidu.com
>
> 看文档

## 9.用户和权限

### 000.含义和作用

> Linux：用用户修改权限
>
> > 用户ID------UID
> >
> > ```shell
> > cat /etc/passwd  (查看用户)
> > ```
> >
> > 该文件中有大量    系统账户<500
> >
> > ​                                x------加密

> 查看用户密码（加密）
>
> ```shell
> sudo cat /etc/shadow
> ```
>
> 密码过期

### 001.添加用户、删除、更改

> 添加用户
>
> ```shell
> sudo useradd <>
> ```
>
> 删除用户
>
> ```shell
> sudo userdel <>
> ```
>
> 更改密码
>
> ```shell
> sudo passwd <user>
> ```
>
> ``` shell
>chpasswd < passed.txt  (读txt文件设置密码)
> ```
> 
> 设置其他参数
>
> ``` shell
>chage 
> ```

### 002.group组

> Linux组：共享资源、共享权限
>
> 组ID：GID
>
> ``` shell
> tail /etc/group  # (组文件)
> ```
>
> ```shell
>sudo groupadd    # (创建组)  
> ```
> 
> ``` shell
>usermod          #（添加进组）
> ```
>
> ``` shell
> groupmod         # （修改组）
> ```
>
> ```shell
>groupdel         #  (删除组)
> ```

### 003.文件和文件夹权限

***d代表文件夹    -代表文件***

***r代表可读        w代表可写***

***x代表可执行***

***rwxr-xr-x***

***rwx 组创始人权限***

***r-x 组下属成员权限***

***r-x 其他组成员权限***

### 004.chmod修改权限

> ```shell
>chmod ugo-r file.txt
> ```
> 
> 百度学习 （0__0）
>
> 磁盘管理    (0__0)

## 10.vim

### 001.vim介绍

> Linux 常见编辑器：vi、namo、emacs、vim
>
> vim---vi improed
>
> CentOS---vi

### 002.简单使用

> 两种模式：普通模式、插入模式
>
> ESC   i  建切换模式
>
> shift+：输入命令
>
> w保存  q退出

### 003.移动

命令模式下：H J K L 控制移动

### 004.翻页

> PageUP   
>
> PageDown
>
> Ctrl+f  向下一页
>
> Ctrl+b   向上一页
>
> Ctrl+e   
>
> Ctrl+y
>
> G  移动到最后一行
>
> gg 移动到开头

### 005.不同方式编辑文本及跳跃单词

> **i 光标的前面插入、**
>
> **a 光标的后面插入、**
>
> **o 下一行插入、**
>
> **x 删除光标处的字符 、**
>
> **dd 删除一行、**
>
> **u 撤销**
>
> **dw 移除光标首字母的单词**
>
> **b 跳跃单词首字母**
>
> **e 跳跃单词最后**
>
> **w 跳跃单词先跳下个单词首字母**
>
> **shift w 大跳**
>
> **shift  b、e、w  大跳** 

### 006.跳跃行首尾

**shift + 6      ^    跳跃本行开头**

shift  + 4      $    跳到本行末尾

r   -------------------  替换字母

R  -------------------  一直替换

### 007.跳跃大括号

​         {}  

### 008.复制粘贴

dd 可以作剪切

p   把历史删除的粘贴

y  复制

yw    复制一个单词

y$   复制光标后的末尾

>  可视化模式   普通模式下按    v
>
> hjkl
>
> 大  V  复制行
>
> V    gg
>
> o  跳到复制内容的首尾
>
> ctrl   v    矩阵选择
>
> 0 补全角落
>
> vaw  快速选择单词
>
> vab   包含括号
>
> vaB   包含大括号
>
> 缩进  v  +  shift  + <>

​    v + shift +  ~   字母大小写转换

> v   +  U   全部转换成大写
>
> v  +   u   全部转换成小写

### 009.查找文件

/ 字母  回车

n  跳跃

: s/字母/替换字母/g     替换一行

: %s/字母/替换字母/g

: set number   零时现实行号

:number1,number2s/字母/替换字母/g   替换[number1,number2] 之间的字母

:%s/字母/替换字母/gc     提示你是否替换

### 010.配置

``` shell
touch .vimrc
vim .vimrc
```

```bash
set syntax=on

set tabstop=4

set softtabstop=4

set number

set enc=utf-8

set showmatch
```

``` shell
source  .vimrc   # 更新配置
```

行号+gg  跳跃

## 11.server

> **PutTTY**联服务器
>
> 改镜像
>
> ```shell
> ifconfig       #  显示端口
> ```
>
> 安装  ssh  连接
>
> Windows  Terminal 连接
>
> ssh user @IP

> Windows   WSL

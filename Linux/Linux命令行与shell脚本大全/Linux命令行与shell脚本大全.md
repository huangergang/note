# 第一部分  Linux命令行

## 1.初识Linux shell

### 1.1.Linux划分

* Linux内核
* GNU工具
* 图形化桌面环境
* 应用软件

<img src="..\Linux命令行与shell脚本大全\img\Linux系统.png">

### 1.2.内核的功能

* 系统内存管理
* 软件程序管理
* 硬件设备管理
* 文件系统管理

#### 1.2.1.系统内存管理

内核使用硬盘上的存储空间实现虚拟内存，这块区域叫做交换空间。内核不断地在交换空间和实际物理空间之间反复交换虚拟内存中的内容。

<img src="..\Linux命令行与shell脚本大全\img\Linux内存映射.png">

#### 1.2.2.软件程序管理

Linux发行版使用一个表来管理系统开机时要自动启动的进程。这个表位于专门文件/etc/inittab中。

Linux系统有5个运行级。

运行级为1时，只能启动基本的系统进程以及一个控制台终端进程。称为单用户模式。标准的启动运行级是3级，在这个运行级上大多数应用软件都会启动。

运行级5级，允许用户用图形化窗口登录系统。

### 1.2.3.硬件设备管理

Linux内核中两种方法用于插入设备驱动代码：

* 编译进内核的设备驱动代码
* 可插入内核的设备驱动模块

Linux系统将硬件设备当成特殊文件，称为设备文件。设备文件有三种分类：

* 字符型设备文件
* 块设备文件
* 网络设备文件

#### 1.2.4.文件系统管理

Linux内核采用虚拟文件系统作为和每个文件系统的接口。

| 文件系统 | 描述                                              |
| -------- | ------------------------------------------------- |
| ext      | Linux扩展文件系统，最早的Linux文件系统            |
| ext2     | 第二扩展文件系统                                  |
| ext3     | 第三扩展文件系统，支持日志功能                    |
| ext4     | 第四扩展文件系统，支持高级日志功能                |
| hpfs     | OS/2高性能文件系统                                |
| jfs      | IBM日志文件系统                                   |
| iso9660  | ISO  9660文件系统（CD-ROM）                       |
| minix    | MINIX文件系统                                     |
| msdos    | 微软的FAT16                                       |
| ncp      | Netware文件系统                                   |
| nfs      | 网络文件系统                                      |
| ntfs     | 支持Microsoft NT文件系统                          |
| proc     | 访问系统信息                                      |
| ReiserFS | 高级Linux文件系统，能提供更好的性能和硬盘恢复功能 |
| smb      | 支持网络访问的Samba SMB文件系统                   |
| sysv     | 较早期的Unix文件系统                              |
| ufs      | BSD文件系统                                       |
| umsdos   | 建立在msdos上的类Unix文件系统                     |
| vfat     | Windows 95文件系统（FAT32）                       |
| XFS      | 高性能64位日志文件系统                            |

### 1.3.GNU工具

#### 1.3.1.核心GNU工具

* 用于处理文件的工具
* 用于操作文本的工具
* 用于管理进程的工具

#### 1.3.2.shell

GUN为Linux开发了bash shell。

其他一些shell

| shell |                                                              |
| ----- | ------------------------------------------------------------ |
| ash   | 运行在内核受限环境中简单的轻量级shell，与bash shell完全兼容  |
| korn  | 与Bourne shell兼容的编程shell，支持关联数组和浮点运算        |
| tcsh  | 将c语言中的一些元素引入到shell脚本中的shell                  |
| zsh   | 结合了bash、tcsh和kron的特性，同时提供高级编程特性、共享历史文件和主题化提示符的高级shell |

### 1.4.Linux桌面环境

1. X Windiws
2. KDE
3. GNOME
4. Unity

### 1.5.Linux发行版

核心发行版

1. Slackware      最早的Linux发行版之一
2. Red Hat          用于Internet服务器的商业发行版
3. Fedora            从Red Hat分离出的家用发行版
4. Gentoo           为高级Linux用户设计的发行版，仅包含Linux源代码
5. openSUSE      用于商业和家用的发行版
6. Debain 

## 2. 走进shell

### 2.1.CLI

在图形化桌面出现以前，与Unix系统进行交互的唯一方式就是借助有shell所提供的文本命令行界面（Command line interface，CLI）。

图像化终端

终端仿真包

通过登录Linux控制台，进入CLI。

```BASH
$ setterm -inversescreen on  # 将终端的背景设置为白色、文本设置为黑色
$ setterm -inversescreen off # 关闭
```

setterm 选项

| 选项           | 参数                                                  | 描述                                           |
| -------------- | ----------------------------------------------------- | ---------------------------------------------- |
| -background    | black、red、green、yellow、blue、magenta、cyan、white | 将终端的背景色改为指定颜色                     |
| -foreground    | black、red、green、yellow、blue、magenta、cyan、white | 将终端的前景色改为指定颜色                     |
| -inversescreen | off、on                                               | 交换背景色和前景色                             |
| -reset         | 无                                                    | 将终端外观恢复成默认设置并清屏                 |
| -store         | 无                                                    | 将终端当前的前景色和背景色设置成-reset选项的值 |

### 2.2.图形化终端仿真访问CLI

* GNOME Terminal
* Konsole Terminal
* xterm

## 3.基本的bash shell命令

### 3.1.启动shell

/etc/passwd文件包含了所有系统用户账户列表以及每个用户的基本配置信息。每个条目包含7个字段字段之间用冒号隔开。

```bsah
turing:x:1000:1000:alan turing:/home/turing:/bin/bash
```

最后一个字段指定了该用户的默认shell，用户登录成功后默认启动。

### 3.2.bash手册

man命令用于访问Linux系统上的手册页面。手册页由分页程序（pager）来显示。

如查看ls命令:

```bash
$ man ls
```

**手册节名**

| 节            | 描述                       |
| ------------- | -------------------------- |
| Name          | 显示命令名和一段简短的描述 |
| Synopsis      | 命令的语法                 |
| Configuration | 命令的配置信息             |
| Description   | 命令的一般性描述           |
| Options       | 命令的选项描述             |
| Exit Status   | 命令的退出状态指示         |
| Return Value  | 命令的返回值               |
| Errors        | 命令的错误消息             |
| Environment   | 描述所使用的环境变量       |
| Files         | 命令使用到的文件           |
| Versions      | 命令的版本信息             |
| Conforming To | 命令所遵守的标准           |
| Notes         | 其他有帮助的资料           |
| Bugs          | 提交bug的途径              |
| Example       | 展示命令的用法             |
| Authors       | 命令的开发人员信息         |
| Copyright     | 命令源代码的版本状况       |
| See Also      | 与该命令相似的其他命令     |

查找命令

```bash
$ man -k "关键字"

$ man -k treminal   # 与系统相关的命令
```

### 3.3.Linux文件系统

Linux将文件存储在单个目录结构中，这个目录被称为虚拟目录（virtual directory）。

Linux会在根驱动器上创建一些特别的目录，称为挂载点（mount point）。

<img src="..\..\Frank_Linux\img\Linux目录.png"/> 

常见的目录名均基于文件系统层级标准（Filesystem Hierarchy Standard，FHS）。<a href="http://www.pathname.com/fhs">官方主页</a>

### 3.4.cd

cd命令将shell会话切换到另一个目录。

cd命令支持两种参数

* 相对路径
* 绝对路径
* . 单点符表示当前目录
* ..  双点符表示当前目录的父目录

```bash
$ cd /etc

$ cd ..     # 回到上一级目录

$ cd ../..  # 回到上上一级目录

$ cd        # 回到用户目录，root用户为/root
```

### 3.5.pwd

打印当前位置的目录的绝对路径

```bash
$ pwd
```

### 3.6.ls

#### 3.6.1.基本使用

查看当前目录下的文件和文件夹

ls命令输出的列表按字母排序（按列排序）。

```bash
$ ls
```

-F 参数用于区分文件和文件夹

```bash
$ ls -F
```

-a 参数用于显示隐藏文件

```bash
$ ls -a
```

-R 参数会递归的显示所有文件和文件夹

```bash
$ ls -R
```

合并使用

```bash
$ ls -FR
```

#### 3.6.2.显示长列表

-l 参数会显示文件信息，并产生长列表格式输出。

```bash
$ ls -l
```

<img src="..\img\文件信息.png" />

**字段依次表示为：**

* **文件的类型，目录(d)、文件(-)、字符型文件(c)、块设备(b)、链接文件(l)；**
* **文件的权限，三位一组，分别为创建的用户、用户所属的组、其他用户**
* **文件的硬链接总数**
* **文件属主的用户名**
* **文件组的组名**
* **文件的大小（以字节为单位）**
* **文件上次修改的事件**
* **文件名或目录名**

#### 3.6.3.过滤文件

* **？问号代表一个字符**
* ***星号代表0个或多个字符**
* **[a..] 匹配方括号中的单个字符**
* **[a-z] 匹配方括号中的单个字符**
* **[!a]将不需要的字符排除**

--time=atime显示文件的访问时间

```bash
$ ls -l --time=atime Test.java
```

### 3.7.touch

touch命令用于创建空文件

```bash
$ touch Test.java
```

```bash
$ touch 1.java 2.c 3.cpp       # 一次创建多个空文件
```

touch命令可以改变文件的修改事时间。此操作并不改变文件内容。

touch -a 改变文件的访问时间。

### 3.8.cp

复制文件。

基本用法，cp命令需要两个参数——源对象和目标对象

如果源对象和目标对象都是文件，则源文件覆盖目标文夹

```bash
$ cp -i 1.java ../test/          # 复制文件到test目录下
```

-i  参数询问你是否执行此操作。

-R   可以用来复制文件夹及包含的所有文件

```bash
$ cp -R project test/           # project是一个文件夹
```

cp命令可以使用通配符

```bash
$ cp *.java  src/              # 复制所有java文件到src目录下
```

***对于文件名复杂的文件，使用Tab键自动补全文件名称***

### 3.9.链接文件

>  两种类型的文件链接：
>
> * 符号链接
> * 硬链接

要为一个文件创建符号链接，原始文件必须事先存在。链接文件是独立的文件。符号链接的名字位于ln命令的第二个参数位置上。

```bash
$ ln -s file  ln_file
```

创建硬链接。硬链接会创建独立的虚拟文件，其中包含原始文件的信息及位置，它们从根本上而言是同一个文件。引用硬链接等同引用了源文件。

```bash
$ ln file  ln_file
```

### 3.10.mv

mv命令可以重命名文件

```bash
$ mv lod_fileName  new_fileName
```

mv命令移动文件位置

```bash
$ mv file  ~/Document/
```

mv命令移动文件并重命名

```bash
$ mv fileName  ~/Document/fileName
```

mv命令移动整个目录及其内容

 ```bash
 $ mv dir ~/Document/
 ```

### 3.11.rm

删除文件或文件夹。-i参数提示是否真要删除文件。（好习惯）

```bash
$ rm -i file
```

-f 参数越过提示信息直接删除

```bash
$ rm -f file
```

-r 删除目录

```bash
$ rm -r dir
```

删除目录并越过提示

```bash
$ rm -rf dir
```

rm命令支持通配符

### 3.12.mkdir

创建一个空目录

```BASH
$ mkdir dirName
```

创建多级目录

```bash
$ mkdir -p src/java/
```

### 3.13.rmdir

rmdir只能删除空目录。

```bash
$ rmdir project
```

### 3.14.file

file命令可以查看文件的类型和编码。

```bash
$ file ln_file
```

### 3.15.cat

cat命令展示文件的文本内容。

-n参数会对每一行加上行号。

-b参数只对有文本信息的行加上行号。

-T参数用^I字符代替文本中的所有制表符。

### 3.16.more

more命令会显示文本的内容，但会在显示每页数据后停下来。

```bash
$ more file
```

### 3.17.less

less是more的升级版，实现文本前后翻页和支持搜索文本。

```bash
$ less file
```

### 3.18.tail

tail命令会显示文件最后几行的内容，默认为10行。-n参数指定行数。

```bash
$ tail -n 4 logFile
```

或

```bash
$ tail -4 logFile
```

### 3.19.head

head命令会显示文件前几行的内容，默认为10行。-n参数指定行数。

```bash
$ head -n 4 logFile
```

或

```bash
$ head -4 logFile
```

## 4.更多的bash shell命令

### 4.1.ps

ps命令可以输出系统上的所有进程的许多信息。

```bash
$ ps
```

<img src="..\Linux命令行与shell脚本大全\img\ps进程信息.png">

上例输出了进程的ID（Process ID，PID）、它们运行在哪个终端（TTY）以及进程以用的CPU时间。

<hr />

>  ps命令支持3种不同类型的命令行参数：
>
> * Unix风格的参数，前面加单破折线
> * BSD风格的参数，前面不加破折线
> * GNU风格的长参数，前面加双破折线

#### **Unix风格**

| 参数                | 描述                                         |
| ------------------- | -------------------------------------------- |
| -A                  | 显示所有进程                                 |
| -N                  | 显示与指定参数不符的所有进程                 |
| -a                  | 显示除控制进程和无终端进程外的所有进程       |
| -d                  | 显示除控制进程外的所有进程                   |
| -e                  | 显示所有进程                                 |
| -C      *cmdlist*   | 显示包含在*cmdlist*列表中的进程              |
| -G      *grplist*   | 显示组ID在*grplist*列表的进程                |
| -U      *userlist*  | 显示属主的用户ID在*userlist*列表中的进程     |
| -g       *grplit*   | 显示会话或组ID在*grplist*列表中的进程        |
| -p       *pidlist*  | 显示PID在*pidlist*列表中的进程               |
| -s       *sesslist* | 显示会话ID在*sesslist*列表中的进程           |
| -t       *ttylist*  | 显示终端ID在*ttylist*列表中的进程诶          |
| -u      *userlist*  | 显示有效用户ID在*userlist*列表中的进程       |
| -F                  | 显示更多额外输出（相对-f参数而言）           |
| -O      *format*    | 显示默认的输出列以及*format*列表指定的特定列 |
| -M                  | 显示进程的安全信息                           |
| -c                  | 显示进程的额外调度器信息                     |
| -f                  | 显示完整格式的输出                           |
| -j                  | 显示任务信息                                 |
| -l                  | 显示长列表                                   |
| -o        *format*  | 仅显示由*format*指定的列                     |
| -y                  | 不要显示进程标记                             |
| -Z                  | 显示安全标签信息                             |
| -H                  | 用层级格式显示进程（树状，用来显示父进程）   |
| -n       *namelist* | 定义了WCHAN列显示的值                        |
| -w                  | 采用宽输出模式，不限宽度显示                 |
| -L                  | 显示进程中的线程                             |
| -V                  | 显示ps命令的版本号                           |

组合使用

```bash
$ ps -ef
```

<img src="..\Linux命令行与shell脚本大全\img\ps-ef.png" >

* UID：启动这些进程的用户
* PID：进程的进程ID
* PPID：父进程的进程ID
* C：进程生命周期中CPU利用率
* STIME：进程启动时的系统时间
* TTY：进程启动时的终端设备
* TIME：进程需要的累计CPU时间
* CMD：启动的进程名称

采用-l参数，产生长格式输出。

<img src="..\Linux命令行与shell脚本大全\img\ps-l.png">

* F：内核分配给进程的系统标记
* S：进程状态（O代表运行、S代表休眠、R代表可运行和正等待 运行、Z代表僵化（进程已结束但父进程已不存在）、T代表停止。）
* PRI：进程的优先级
* NI：谦让度值用来参与决定优先级
* ADDR：进程的内存地址
* SZ：假如进程被换出，所需交换空间的大致大小
* WCHAN：进程休眠的内核函数的地址

#### BSD风格

| 参数 | 描述                                         |
| ---- | -------------------------------------------- |
| T    | 显示跟当前终端关联的所有进程                 |
| a    | 显示跟任意终端关联的所有进程                 |
| g    | 显示所有的进程，包括进程                     |
| r    | 仅显示运行中的进程                           |
| x    | 显示所有的进程，甚至包括未分配任何终端的进程 |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |
|      |                                              |


**DDL (data definition language)		 数据定义语言 create alter drop show**

**DML (data manipulation language)		 数据操纵语言 insert update delete select**

**DCL (data control language)    					数据库控制语言**

### 1. 基本操作

```SQL
# 显示所有库
show databases; 
#  创建一个库
create database <库名>;
#  显示创建库时的信息
show create database <库名>;
# 删除库
drop database <库名>; 
# 更改字符编码
alter database <库名> charset=<字符编码格式>;
# 使用一个库
use <库名>;
# 显示一个库下所有表
show tables; 
```

### 2. 查看编码

#### 2.1. 查看数据库编码

```SQL
show variables like "%char%";
```

#### 2.2. 查看表编码

```SQL
show create table <表名>;
```

#### 2.3. 查看字段编码

```SQL
show full columns from <表名>;
```

### 3. 修改编码格式

#### 3.1. 修改数据库编码格式

```SQL
alter database <数据库名> character set utf8;
```

#### 3.2. 修改表编码

```SQL
alter table <表名> character set utf8;
```

#### 3.3. 修改字段编码

```SQL
alter table <表名> modify column <字段名> <字段类型> character set utf8;
```

#### 3.4. 一次性设置一张表的所有字段编码

```sql
alter table <表名> convert to character set utf8; 
```

### 4. 主键

#### **4.1. 为字段添加primary key;**

```SQL
alter table <表名> add primary key (字段1,字段2);  
# (确定尽可能为唯一不更改的字段添加主键)如学号,id,身份证号,两个以上为组合键,本质还是一个键   -----推荐主键添加给一个字段
```

#### **4.2. 删除主键**

```SQL
alter table <表名> drop primary key;
```

### 5. 唯一键

**<字段>  <字段类型>  unique;    唯一键 表中可以有多个唯一键,可以为空。保证数据不重复**

#### **5.1. 添加唯一键**

```SQL
alter table <表名> add unique (字段名);
```

#### **5.2. 删除唯一键**

```SQL
alter table <表名> drop index <字段>;
```

### 6. 外键

**foreign key (字段) references 表名(字段);**

**外键 ,前一字段是此表中的它是后一个表中的字段.(关联了) (并发设计禁用外键)**

#### **6.1. 添加外键(建议创建时就添加)**

```SQL
alter table <表名> add foreign key (字段) references <主表名>(字段); 
```

#### **6.2. 删除外键**

```SQL
alter table <表名> drop foreign key  "外键的别名"; # show create table <表名>  查看别名
```

### 7. 数据库设计的完整性(创建表时)

1. **应当有一个主键表示唯一性**
2. **选择合适的数据类型** 
3. **default 设计** 
4. **对外部表的引用**

### 8. 置空和级联

删除数据对其他表的影响

**置空操作---数据变为NULL(外键置空数据)**  

**级联操作---删除，并删除绑定的外键(外键更新数据)**

```SQL
create table <表名>(
...
foreign key(字段) references 主表名(字段) on delete set null on update cascade);  
# 在创建字段时，使其删除时置空,更新时级联.
```

### 9. 事务transaction

#### **9.1. 开启事务**

```SQL
start transaction;
```

#### 9.2. 回滚

```SQL
rollback;
```

#### 9.3. 提交

```SQL
commit;
```

**一旦commit就不能rollback**

#### 9.4. 回滚点

```SQL
savepoint <回滚点>;
```

```SQL
rollback to <回滚点>; # 回滚到设置的回滚点之前
```

#### 9.5. ACID（事务特性）

**atomicity  	     原子性**

**consistency 	  一致性**

**isolation	  	   隔离性**

**durability     	  持久性**

#### 9.6. 只有创建数据库时指定数据库引擎为InnoDB时才可以设置事务

### 10. 索引

**作用：帮助查询数据。**

**缺点：设置索引后，增删改效率变低，占用内存**

#### 10.1. 主键索引（Index Primary Key）

#### 10.2. 普通索引

```SQL
create index <索引名> on <表名>(字段名);
```

#### 10.3. 唯一键索引

```SQL
create unique index <索引名> on <表名>(字段名);
drop index <索引名> on <表名>;
```

### 11. 存储过程

```SQL
delimiter  //  # 设置不以分号为SQL语句执行，在创建存储过程时有用
```

```SQL
create procedure proc()
begin
...
...
...
end //     # 创建存储过程
```

```SQL
call proc();  # 执行存储过程
```

```SQL
drop procedure porc;  # 删除存储过程
```

```SQL
show create procedure porc; # 查看存储过程
```

```SQL
show procedure status \G  # 查看所有存储过程
```

### 12. 一些函数

#### 12.1. number

```SQL
select * from student order by rand() limit 3;   # 抽奖
```

```SQL
ceil(3.1); # 向上取整
round(3.1); # 四舍五入
floor(3.1); # 向下取整
truncate(number,n);  # 对number取n位
```

```SQL
select * from student order by rand();
# 随机排序
```

#### 12.2. string

```SQL
ucase("string"); # 大写
lcase("string"); # 小写
left("string",n); # 从左边截取n位字符串
right("string",n); # 从右边截取n位字符串
substring("string",a,b); # 截取[a,b]位置的字符串 
concat("str1","str2"); # 拼接字符串
```

### 13. 约束规范

#### 13.1. 字段约束

**1.表示是或否的字段必须加is，类型为unsigend tinyint(1)，长度为1。**

```SQL
is_vip  
```

**2.字段为非负数，字段类型设置为unsigend，无符号**

**3.字段名必须为小写字母，不能以数字开头，下划线不能跟数字，多个单词用下划线隔开**

**4.表名不能为名词复数**

**5.主键索引名一般以pk开头**

**6.小数类型禁止用float，double。统一用decimal**

**7.长度较小的字符串类型用char类型。varchar为可变长字符串，当varchar长度超过5000，用text类型。**

**8.一个表里必须有三个字段id，create_time, update_time。*id类型为unsigned bigint。create_time和update_time类型必须为datetime*。**

**9.当一个表是单表，不与其他表id绑定，id必须自增，步长为1。*id为 unsigned bigint 类型*。**

**10.单表超过500万行，数据库容量超过2G要分库分表。**

**11.合理设计每张表**

#### 13.2. 索引约束

**1.唯一索引控制完整性**

**2.不允许两张表以上的join链接**

**3.关联字段必须数据类型相同**

**4.关联查询的字段必须有索引**

**5.varchar上建立索引，必须指定长度**

#### 13.3. SQL语句约束

**1.count(*) 会统计null行**

**2.不能用=null判断字段是否为空，用is null**

**3.不要用外键和级联（并发，集群项目中），在server层实现外键功能**

**4.实际开发过程中不允许使用存储过程，存储过程很难调试，不支持移植**

**5.数据删除修改时，先select看一下**

**6.避免使用in关键字**

**7.数据库编码必须为UTF-8**

#### 13.4. 其它

**1. orm框架查询时不能用*号**

**2. @Transactional**

### 14. mysql数据类型与java数据类型对应表

<img src="..\mysql\image\mysql数据类型域java对应.png">

### 15. 删除记录后主键自增不连续问题

```sql
delete from studentinfo where stuno =5010;
alter table studentinfo AUTO_INCREMENT=5006; 		# 设置从多少开始自增 
```


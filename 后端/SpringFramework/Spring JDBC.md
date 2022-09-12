# Spring JDBC 和 事务

## 1. Spring整合JDBC环境

​		Spring框架除了提供IOC和AOP核心功能外，同样提供了基于JDBC的数据访问功能，使得访问持久层更加方便。

### 1.1. 添加坐标依赖

```xml
<!--  junit测试环境  -->
<dependency>
    <groupId>junit</groupId>
    <artifactId>junit</artifactId>
    <version>4.12</version>
</dependency>

<!--  spring框架模板  -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.2.4.RELEASE</version>
</dependency>

<!--  spring测试环境  -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-test</artifactId>
    <version>5.2.4.RELEASE</version>
</dependency>

<!--  aop  -->
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>1.9.9.1</version>
</dependency>

<!--  springJDBC  -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-jdbc</artifactId>
    <version>5.2.4.RELEASE</version>
</dependency>

<!--  spring事务  -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-tx</artifactId>
    <version>5.2.4.RELEASE</version>
</dependency>

<!--   mysql驱动包  -->
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.25</version>
</dependency>

<!--  c3p0 连接池-->
<dependency>
    <groupId>com.mchange</groupId>
    <artifactId>c3p0</artifactId>
    <version>0.9.5.5</version>
</dependency>

<!--  Spring自动化注入  -->
<dependency>
    <groupId>javax.annotation</groupId>
    <artifactId>javax.annotation-api</artifactId>
    <version>1.3.2</version>
</dependency>


<!--  commons-lang3  -->
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
    <version>3.4</version>
</dependency>
```

### 1.2. 添加jdbc配置文件

在src/resources目录下创建数据库配置文件（db.properties）。

```properties
# 数据库驱动
driver=com.mysql.jdbc.Driver
# 数据库连接
url=jdbc:mysql://localhost:3306/spring_jdbc?useUnicode=true&characterEncoding=utf8
# 用户名
user=root
# 密码
password=123456
```

### 1.3. 设置spring.xml配置文件

```XML
!--  加载properties配置文件  -->
<context:property-placeholder location="jdbc.properties"/>
```

spring.xml

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
                           http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop.xsd
                           http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx.xsd">

    <!-- 开启springIOC自动扫描 -->
    <context:component-scan base-package="com.xxxx"/>

    <!--  加载properties配置文件  -->
    <context:property-placeholder location="jdbc.properties"/>

</beans>
```

### 1.4. 配置数据源

#### 1.4.1. C3P0数据源配置

```xml
<!--   配置C3P0数据源  -->
<bean id="dataSource" class="com.mchange.v2.c3p0.ComboPooledDataSource">
    <property name="driverClass" value="${driver}"/>
    <property name="jdbcUrl" value="${url}"/>
    <property name="user" value="${user}"/>
    <property name="password" value="${password}"/>
</bean>
```

#### 1.4.2. DBCP数据源

TODO

### 1.5. 模板类配置

​		Spring把jdbc中的重复操作建立成一个模板类：org.springframework.jdbc.core.JdbcTemplate

```xml
<!--  配置JdbcTemplate实例，并注入一个dataSource数据源模板类 -->
<bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
    <property name="dataSource" ref="dataSource"/>
</bean>
```

### 1.6. 测试连接

#### 1.6.1. 创建数据表

<img src=".\img\spring_jdbc.png">

#### 1.6.2. 测试类

查询总记录数

```java
public class SpringJdbcTest01{

    
    @Test
    public void testJdbc() {
        
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
        
  		JdbcTemplate jdbcTemplate = (JdbcTemplate) ac.getBean("jdbcTemplate");

        // 定义sql语句
        String sql = "select count(1) from tb_account";

        // 总记录数
        Integer integer = jdbcTemplate.queryForObject(sql, Integer.class);

        System.out.println("总记录数：" + integer);

}
```

#### 1.6.3. 测试封装

Base测试类

```java
@RunWith(SpringJUnit4ClassRunner.class)  // 将测试运行在Spring测试环境中
@ContextConfiguration(locations = {"classpath:spring.xml"})  // 设置要加载的配置文件
public class BaseTest {
    
}
```

子测试类

```java
/**
  *	子测试类继承BaseTest类
  */
public class SpringJdbcTest01 extends BaseTest{

    // 通过Spring注入JdbcTemplate
    @Resource
    private JdbcTemplate jdbcTemplate;

    @Test
    public void testJdbc() {

        // 定义sql语句
        String sql = "select count(1) from tb_account";

        //总记录数
        Integer integer = jdbcTemplate.queryForObject(sql, Integer.class);

        System.out.println("总记录数：" + integer);

    }
}
```

## 2. 持久层账户模块操作

​	crud操作

### 2.1. 账户接口方法定义

#### 2.1.1. 定义实体类

Account.java

```java
public class Account {

    private Integer account_id;
    private String account_name;
    private String account_type;
    private Double money;
    private String remark;
    private Date create_time;
    private Date update_time;
    private Integer user_id;

    public Account() {
    }

    public Account(String account_name, String account_type, Double money, String remark, Integer user_id) {
        this.account_name = account_name;
        this.account_type = account_type;
        this.money = money;
        this.remark = remark;
        this.user_id = user_id;
    }

    public Integer getAccount_id() {
        return account_id;
    }

    public void setAccount_id(Integer account_id) {
        this.account_id = account_id;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getAccount_type() {
        return account_type;
    }

    public void setAccount_type(String account_type) {
        this.account_type = account_type;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Account{" +
                "account_id=" + account_id +
                ", account_name='" + account_name + '\'' +
                ", account_type='" + account_type + '\'' +
                ", money=" + money +
                ", remark='" + remark + '\'' +
                ", create_time=" + create_time +
                ", update_time=" + update_time +
                ", user_id=" + user_id +
                '}';
    }
}
```

#### 2.1.2. 定义接口类

IAccountDao.java

```java
/**
 * 持久层行为定义 接口定义
 * 	1. 添加账户
 * 		添加账户记录，返回受影响的行数
 * 		添加账户记录，返回主键
 * 		批量添加账户记录，返回受影响的行数
 * 	2. 修改账户
 * 		修改用户记录，返回受影响的行数
 * 		批量修改账户记录，返回受影响的行数
 *	3. 删除账户
 * 		删除用户记录，返回受影响的行数
 * 		批量删除账户记录，返回受影响的行数
 * 	4. 查询账户
 * 		查询指定用户的账户总记录数，返回总记录数
 * 		查询指定账户的账户详情，返回账户对象
 * 		多条件查询指定用户的账户列表，返回账户集合
 */

public interface IAccountDao {

    /**
     * 添加账户
     * 添加账户记录，返回受影响的行数
     *
     * @param account
     * @return
     */
    int addAccount(Account account);

    /**
     * 添加账户
     * 添加账户记录，返回主键
     *
     * @param account
     * @return
     */
    int addAccountHasKey(Account account);

    /**
     * 添加账户
     * 批量添加账户记录，返回受影响的行数
     */
    int addAccounts(List<Account> accounts);

    /**
     * 修改账户
     * 修改用户记录，返回受影响的行数
     */
    int updateAccount(Account account);

    /**
     * 修改账户
     * 批量修改账户记录，返回受影响的行数
     */
    int updateAccounts(List<Account> accounts);

    /**
     * 删除账户
     * 删除用户记录，返回受影响的行数
     */
    int deleteAccount(int accountId);

    /**
     * 删除账户
     * 批量删除账户记录，返回受影响的行数
     */
    int deleteAccounts(Integer[] ids);

    /**
     * 查询账户
     * 查询指定用户的账户总记录数，返回总记录数
     */
    int queryAccountCount(int userId);

    /**
     * 查询账户
     * 查询指定账户的账户详情，返回账户对象
     */
    Account queryAccountById(int accountId);

    /**
     * 查询账户
     * 多条件查询指定用户的账户列表，返回账户集合
     */
    List<Account> queryAccountsByParams(int userId, String accountName, String accountType, String createTime);

}
```

#### 2.1.3. 定义实现类

AccountDaoImpl.java

```java
@Repository
public class AccountDaoImpl implements IAccountDao {

    @Resource
    private JdbcTemplate jdbcTemplate;

}
```

### 2.2. 账户记录添加实现

#### 2.2.1. 实现

AccountDaoImpl.java

```java
/**
  * 添加账户记录，返回受影响的行数
  *
  * @param account
  * @return
  */
@Override
public int addAccount(Account account) {
    String sql = "insert into tb_account (account_name,account_type,money,remark,create_time,update_time,user_id) values(?,?,?,?,now(),now(),?)";

    Object[] objs = {account.getAccount_name(), account.getAccount_type(), account.getMoney(), account.getRemark(), account.getUser_id()};

    int row = jdbcTemplate.update(sql, objs);

    return row;
}


   /**
     * 添加账户记录
     * 返回受影响的主键
     *
     * @param account
     * @return
     */
@Override
public int addAccountHasKey(Account account) {

    String sql = "insert into tb_account (account_name,account_type,money,remark,create_time,update_time,user_id) values(?,?,?,?,now(),now(),?)";

    // 获取记录主键
    KeyHolder keyHolder = new GeneratedKeyHolder();

    jdbcTemplate.update(connection -> {
        // 预编译sql语句
        PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        ps.setString(1, account.getAccount_name());
        ps.setString(2, account.getAccount_type());
        ps.setDouble(3, account.getMoney());
        ps.setString(4, account.getRemark());
        ps.setInt(5, account.getUser_id());

        return ps;
    }, keyHolder);

    int key = keyHolder.getKey().intValue();

    return key;
}


   /**
     * 批量添加账户记录
     *
     * @param accounts
     * @return
     */
@Override
public int addAccounts(List<Account> accounts) {

    String sql = "insert into tb_account (account_name,account_type,money,remark,create_time,update_time,user_id) values(?,?,?,?,now(),now(),?)";

    int rows = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
        @Override
        public void setValues(PreparedStatement ps, int i) throws SQLException {
            Account account = accounts.get(i);

            ps.setString(1, account.getAccount_name());
            ps.setString(2, account.getAccount_type());
            ps.setDouble(3, account.getMoney());
            ps.setString(4, account.getRemark());
            ps.setInt(5, account.getUser_id());

        }

        @Override
        public int getBatchSize() {
            return accounts.size();
        }
    }).length;

    return rows;
}
```

#### 2.2.2. 测试

```java
public class SpringJdbcAddTest extends BaseTest{

    @Resource
    private IAccountDao accountDao;

    @Test
    public void testAddAccount(){
        // 准备要添加的数据
        Account account = new Account("账户5","中国银行",4000.0,"绩效奖",3);

        int row = accountDao.addAccount(account);

        System.out.println("添加账户，受影响的行数：" + row);


    }

    @Test
    public void testAddAccountHasKey(){
        // 准备要添加的数据
        Account account = new Account("账户4","中国银行",12000.0,"绩效奖",3);

        int key = accountDao.addAccountHasKey(account);

        System.out.println("添加账户，受影响的主键：" + key);

    }

    @Test
    public void testAddAccounts(){
        List<Account> accouns = List.of(
                new Account("账户4","光大银行",345.5,"私房钱",2),
                new Account("账户5","农业银行",1500.0,"低保",4),
                new Account("账户6","建设银行",3500.0,"工资",4)
        );
        int rows = accountDao.addAccounts(accouns);

        System.out.println("添加账户，受影响的行数："+ rows);
    }


}
```



### 2.3. 账户查询实现

#### 2.3.1. 实现

AccountDaoImpl.java

```java
/**
     * 查询账户总记录数
     *
     * @param userId
     * @return
     */
@Override
public int queryAccountCount(int userId) {

    String sql = "select count(1) from tb_account where user_id = ?";

    int count = jdbcTemplate.queryForObject(sql, Integer.class, userId);

    return count;
}


/**
     * 查询账户详情
     *
     * @param accountId
     * @return
     */
@Override
public Account queryAccountById(int accountId) {

    String sql = "select * from tb_account where account_id = ?";

    Account account = jdbcTemplate.queryForObject(sql, (ResultSet rs, int i) -> {
        Account acc = new Account();
        acc.setAccount_id(accountId);
        acc.setAccount_name(rs.getString("account_name"));
        acc.setAccount_type(rs.getString("account_type"));
        acc.setMoney(rs.getDouble("money"));
        acc.setRemark(rs.getString("remark"));
        acc.setUser_id(rs.getInt("user_id"));
        acc.setCreate_time(rs.getDate("create_time"));
        acc.setUpdate_time(rs.getDate("update_time"));
        return acc;
    }, accountId);

    return account;
}

/**
     * 多条件查询
     *
     * @param userId
     * @param accountName
     * @param accountType
     * @param createTime
     * @return
     */
@Override
public List<Account> queryAccountsByParams(int userId, String accountName, String accountType, String createTime) {

    String sql = "select * from tb_account where user_id = ? ";

    // 定义参数列表
    List<Object> params = new ArrayList<>();
    params.add(userId);

    if (StringUtils.isNoneBlank(accountName)) {
        sql += "and account_name like concat('%',?,'%')";
        //
        params.add(accountName);
    }
    if (StringUtils.isNoneBlank(accountType)) {
        sql += "and accountType = ? ";
        //
        params.add(accountType);
    }
    if (StringUtils.isNoneBlank(createTime)) {
        sql += "and createTime < ?";
        //
        params.add(createTime);
    }

    Object[] objs = params.toArray();

    List<Account> accounts = jdbcTemplate.query(sql, objs, (ResultSet rs, int i) -> {
        Account acc = new Account();
        acc.setAccount_id(rs.getInt("account_id"));
        acc.setAccount_name(rs.getString("account_name"));
        acc.setAccount_type(rs.getString("account_type"));
        acc.setMoney(rs.getDouble("money"));
        acc.setRemark(rs.getString("remark"));
        acc.setUser_id(rs.getInt("user_id"));
        acc.setCreate_time(rs.getTimestamp("create_time"));
        acc.setUpdate_time(rs.getTimestamp("update_time"));
        return acc;
    });

    return accounts;
}
```

#### 2.3.2. 测试

```java
public class SpringJdbcQueryTest extends BaseTest {

    @Resource
    private IAccountDao accountDao;

    @Test
    public void testQueryAccountCount(){

        int total = accountDao.queryAccountCount(2);

        System.out.println("总记录数："+ total);
    }

    @Test
    public void testQueryAccountById(){

        Account account = accountDao.queryAccountById(2);

        System.out.println("账户详情："+ account.toString());
    }

    @Test
    public void testQueryAccountsByParams(){

        List<Account> accounts = accountDao.queryAccountsByParams(4, "5", null, null);

        accounts.stream().forEach(System.out::println);
    }


}
```

### 2.4. 账户更新实现

#### 2.4.1. 实现

AccountDaoImpl.java

```java
@Override
public int updateAccount(Account account) {

    String sql = "update tb_account set account_name = ? , account_Type = ? , money = ? , remark = ? , update_time = now() , user_id = ? where account_id = ? ";

    Object[] objs = {account.getAccount_name(), account.getAccount_type(), account.getMoney(), account.getRemark(), account.getUser_id(), account.getAccount_id()};

    int row = jdbcTemplate.update(sql, objs);

    return row;
}

@Override
public int updateAccounts(List<Account> accounts) {

    String sql = "update tb_account set account_name = ? , account_Type = ? , money = ? , remark = ? , update_time = now() , user_id = ? where account_id = ? ";

    int rows = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
        @Override
        public void setValues(PreparedStatement ps, int i) throws SQLException {
            Account account = accounts.get(i);

            ps.setString(1, account.getAccount_name());
            ps.setString(2, account.getAccount_type());
            ps.setDouble(3, account.getMoney());
            ps.setString(4, account.getRemark());
            ps.setInt(5, account.getUser_id());
            ps.setInt(6, account.getAccount_id());

        }

        @Override
        public int getBatchSize() {
            return accounts.size();
        }
    }).length;

    return rows;
}
```

#### 2.4.2. 测试

```java
public class SpringJdbcUpdateTest extends BaseTest {

    @Resource
    private IAccountDao accountDao;

    @Test
    public void testUpdateAccount(){
        Account account = new Account("账户11","兰州银行",2000.0,"工资",1);
        account.setAccount_id(1);

        int row = accountDao.updateAccount(account);

        System.out.println("更新操作，受影响行数："+ row);
    }

    @Test
    public void testUpdateAccounts(){
        Account a1 = new Account("账户44","兰州银行",2000.0,"工资",1);
        a1.setAccount_id(4);
        Account a2 = new Account("账户22","兰州银行",2000.0,"工资",2);
        a2.setAccount_id(2);
        Account a3= new Account("账户33","兰州银行",2000.0,"工资",13);
        a3.setAccount_id(3);

        List<Account> accounts = List.of(a1,a2,a3);

        int rows = accountDao.updateAccounts(accounts);

        System.out.println("更新操作，受影响的行数："+ rows);
    }
}
```

### 2.5. 账户删除实现

#### 2.5.1. 实现

AccountDaoImpl.java

```java
@Override
public int deleteAccount(int accountId) {

    String sql = "delete from tb_account where account_id = ? ";

    int row = jdbcTemplate.update(sql, accountId);

    return row;
}

@Override
public int deleteAccounts(Integer[] ids) {

    String sql = "delete from tb_account where account_id = ? ";

    int rows = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
        @Override
        public void setValues(PreparedStatement ps, int i) throws SQLException {
            ps.setInt(1,ids[i]);
        }

        @Override
        public int getBatchSize() {
            return ids.length;
        }
    }).length;

    return rows;
}
```

#### 2.5.2. 测试

```java
package com.xxxx.test;

import com.xxxx.dao.IAccountDao;
import org.junit.Test;

import javax.annotation.Resource;

public class SpringJdbcDeleteTest extends BaseTest {

    @Resource
    private IAccountDao accountDao;

    @Test
    public void testDeleteAccount(){

        int row = accountDao.deleteAccount(7);
        System.out.println("删除操作，受影响的行数："+ row);
    }


    @Test
    public void testDeleteAccounts(){

        Integer[] ids = {4,5,6,};
        int row = accountDao.deleteAccounts(ids);
        System.out.println("删除操作，受影响的行数："+ row);
    }


}
```

## 3. Spring 事务控制

### 3.1. 转账场景模拟实现

#### 3.1.1. 接口方法定义

```java
/**
    * 收入
    * @param inId 收入账户id
    * @param money 收入金额
    * @return
    */
int inAccount(Integer inId, Double money);

/**
	* 支出
	* @param outId 支出账户id
	* @param money 支出金额
	* @return
	*/
int outAccount(Integer outId, Double money);
```

#### 3.1.2. 实现接口

Dao层

```java
@Override
public int inAccount(Integer inId, Double money) {

    // 定义执行sql
    String sql = "update tb_account set money = money - ? where account_id = ?";

    Object[] objs = {money, inId};

    int inRow = jdbcTemplate.update(sql, objs);

    return inRow;
}

@Override
public int outAccount(Integer outId, Double money) {

    // 定义执行sql
    String sql = "update tb_account set money = money + ? where account_id = ?";

    Object[] objs = {money, outId};

    int outRow = jdbcTemplate.update(sql, objs);

    return outRow;
}
```

#### 3.1.3. 实现服务

service层

```java
@Service
public class AccountService {

    @Resource
    private AccountDaoImpl impl;

    public int AccountMoneyTransfer(Integer inId, Integer outId, Double money) {
        int code = 0;     // 状态码  1 成功  0 失败

        int in = impl.inAccount(inId, money);

        int out = impl.outAccount(outId, money);

        if (in == 1 && out == 1) {
            code = 1;
        }

        return code;
    }
}
```

#### 3.1.4. 测试

```java
public class AccountTransfer extends BaseTest {

    @Resource
    private AccountService accountService;


    @Test
    public void test() {
        
        // 账户id2向1转账100 
        int state = accountService.AccountMoneyTransfer(2, 1, 100.0);

        if (state == 1) {
            System.out.println("转账成功");
        } else {
            System.out.println("转账失败");
        }
    }
}
```

### 3.2. Spring 事务概念

#### 3.2.1. 事务四大特性

　如果一个数据库声称支持事务的操作，那么该数据库必须要具备以下四个特性：

*  **原子性（Atomicity）**

　　原子性是指事务包含的所有操作要么全部成功，要么全部失败回滚，这和前面两篇博客介绍事务的功能是一样的概念，因此事务的操作如果成功就必须要完全应用到数据库，如果操作失败则不能对数据库有任何影响。

* **一致性（Consistency）**

　　一致性是指事务必须使数据库从一个一致性状态变换到另一个一致性状态，也就是说一个事务执行之前和执行之后都必须处于一致性状态。

　　拿转账来说，假设用户A和用户B两者的钱加起来一共是5000，那么不管A和B之间如何转账，转几次账，事务结束后两个用户的钱相加起来应该还得是5000，这就是事务的一致性。

* **隔离性（Isolation）**

　　隔离性是当多个用户并发访问数据库时，比如操作同一张表时，数据库为每一个用户开启的事务，不能被其他事务的操作所干扰，多个并发事务之间要相互隔离。

　　即要达到这么一种效果：对于任意两个并发的事务T1和T2，在事务T1看来，T2要么在T1开始之前就已经结束，要么在T1结束之后才开始，这样每个事务都感觉不到有其他事务在并发地执行。

　　关于事务的隔离性数据库提供了多种隔离级别，稍后会介绍到。

* **持久性（Durability）**

　　持久性是指一个事务一旦被提交了，那么对数据库中的数据的改变就是永久性的，即便是在数据库系统遇到故障的情况下也不会丢失提交事务的操作。

　　例如我们在使用JDBC操作数据库时，在提交事务方法后，提示用户事务操作完成，当我们程序执行完成直到看到提示后，就可以认定事务以及正确提交，即使这时候数据库出现了问题，也必须要将我们的事务完全执行完成，否则就会造成我们看到提示事务处理完毕，但是数据库因为故障而没有执行事务的重大错误。

以上介绍完事务的四大特性(简称ACID)，现在重点来说明下事务的隔离性，当多个线程都开启事务操作数据库中的数据时，数据库系统要能进行隔离操作，以保证各个线程获取数据的准确性，在介绍数据库提供的各种隔离级别之前，我们先看看如果不考虑事务的隔离性，会发生的几种问题：

1.  **脏读**

　　脏读是指在一个事务处理过程里读取了另一个未提交的事务中的数据。

　　当一个事务正在多次修改某个数据，而在这个事务中这多次的修改都还未提交，这时一个并发的事务来访问该数据，就会造成两个事务得到的数据不一致。例如：用户A向用户B转账100元，对应SQL命令如下

```
    update account set money=money+100 where name=’B’;  (此时A通知B)

    update account set money=money - 100 where name=’A’;
```

　　当只执行第一条SQL时，A通知B查看账户，B发现确实钱已到账（此时即发生了脏读），而之后无论第二条SQL是否执行，只要该事务不提交，则所有操作都将回滚，那么当B以后再次查看账户时就会发现钱其实并没有转。

2. **不可重复读**

　　不可重复读是指在对于数据库中的某个数据，一个事务范围内多次查询却返回了不同的数据值，这是由于在查询间隔，被另一个事务修改并提交了。

　　例如事务T1在读取某一数据，而事务T2立马修改了这个数据并且提交事务给数据库，事务T1再次读取该数据就得到了不同的结果，发送了不可重复读。

　　不可重复读和脏读的区别是，脏读是某一事务读取了另一个事务未提交的脏数据，而不可重复读则是读取了前一事务提交的数据。

　　在某些情况下，不可重复读并不是问题，比如我们多次查询某个数据当然以最后查询得到的结果为主。但在另一些情况下就有可能发生问题，例如对于同一个数据A和B依次查询就可能不同，A和B就可能打起来了……

3. **虚读(幻读)**

　　幻读是事务非独立执行时发生的一种现象。例如事务T1对一个表中所有的行的某个数据项做了从“1”修改为“2”的操作，这时事务T2又对这个表中插入了一行数据项，而这个数据项的数值还是为“1”并且提交给数据库。而操作事务T1的用户如果再查看刚刚修改的数据，会发现还有一行没有修改，其实这行是从事务T2中添加的，就好像产生幻觉一样，这就是发生了幻读。

　　幻读和不可重复读都是读取了另一条已经提交的事务（这点就脏读不同），所不同的是不可重复读查询的都是同一个数据项，而幻读针对的是一批数据整体（比如数据的个数）。

 

　　现在来看看MySQL数据库为我们提供的四种隔离级别：

　　① Serializable (串行化)：可避免脏读、不可重复读、幻读的发生。

　　② Repeatable read (可重复读)：可避免脏读、不可重复读的发生。

　　③ Read committed (读已提交)：可避免脏读的发生。

　　④ Read uncommitted (读未提交)：最低级别，任何情况都无法保证。

 

　　以上四种隔离级别最高的是Serializable级别，最低的是Read uncommitted级别，当然级别越高，执行效率就越低。像Serializable这样的级别，就是以锁表的方式(类似于Java多线程中的锁)使得其他的线程只能在锁外等待，所以平时选用何种隔离级别应该根据实际情况。在MySQL数据库中默认的隔离级别为Repeatable read (可重复读)。

博客https://www.cnblogs.com/dwxt/p/8807981.html

#### 3.2.2. Spring 事务核心接口

​		Spring 并不直接管理事务，而是提供了许多事务管理器，它们将事务的管理职责委托给 Hibernate 或者JTA等持久化机制所提供的相关平台框架的事务来实现。

​		Spring 事务管理器的接口是org.springframework.transaction.PlatformTransactionManager，通过这个接口，Spring为各个平台如JDBC，Hibernate等提供了对应的事务管理器，但具体的实现就是各个平台自己的事情，此接口如下：

```java
public interface PlatformTransactionManager extends TransactionManager {
    
    TransactionStatus getTransaction(@Nullable TransactionDefinition var1) throws TransactionException;
    
	// 提交
    void commit(TransactionStatus var1) throws TransactionException;

    // 回滚
    void rollback(TransactionStatus var1) throws TransactionException;
}
```

### 3.3. Spring 事务控制配置

#### 3.3.1. XMl 配置

##### 3.3.1.1. 添加命令空间

spring.xml

事务

```XML
xmlns:tx="http://www.springframework.org/schema/tx"

http://www.springframework.org/schema/tx 
http://www.springframework.org/schema/tx/spring-tx.xsd
```

aop

```XMl
xmlns:aop="http://www.springframework.org/schema/aop"

http://www.springframework.org/schema/aop 
http://www.springframework.org/schema/aop/spring-aop.xsd
```

配置如下

```xml
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:aop="http://www.springframework.org/schema/aop"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:tx="http://www.springframework.org/schema/tx"
       xsi:schemaLocation="http://www.springframework.org/schema/beans 				  							   http://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context 										   http://www.springframework.org/schema/context/spring-context.xsd
                           http://www.springframework.org/schema/aop
                           http://www.springframework.org/schema/aop/spring-aop.xsd
                           http://www.springframework.org/schema/tx
                           http://www.springframework.org/schema/tx/spring-tx.xsd">
</beans>
```

##### 3.3.1.2. 设置aop代理

```XML
<!-- 开启aop代理  -->
<aop:aspectj-autoproxy/>
```

##### 3.3.1.3. 配置事务管理器

```xml
<!-- 事务管理器 -->
<bean id="txManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <!-- 数据源 -->
    <property name="dataSource" ref="dataSource"/>
</bean>
```

##### 3.3.1.4. 配置事务相关通知

一般来说增删该方法 propagation=Required，对于查询方法使用read-only="true"

```XML
<tx:advice id="txAdvice" transaction-manager="txManager">
    <tx:attributes>
        <!-- name代表方法名 -->
        <!-- 定义以add开头的方法名均加入事务 -->
        <tx:method name="add*" propagation="REQUIRED"/>
        <!-- 定义以update开头的方法名均加入事务 -->
        <tx:method name="update*" propagation="REQUIRED"/>
        <!-- 定义以delete开头的方法名均加入事务 -->
        <tx:method name="delete*" propagation="REQUIRED"/>
        <!-- 定义以query开头的方法名均加入事务 -->
        <tx:method name="query*" read-only="true"/>
    </tx:attributes>
</tx:advice>
```

##### 3.3.1.5. 配置aop

```xml
<!-- aop切面定义 -->
<aop:config>
    <!-- 设置切入点 设置要拦截的方法 -->
    <aop:pointcut id="cut" expression="execution(* com.xxxx.service..*.*(..))"/>
    <!-- 设置通知  事务通知 -->
    <aop:advisor advice-ref="txAdvice" pointcut-ref="cut"/>
</aop:config>
```

#### 3.3.2. 注解配置

##### 3.3.2.1. 配置事务管理器

```xml
<!-- 事务管理器 -->
<bean id="txManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
    <!-- 数据源 -->
    <property name="dataSource" ref="dataSource"/>
</bean>
```

##### 3.3.2.2. 配置注解支持

```xml
<!-- 事务注解支持 -->
<tx:annotation-driven transaction-manager="txManager"/>
```

##### 3.3.2.3. 方法上添加事务注解

```java
@Transactional
public int updateAccountMoneyTransfer(Integer inId, Integer outId, Double money) {
    int code = 0;     // 状态码  1 成功  0 失败

    int in = impl.inAccount(inId, money);

    //  int a = 1 / 0;  测试

    int out = impl.outAccount(outId, money);

    if (in == 1 && out == 1) {
        code = 1;
    }

    return code;
}
```


















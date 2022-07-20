# Sping 邮件发送

java_mail2022@163.com

w8Nq99wi6U87Ffi    

授权码

KWJWNERDUTLQIJVO

## 1.环境配置

```xml
<!--  java mail    -->
<dependency>
    <groupId>com.sun.mail</groupId>
    <artifactId>javax.mail</artifactId>
    <version>1.6.2</version>
</dependency>

<dependency>
    <groupId>javax.mail</groupId>
    <artifactId>javax.mail-api</artifactId>
    <version>1.6.2</version>
</dependency>
```

## 2.java Mail 发送邮件

### 2.1.发送普通文本的邮件

```java
package com.xxxx.mail;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * 发送普通文本的邮件
 *
 *      使用JavaMail发送邮件步骤
 *          1. 创建Session对象，加载Properties对象
 *          2. 通过Session对象得到transfer对象
 *          3. 使用邮箱的用户名和密码连接邮件服务器
 *          4. 设置Message邮件对象
 *          5. 发送邮件
 */

public class MailTest01 {

    public static void main(String[] args) throws MessagingException {

        Properties pro = new Properties();

        pro.setProperty("mail.smtp.host", "smtp.163.com");
        pro.setProperty("mail.smtp.port", "25");
        pro.setProperty("mail.smtp.auth", "true");


        /*  使用JavaMail发送邮件  */
        //  1. 创建Session对象，加载Properties对象
        Session session = Session.getInstance(pro);

        // 开启session的debug模式
        session.setDebug(true);


        //  2. 通过Session对象得到Transport对象
        Transport transport = session.getTransport();

        //  3. 使用邮箱的用户名和密码连接邮件服务器      (密码授权码)
        transport.connect("smtp.163.com", "java_mail2022", "KWJWNERDUTLQIJVO");

        //  4. 设置Message邮件对象
        Message message = createSimpleMail(session);

        //  5. 发送邮件
        transport.sendMessage(message, message.getAllRecipients());

        
        // 关闭transport对象
        transport.close();

    }

    private static Message createSimpleMail(Session session) throws MessagingException {

        // 创建邮件对象
        MimeMessage message = new MimeMessage(session);

        // 设置发件人邮箱地址
        message.setFrom("java_mail2022@163.com");

        // 设置收件人邮箱地址
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("java_mail2022@163.com"));

        // 设置邮件主题
        message.setSubject("测试文本内容");
        // 设置发送日期
        message.setSentDate(new Date());
        // 设置文本内容
        message.setText("你好，早上10点开会，请注意时间安排");

        return message;
    }
}
```

### 2.2.发送HTML内容的邮件

```java
package com.xxxx.mail;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;

/**
 * 发送HTML的邮件
 *
 *   使用JavaMail发送邮件步骤
 *      1. 创建Session对象，加载Properties对象
 *      2. 通过Session对象得到transfer对象
 *      3. 使用邮箱的用户名和密码连接邮件服务器
 *      4. 设置Message邮件对象
 *      5. 发送邮件
 */

public class MailTest02 {

    public static void main(String[] args) throws MessagingException {

        Properties pro = new Properties();

        pro.setProperty("mail.smtp.host", "smtp.163.com");
        pro.setProperty("mail.smtp.port", "25");
        pro.setProperty("mail.smtp.auth", "true");


        /*  使用JavaMail发送邮件  */
        //  1. 创建Session对象，加载Properties对象
        Session session = Session.getInstance(pro);

        // 开启session的debug模式
        session.setDebug(true);


        //  2. 通过Session对象得到Transport对象
        Transport transport = session.getTransport();

        //  3. 使用邮箱的用户名和密码连接邮件服务器      (密码授权码)
        transport.connect("smtp.163.com", "java_mail2022", "KWJWNERDUTLQIJVO");

        //  4. 设置Message邮件对象
        Message message = createSimpleMail(session);

        //  5. 发送邮件
        transport.sendMessage(message, message.getAllRecipients());

        // 关闭transport对象
        transport.close();

    }

    private static Message createSimpleMail(Session session) throws MessagingException {

        // 创建邮件对象
        MimeMessage message = new MimeMessage(session);

        // 设置发件人邮箱地址
        message.setFrom("java_mail2022@163.com");

        // 设置收件人邮箱地址
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("java_mail2022@163.com"));


        // 设置邮箱主题
        message.setSubject("测试HTML内容邮件");
        // 设置发送时间
        message.setSentDate(new Date());

        /* 准备邮件数据 */
        // 设置多媒体对象容器
        MimeMultipart mimeMultipart = new MimeMultipart();

        // 设置邮件体对象
        MimeBodyPart bodyPart = new MimeBodyPart();
        // 设置HTML内容
        StringBuffer sb = new StringBuffer();
        sb.append("<html><body><a href='http://www.baidu.com'>百度一下</a></body></html>");

        // 将HTML内容设置到邮件体对象中
        bodyPart.setContent(sb.toString(), "text/html;charset=UTF-8");

        // 将邮件体对象设置到多媒体对象中
        mimeMultipart.addBodyPart(bodyPart);

        // 将多媒体对象容器设置到message对象容器中
        message.setContent(mimeMultipart);

        return message;
    }
}
```

### 2.3.发送包含附件的邮件

```java
package com.xxxx.mail;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Date;
import java.util.Properties;

/**
 * 发送包含附件的邮件
 * <p>
 *   使用JavaMail发送邮件步骤
 *      1. 创建Session对象，加载Properties对象
 *      2. 通过Session对象得到transfer对象
 *      3. 使用邮箱的用户名和密码连接邮件服务器
 *      4. 设置Message邮件对象
 *      5. 发送邮件
 */

public class MailTest03 {

    public static void main(String[] args) throws MessagingException {

        Properties pro = new Properties();

        pro.setProperty("mail.smtp.host", "smtp.163.com");
        pro.setProperty("mail.smtp.port", "25");
        pro.setProperty("mail.smtp.auth", "true");


        /*  使用JavaMail发送邮件  */
        //  1. 创建Session对象，加载Properties对象
        Session session = Session.getInstance(pro);

        // 开启session的debug模式
        session.setDebug(true);


        //  2. 通过Session对象得到Transport对象
        Transport transport = session.getTransport();

        //  3. 使用邮箱的用户名和密码连接邮件服务器      (密码授权码)
        transport.connect("smtp.163.com", "java_mail2022", "KWJWNERDUTLQIJVO");

        //  4. 设置Message邮件对象
        Message message = createSimpleMail(session);

        //  5. 发送邮件
        transport.sendMessage(message, message.getAllRecipients());


        // 关闭transport对象
        transport.close();

    }

    private static Message createSimpleMail(Session session) throws MessagingException {

        // 创建邮件对象
        MimeMessage message = new MimeMessage(session);

        // 设置发件人邮箱地址
        message.setFrom("java_mail2022@163.com");

        // 设置收件人邮箱地址
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("java_mail2022@163.com"));

        // 设置邮件主题
        message.setSubject("测试包含附件邮件");
        // 设置发送日期
        message.setSentDate(new Date());


        /* 邮件内容 */
        // 创建邮件正文
        MimeBodyPart bodyPart = new MimeBodyPart();
        bodyPart.setContent("<h2>这是一封包含附件的邮件</h2>", "text/html;charset=UTF-8");

        // 创建附件对象
        MimeBodyPart attachPart = new MimeBodyPart();
        // 本地文件
        DataHandler df = new DataHandler(new FileDataSource("D:\\file.txt"));

        // 将本地文件设置到附件对象中
        attachPart.setDataHandler(df);
        // 设置附件文件名
        attachPart.setFileName(df.getName());

        // 创建多媒体容器对象
        MimeMultipart multipart = new MimeMultipart();
        // 添加正文
        multipart.addBodyPart(bodyPart);
        // 添加附件
        multipart.addBodyPart(attachPart);

        // 如果文件中包含附件，设置为mixed
        multipart.setSubType("mixed");

        
        // 将多媒体对象容器设置到message对象容器中
        message.setContent(multipart);

        return message;
    }
}
```

### 2.4.封装

#### 2.4.1.创建邮件发送信息类

```java
package com.xxxx.mail2;

import java.util.List;

public class MailSendInfo {

    private String serverHost;   // 服务器主机
    private String serverPort;   // 服务器端口

    private String fromAddress;     // 发送方邮件地址
    private List<String> toAddress; // 接受方邮件地址

    private String userName;  // 邮箱用户名
    private String userPwd;   // 邮箱密码    (授权码)

    private String subject;  // 邮件主题
    private String context;  // 邮件内容

    private Boolean flag = true; // 是否需要身份认证
    private List<String> attachFileNames; // 附件集合


    public String getServerHost() {
        return serverHost;
    }

    public void setServerHost(String serverHost) {
        this.serverHost = serverHost;
    }

    public String getServerPort() {
        return serverPort;
    }

    public void setServerPort(String serverPort) {
        this.serverPort = serverPort;
    }

    public String getFromAddress() {
        return fromAddress;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    public List<String> getToAddress() {
        return toAddress;
    }

    public void setToAddress(List<String> toAddress) {
        this.toAddress = toAddress;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public List<String> getAttachFileNames() {
        return attachFileNames;
    }

    public void setAttachFileNames(List<String> attachNames) {
        this.attachFileNames = attachNames;
    }
}
```

#### 2.4.2.创建身份认证类

```java
package com.xxxx.mail2;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {

    private String userName;
    private String userPwd;

    public MyAuthenticator(String userName, String userPwd) {
        this.userName = userName;
        this.userPwd = userPwd;
    }

    /***
     *  邮件发送时进行身份认证
     * @return
     */

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(userName, userPwd);
    }
}
```

#### 2.4.3.创建发送邮件类

```java
package com.xxxx.mail2;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.sound.sampled.Line;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;
import java.util.Properties;

/**
 * 邮件发送器
 */
public class MailSender {

    public void sendMail(MailSendInfo mailSendInfo) {

        try {
            // 定义服务器相关配置
            Properties pro = new Properties();

            pro.setProperty("mail.smtp.host", mailSendInfo.getServerHost());
            pro.setProperty("mail.smtp.port", mailSendInfo.getServerPort());
            pro.setProperty("mail.smtp.auth", mailSendInfo.getFlag().toString());


            // 身份认证
            MyAuthenticator myAuthenticator = new MyAuthenticator(mailSendInfo.getUserName(), mailSendInfo.getUserPwd());

            // 创建Session对象
            Session session = Session.getDefaultInstance(pro, myAuthenticator);
            // 设置Session的Debug模式
            session.setDebug(true);

            /* 设置邮件内容 */
            // 设置message对象
            Message message = new MimeMessage(session);
            // 设置发送方邮件地址
            Address from = new InternetAddress(mailSendInfo.getFromAddress());
            message.setFrom(from);

            // 设置邮件主题
            message.setSubject(mailSendInfo.getSubject());
            // 设置发送时间
            message.setSentDate(new Date());

            // 设置收件方邮件地址
            // 判断收件方集合是否为空
            if (mailSendInfo.getToAddress() != null && mailSendInfo.getToAddress().size() > 0) {
                // 遍历邮箱地址集合
                Address[] addresses = new Address[mailSendInfo.getToAddress().size()];
                for (int i = 0; i < mailSendInfo.getToAddress().size(); i++) {
                    // 得到每个地址对象
                    Address address = new InternetAddress(mailSendInfo.getToAddress().get(i));
                    // 将每个地址对象设置到地址数组中
                    addresses[i] = address;
                }
                // 将接受者的邮箱地址设置到message对象中
                message.setRecipients(Message.RecipientType.TO, addresses);
            }


            // 创建多媒体对象
            MimeMultipart mimeMultipart = new MimeMultipart();

            // 设置正文内容
            MimeBodyPart bodyPart = new MimeBodyPart();
            bodyPart.setContent(mailSendInfo.getContext(), "text/html;charset=UTF-8");
            // 将正文内容的bodyPart对象设置到多媒体对象容器中
            mimeMultipart.addBodyPart(bodyPart);

            // 获取所有的附件文件名
            List<String> files = mailSendInfo.getAttachFileNames();
            // 判断文件是否存在
            if (files != null && files.size() > 0) {
                // 遍历获取文件对象
                for (int i = 0; i < files.size(); i++) {
                    // 附件对象
                    File file = new File(files.get(i));
                    // 判断附件对象是否存在
                    if (file.exists()) {
                        // 如果附件存在，创建附件对象
                        MimeBodyPart attachPart = new MimeBodyPart();
                        DataHandler df = new DataHandler(new FileDataSource(file));
                        // 将附件设置到attachPart中
                        attachPart.setDataHandler(df);
                        // 设置附件文件名 (解决乱码)
                        attachPart.setFileName(MimeUtility.encodeText(df.getName()));
                        // 添加附件
                        mimeMultipart.addBodyPart(attachPart);
                    }
                }
            }


            // 设置邮件对象
            message.setContent(mimeMultipart);

            // 发送邮件
            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
```

#### 2.4.4.测试类

```java
package com.xxxx.mail2;

import javax.mail.internet.MimeMultipart;
import java.util.List;

public class MailTest04 {

    public static void main(String[] args) {

//        testAttachMAil();

//        testHTMLMail();
    }

    /**
     * 发送HTML邮件
     */
    public static void testHTMLMail() {

        MailSendInfo info = new MailSendInfo();
        info.setServerHost("smtp.163.com");
        info.setServerPort("25");
        info.setUserName("java_mail2022@163.com");
        info.setUserPwd("KWJWNERDUTLQIJVO");
        info.setSubject("邮件封装");
        info.setFromAddress("java_mail2022@163.com");
        info.setContext("<h2>封装发送邮件</h2>");
        info.setToAddress(List.of("java_mail2022@163.com"));

        MailSender sender = new MailSender();
        sender.sendMail(info);
    }

    /**
     * 发送包含附件的邮件
     */
    public static void testAttachMAil() {

        MailSendInfo info = new MailSendInfo();
        info.setServerHost("smtp.163.com");
        info.setServerPort("25");
        info.setUserName("java_mail2022@163.com");
        info.setUserPwd("KWJWNERDUTLQIJVO");
        info.setSubject("邮件封装");
        info.setFromAddress("java_mail2022@163.com");
        info.setContext("<h2>封装发送邮件</h2>");
        info.setToAddress(List.of("java_mail2022@163.com"));


        // 添加附件
        info.setAttachFileNames(List.of("D:\\file.txt"));

        MailSender sender = new MailSender();
        sender.sendMail(info);
    }
}
```

## 3.使用Spring API 实现邮件发送

### 3.1.环境搭建

```xml
<!--  java mail    -->
<dependency>
    <groupId>com.sun.mail</groupId>
    <artifactId>javax.mail</artifactId>
    <version>1.6.2</version>
</dependency>

<dependency>
    <groupId>javax.mail</groupId>
    <artifactId>javax.mail-api</artifactId>
    <version>1.6.2</version>
</dependency>

<!--  spring 框架依赖  -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context</artifactId>
    <version>5.2.22.RELEASE</version>
</dependency>

<dependency>
    <groupId>javax.annotation</groupId>
    <artifactId>javax.annotation-api</artifactId>
    <version>1.3.2</version>
</dependency>

<!-- spring 上下文环境支持  -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-context-support</artifactId>
    <version>5.2.22.RELEASE</version>
</dependency>

<!--  spring 测试环境 -->
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-test</artifactId>
    <version>5.2.22.RELEASE</version>
</dependency>
```

### 3.2.配置邮件发送bean

创建配置文件

```properties
# 服务器主机
host=smtp.163.com
# 服务器端口
port=25
# 字符编码
defaultEncoding=utf-8
# 发送邮件地址
username=java_mail2022
# 授权码
password=KWJWNERDUTLQIJVO
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="http://www.springframework.org/schema/beans
                           https://www.springframework.org/schema/beans/spring-beans.xsd
                           http://www.springframework.org/schema/context
                           http://www.springframework.org/schema/context/spring-context.xsd">


    <!-- 扫描范围的配置 -->
    <context:component-scan base-package="com.xxxx"/>

    <!--  加载properties配置文件  -->
    <context:property-placeholder location="mail.properties"/>

    <!-- 邮件发送器 -->
    <bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
        <property name="host" value="${host}"/>
        <property name="port" value="${port}"/>
        <property name="defaultEncoding" value="${defaultEncoding}"/>
        <property name="username" value="${username}"/>
        <property name="password" value="${password}"/>
    </bean>

    <bean id="templateMessage" class="org.springframework.mail.SimpleMailMessage">
        <!--  发送人邮件地址  -->
        <property name="from" value="java_mail2022@163.com"/>
        <property name="subject" value="spring_mail"/>

    </bean>

</beans>
```

### 3.3.定义接口和实现类

```java
package com.xxxx.springMail;

public interface OrderManager {
    void placeOrder();
}
```

```java
package com.xxxx.springMail;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SimpleOrderManager implements OrderManager {

    @Resource
    private MailSender mailSender;
    @Resource
    private SimpleMailMessage templateMessage;

    @Override
    public void placeOrder() {
        SimpleMailMessage msg = new SimpleMailMessage(this.templateMessage);
        msg.setTo("java_mail2022@163.com");
        msg.setText("Hello spring mail");

        this.mailSender.send(msg);

    }
}
```

### 3.4.邮件发送测试

```java
package com.xxxx.springMail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

    public static void main(String[] args) {
        // 加载Spring上下文环境
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
        SimpleOrderManager simpleOrderManager = (SimpleOrderManager) ac.getBean("simpleOrderManager");

        simpleOrderManager.placeOrder();
    }
}
```

### 3.5.发送附件

```java
package com.xxxx.springMail;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

public class Test02 {

    public static void main(String[] args) throws MessagingException {
        // 加载Spring上下文环境
        ApplicationContext ac = new ClassPathXmlApplicationContext("spring.xml");
        // 获取邮件发送器对象
        JavaMailSender mailSender = (JavaMailSender) ac.getBean("mailSender");

        // 获取邮件对象
        MimeMessage message = mailSender.createMimeMessage();
        // 设置邮件主题
        message.setSubject("Spring mail 发送附件");
        // 创建带有附件的消息帮助类
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
        // 设置邮件发送者
        helper.setFrom("java_mail2022@163.com");
        // 设置邮件接受者
        helper.setTo("java_mail2022@163.com");
        // 设置邮件内容
        helper.setText("测试附件发送");

        // 设置附件
        File file = new File("D:\\file.txt");
        // 添加附件
        helper.addAttachment(file.getName(), file);
        // 发送邮件
        mailSender.send(message);
    }
}
```


# Java Socket

​		java对socket通信的实现主要由Socket对象以及ServerSocket对象完成。Socket类封装了对发送数据以及接受数据的流ObjectOutputStream和ObjectInputStream，ServerSocket可以指定客户端或服务端链接的IP地址以及端口号。

简单实现如下：

Client.java

```java
package com.xxxx.client;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Scanner;

public class Client {

    
    // 设置共有的Socket对象
    private static Socket socket;

    // Socket实例存在状态标志
    private static Boolean socket_state = false;

    // 主线程开启程序
    public static void main(String[] args) {

        // 封装方法
        connect();

    }

    private static void connect() {
        
        try {
            // 创建Socket对象，并指定接受的服务端IP地址以及端口号
            socket = new Socket("192.168.253.152", 9001);
            // 设置实例为存在状态
            socket_state = true;
            
            // 获取输出流(发送流),使用Socket类的getOutputStream()方法
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(socket.getOutputStream());
             // 获取输入流(发送流),使用Socket类的getInputStream()方法
            ObjectInputStream objectInputStream = new ObjectInputStream(socket.getInputStream());

            // 开启Socket监听线程
            new Thread(new Client_listen(socket, objectInputStream)).start();
            // 开启Socket发送线程
            new Thread(new Client_send(socket, objectOutputStream)).start();

            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

// 监听线程
class Client_listen implements Runnable {
    private Socket socket;
    private ObjectInputStream objectInputStream;

    // 初始化
    Client_listen(Socket socket, ObjectInputStream objectInputStream) {
        this.objectInputStream = objectInputStream;
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            while (true) {
                
                // 将服务端发送的信息输出到控制台
                System.out.println(objectInputStream.readObject());
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

// 发送线程
class Client_send implements Runnable {

    private Socket socket;
    private ObjectOutputStream objectOutputStream;

    Client_send(Socket socket, ObjectOutputStream objectOutputStream) {
        this.socket = socket;
        this.objectOutputStream = objectOutputStream;
    }

    @Override
    public void run() {
        try {
   
            Scanner scanner = new Scanner(System.in);

            while (true) {
                
                // 打印输入提示信息
                System.out.println("客户端  请输入:  ");
                // 控制台读取字符串
                String str = scanner.nextLine();
                
                // 将控制台字符串写进输出流(发送流)对象
                objectOutputStream.writeObject(str);
                objectOutputStream.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

Server.java

```java
package com.xxxx.server;

import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;

public class Server {

    public static void main(String[] args) {

        // 打印提示信息
        System.out.println("服务器启动");
        
        try {

            // 开启一个端口用于套接字连接
            ServerSocket serverSocket = new ServerSocket(9001); // 端口设置为9001

            while (true) {
                
                // 接受socket请求
                Socket socket = serverSocket.accept();

                // 开启监听线程
                new Thread(new Server_listen(socket)).start();
                // 开启发送线程
                new Thread(new Server_send(socket)).start();

            }

        } catch (Exception e) {

        }
    }

}

// 监听线程
class Server_listen implements Runnable {
    
    private Socket socket;

    Server_listen(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            
           	// 获取输入流对象
            ObjectInputStream objectInputStream = new ObjectInputStream(socket.getInputStream());

            while (true) {
                // 将客户端发送的信息输出到控制台
                System.out.println(objectInputStream.readObject());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

class Server_send implements Runnable {

    private Socket socket;

    Server_send(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try {
            // 获取输出流(发送流)对象
            ObjectOutputStream objectOutputStream = new ObjectOutputStream(socket.getOutputStream());

            Scanner scanner = new Scanner(System.in);
            
            while (true) {
                // 打印输入提示信息
                System.out.println("服务端  请输入:  ");
                // 获取控制台输入字符串
                String str = scanner.nextLine();

                // 将控制台字符串写进输出流(发送流)对象
                objectOutputStream.writeObject(str);
                objectOutputStream.flush();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```


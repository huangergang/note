# java swing

## 0.创建窗口

``` java
JFrame frame = new JFrame("title");  // 创建窗口
frame。setSize(int width,int heigth); // 设置窗口长、宽

Container contentPane = frame.getContentPane(); // 获得窗口布局
contentPane.setLayout(new Layout()); // 重新设置窗口布局

frame.setDefaultCloseOperatoin(JFrame.EXIT_ON_CLOSE);   // 设置点击窗口差号为关闭窗口
```

## 1.自定义窗口

自定义窗口类

``` java
public class MyFrame extends JFrame{} 
```

### 1.1.JFame

| getContentPane()                      | 返回窗体的contentPane对象  |
| ------------------------------------- | -------------------------- |
| getDefaultCloseOperation()            | 返回单击"关闭"时执行的操作 |
| setDefaultCloseOperation()            | 设置单击"关闭"时的操作     |
| setSize()                             | 设置窗口的Width  Height    |
| setVisible(true)                      | 窗口可见                   |
| setLocationRelativeTo()               | 窗口居中                   |
| setLayout(LayoutManager manager)      | 设置LayoutManager属性      |
| setContentPane(Container contentPane) | 设置contentPane属性        |
| add(Component comp)                   | 添加组件或 JPanel          |

### 1.2.JPanel 面板可以添加组件

| setLayout(LayoutManager manager) | 设置容器的布局管理器     |
| -------------------------------- | ------------------------ |
| void remove(Component comp)      | 移除指定组件             |
| Component add(Component comp)    | 将指定组件追加到容器尾部 |
| void setFont(Font f)             | 设置容器字体             |
| void setBackground(Color c)      | 设置组件背景颜色         |

## 2 .swing and awt

> swing是基于awt的

AWT ： Button、Label.....

Swing ：JButton、JLabel......

swing是轻量化的界面设计包

## 3.按钮点击处理

为button添加监听器

ActionListener 是一个接口

必须实现他的 actionPerformed()方法

此方法是由swing框架执行的

``` java
button.addActoinListener(new ActionListener{
    @Override
    public void actionPerformed(ActoinListener e){
        // 自定义
        label.setText(currentTime());
    }
})
```

## 4.事件处理

 ``` java
   public static String currentTime() {
         SimpleDateFormat time  = new SimpleDateFormat("hh:mm:ss");
         String str = time.format(new Date());
         return str;
  }   // 返回当前时间方法
 ```

## 5.简化

``` java
button.addActionListener((e)->{label.setText(currentTime());}
)    // lambda 表达式
```

## 6.回调（Callback）

> 调用系统的一个方法时 ------- Call (调用)
>
> frame.setVisible(true);

> 当我们写的一个方法被系统调用时-----------Callback (回调)
>
> public void actionPerformed();

## 7.标签 JLabel

JLabel一些方法：

* setText()        设置文本
* setFont(new Font("楷体",2,20))        设置字体,字号
* setForeground()    设置文本颜色
* setToolTipText()     设置工具提示
* setOpaque(bool)    设置背景是否透明（默认透明）
* setBackground()      设置背景色
* setPreferredSize(new Dimension(int width,int heigth))     设置背景尺寸

## 8.文本框 JTextField

单行文本框

new JTextField(int number)

number 表示列数，用于计算宽度

一些方法：

* setText()    设置文本
* getText()     获取文本
* setFont()      设置字体
* setEnabled(boolean bool)

JOption.showMessageDialog(null,String  message)   显示一个消息提示框

## 9.复选框 JCheckBOx

setSelected(boolean b)----------------true为默认选中，false为默认不选中

setText() ---------------------设置文本

isSelected()-------------------判断选中状态

## 10.下拉列表 JComboBox

JComboBox<String>   comBox = new JComboBox<>();

泛型里的参数是每一项数据的类型

comBox.addItem("string");  添加选中项

comBox.getSelectedIndex(); 获取选中项的索引

comBox.setSelectedIndex();设置选中项

remove(index);按索引删除

getSelectedItem();获取选中项的值

setSelectedItem();设置数据项

remove(Item);按数据项删除

## 11.窗口布局

窗口坐标  左上角为（0，0），横坐标向右增长，纵坐标向下增长

单位是像素

setBounds(0,0,d,h)

## 12.布局器Layout Manager

   ### 1.FlowLayout 

  组件按顺序一字排开，长度不够到下一行继续排列，改变窗口大小，组件大小不变，位置发生变化。

### 2.BorderLayout      边界布局

上、下、左、右、中

``` java
        contentPane.add(l1,BorderLayout.NORTH);
        contentPane.add(l2,BorderLayout.CENTER);
        contentPane.add(l3,BorderLayout.EAST);
        contentPane.add(l4,BorderLayout.SOUTH );
        contentPane.add(l5,BorderLayout.WEST);
```

边界可调

setPreferredSize(new Dimension(int width,int height));

### 3.CardLayout

犹如叠在一起的卡片，每次只能显示一张卡片的内容

CardLayout的使用

pane.setLayout(new CardLayout()) ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      

pane.add(c1,"name1"); // 添加卡片时，给卡片一个String 名字

pane.add(c2,"name2");

CardLayout.show(pane,"name");  // 显示卡片


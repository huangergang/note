# js面向对象

## 1. 创建一个自定义对象

```js
// 原型对象:
const Student = {
    name: 'Robot',
    height: 1.2,
    run: function () {
        console.log(this.name + this.height + ' is running...');
    },
    create: function (name, height) {
        // 基于Student原型创建一个新对象:
        var s = Object.create(Student);
        // 初始化新对象:
        s.name = name;
        s.height = height;
        return s;
    }
};



var xiaoming = Student.create('小明', 1.4);
var dazhuang = Student.create('大柱', 1.4);
xiaoming.run(); // 小明 is running...
dazhuang.run();

```

## 2. JQuery读取本地JSON文件

*   第一步，引入JQuery 依赖

    ```html
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    ```

*   第二步，在同级目录下创建JSON文件（student.json）

    ```JSON
    [
        {
            "name":"frank",
            "age":14,
            "sex":"male"
        },
    
        {
            "name":"lili",
            "age":16,
            "sex":"female"
        },
        {
            "name":"aim",
            "age":100,
            "sex":"female"
        }
    ]
    ```

*   第三步，通过 $.getJSON("filePath",fun) 读取

    ```js
    $.getJSON("student.json", function (data) {
        data.forEach(e => {
            console.log(e);
        });
    });
    ```

    
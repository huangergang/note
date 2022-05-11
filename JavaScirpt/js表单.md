# 表单

表单是页面向后台传输数据的一种非常常见的方式，在进行数据发送（请求发出）之前，应该先对页面进行一系列的数据合法性验证，节省不必要的错误数据的传输，提升用户的体验度。

## 1.获取表单

1. **document.表单名称**

   ```JS
   var form = document.form1;
   ```

2. **document.getElementById(表单ID)**

   ```JS
   var form = document.getElementById("form1");
   ```

3. **document.forms[表单名称]**

   ```JS
   var forms = document.forms;// forms获取所有表单。
   var form1 = forms["form1"];

4. **document.forms[索引]**

   ```JS
   var forms = document.forms;// forms获取所有表单。
   var form1 = forms[0];
   ```

## 2.获取表单元素

### 2.1.获取input元素

### 2.2.获取单选按钮

### 2.3.获取多选按钮

### 2.4.获取下拉框


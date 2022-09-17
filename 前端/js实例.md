# 1. 更多阅读实现

**实现思路**

​		设置内容区和控制区，内容显示被遮蔽，通过控制区按钮解除遮蔽，并销毁控制区。

>   设置html主体

```html
<div id="box" class="box print">
		...
</div>

<div id="opts" >
    <button id="btn">阅读更多 >></button>
</div>
```

>   css设置

```css
.box {
position: relative;
width: 80%;
}

.print {
height: 8em; 	 /* 设置显示行数 */
overflow: hidden;
}
```

>   js实现

*   展开内容区

*   移除操作区

```js
document.getElementById("btn").addEventListener(
    "click",
    e => {
        // 展开内容区
        let box = document.getElementById("box");
        box.classList.remove("print");

        // 移除操作区
        let opts = document.getElementById("opts");
        let main = opts.parentNode;
        main.removeChild(opts);
    }
);

```


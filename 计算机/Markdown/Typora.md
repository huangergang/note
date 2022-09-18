# LaTeX内联公式汇总

## 1. 基本内联公式

>   位置关系

|     展示      |    LaTeX    |  说明  |
| :-----------: | :---------: | :----: |
|     $x^2$     |    x^{2}    | 右上标 |
|    $x_{2}$    |    x_{2}    | 右下标 |
|   ${}^{2}x$   |   {}^{2}x   | 左上标 |
|   ${}_{2}x$   |   {}_{2}x   | 左下标 |
| $\frac{x}{2}$ | \frac{x}{2} |  分数  |

>   数学符号

|     展示     |   LaTeX    |    说明    |
| :----------: | :--------: | :--------: |
|    $\pm$     |    \pm     |    正负    |
|    $\mp$     |    \mp     |    负正    |
|   $\times$   |   \times   |    叉乘    |
|   $\cdot$    |   \cdot    |    点乘    |
|   $\oplus$   |   \oplus   |     或     |
|  $\otimes$   |  \otimes   |    异或    |
|   $\circ$    |   \circ    |            |
|    $\div$    |    \div    |    除号    |
|    $\neq$    |    \neq    |   不等号   |
|  $\approx$   |  \approx   |   约等号   |
|   $\equiv$   |   \equiv   |            |
|    $\leq$    |    \leq    |  小于等于  |
|    $\geq$    |    \geq    |  大于等于  |
|  $\forall$   |  \forall   |    任意    |
|  $\exists$   |  \exists   |    存在    |
| $\emptyset$  | \emptyset  |    空集    |
|   $\nabla$   |   \nabla   | 哈密顿算子 |
|    $\bot$    |    \bot    |    垂直    |
|   $\angle$   |   \angle   |     角     |
|  $\because$  |  \because  |    应为    |
| $\therefore$ | \therefore |    所以    |
|    $\sim$    |    \sim    |    等价    |
|    $\mid$    |    \mid    |            |
|  $\partial$  |  \partial  |    偏导    |
|   $\infty$   |   \infty   |   无穷大   |
|   $\dots$    |   \dots    |    省略    |
|    $\in$     |    \in     |    属于    |
|   $\notin$   |   \notin   |   不属于   |
|  $\subset$   |  \subset   |            |
| $\subseteq$  | \subseteq  |            |
|    $\cup$    |    \cup    |     并     |
|    $\cap$    |    \cap    |     交     |

|         展示          |        LaTeX        |                             说明                             |
| :-------------------: | :-----------------: | :----------------------------------------------------------: |
|       $\dot{a}$       |       \dot{a}       |                                                              |
|      $\ddot{a}$       |      \ddot{a}       |                                                              |
|       $\hat{a}$       |       \hat{a}       |                                                              |
|       $\vec{a}$       |       \vec{a}       |                          单字母向量                          |
|    $\overline{a}$     |    \overline{a}     |                            上横线                            |
|    $\underline{a}$    |    \underline{a}    |                            下横线                            |
|      $\tilde{a}$      |      \tilde{a}      |                           上波浪线                           |
| $\overrightarrow{AB}$ | \overrightarrow{AB} |                          多字母向量                          |
|    $\widehat{AB}$     |    \widehat{AB}     | 将就算是一个弧线吧（本来是用\usepackage{yhmath} \wideparen{ABCDEFG}） |
|    ~~内容放中间~~     |  ~~ 内容放中间 ~~   |                            删除线                            |

|            展示             |           LaTeX           |            说明             |
| :-------------------------: | :-----------------------: | :-------------------------: |
|     $\lfloor x \rfloor$     |     \lfloor x \rfloor     |          向下取整           |
|      $\lceil x \rceil$      |      \lceil x \rceil      |          向上取整           |
|         $\sqrt{x}$          |         \sqrt{x}          |            根号             |
| $\lim_{n\rightarrow\infin}$ | \lim_{n\rightarrow\infin} |            极限             |
|            $f’$             |            f’             |          一阶导数           |
|       $\int_{0}^{1}$        |       \int_{0}^{1}        |           定积分            |
|           $\oint$           |           \oint           |                             |
|      $\sum_{i=0}^{n}$       |      \sum_{i=0}^{n}       |            求和             |
|      $\prod_{i=1}^{n}$      |      \prod_{i=1}^{n}      |            连乘             |
|       $\binom{2}{n}$        |       \binom{2}{n}        | 二项式系数，同：$C^{2}_{n}$ |
>   其他字符

|       展示        |      LaTeX      |         展示          |        LaTeX        |
| :---------------: | :-------------: | :-------------------: | :-----------------: |
|   $\leftarrow$    |   \leftarrow    |   $\longleftarrow$    |   \longleftarrow    |
| $\leftrightarrow$ | \leftrightarrow | $\longleftrightarrow$ | \longleftrightarrow |
|   $\Rightarrow$   |   \Rightarrow   |   $\Longrightarrow$   |   \Longrightarrow   |
| $\Leftrightarrow$ | \Leftrightarrow | $\Longleftrightarrow$ | \Longleftrightarrow |
|    $\uparrow$     |    \uparrow     |     $\downarrow$      |     \downarrow      |
|    $\Uparrow$     |    \Uparrow     |     $\Downarrow$      |     \Downarrow      |

## 2. 希腊字母内联公式

|   小写字母    |    LaTeX    |  大写字母  |  LaTeX   |
| :-----------: | :---------: | :--------: | :------: |
|   $\alpha$    |   \alpha    |  $\Alpha$  |  \Alpha  |
|    $\beta$    |    \beta    |  $\Beta$   |  \Beta   |
|   $\gamma$    |   \gamma    |  $\Gamma$  |  \Gamma  |
|   $\delta$    |   \delta    |  $\Delta$  |  \Delta  |
|  $\epsilon$   |  \epsilon   | $\Epsilon$ | \Epsilon |
| $\varepsilon$ | \varepsilon |            |          |
|    $\zeta$    |    \zeta    |  $\Zeta$   |  \Zeta   |
|    $\eta$     |    \eta     |   $\Eta$   |   \Eta   |
|   $\theta$    |   \theta    |  $\Theta$  |  \Theta  |
|    $\iota$    |    \iota    |  $\Iota$   |  \Iota   |
|   $\kappa$    |   \kappa    |  $\Kappa$  |  \Kappa  |
|   $\lambda$   |   \lambda   | $\Lambda$  | \Lambda  |
|     $\mu$     |     \mu     |   $\Mu$    |   \Mu    |
|     $\nu$     |     \nu     |   $\Nu$    |   \Nu    |
|     $\xi$     |     \xi     |   $\Xi$    |   \Xi    |
|  $\omicron$   |  \omicron   | $\Omicron$ | \Omicron |
|     $\pi$     |     \pi     |   $\Pi$    |   \Pi    |
|    $\rho$     |    \rho     |   $\Rho$   |   \Rho   |
|   $\sigma$    |   \sigma    |  $\Sigma$  |  \Sigma  |
|    $\tau$     |    \tau     |   $\Tau$   |   \Tau   |
|  $\upsilon$   |  \upsilon   | $\Upsilon$ | \Upsilon |
|    $\phi$     |    \phi     |   $\Phi$   |   \Phi   |
|   $\varphi$   |   \varphi   |            |          |
|    $\chi$     |    \chi     |   $\Chi$   |   \Chi   |
|    $\psi$     |    \psi     |   $\Psi$   |   \Psi   |
|   $\omega$    |   \omega    |  $\Omega$  |  \Omega  |

## 3. 常见数学函数内联公式

|   函数类型    |    LaTeX    |
| :-----------: | :---------: |
|   $\sin{x}$   |   \sin{x}   |
|   $\cos{x}$   |   \cos{x}   |
|   $\tan{x}$   |   \tan{x}   |
|   $\cot{x}$   |   \cot{x}   |
|   $\sec{x}$   |   \sec{x}   |
|   $\csc{x}$   |   \csc{x}   |
| $\arcsin{x}$  | \arcsin{x}  |
| $\arccos{x}$  | \arccos{x}  |
| $\arctan{x}$  | \arctan{x}  |
| $\arccot{x}$  | \arccot{x}  |
| $\arcsec{x}$  | \arcsec{x}  |
| $\arccsc{x}$  | \arccsc{x}  |
| $\log_{2}{x}$ | \log_{2}{x} |
|   $\ln{x}$    |   \ln{x}    |
|   $\lg{x}$    |   \lg{x}    |

## 4. 较复杂公式系列

>   其他

|                 展示                 |               LaTeX                |     说明     |
| :----------------------------------: | :--------------------------------: | :----------: |
| $\sqrt[\leftroot{-4}\uproot{4}n]{x}$ | \sqrt[\leftroot{-4}\uproot{4}n]{x} |              |
|    $x\xrightarrow[d-e-f]{a+b+c}y$    |    x\xrightarrow[d-e-f]{a+b+c}y    |              |
|          $\color{red}doge$           |          \color{red}doge           | 字体颜色样式 |

### 4.1. 间隔

$$
a\!b \\
ab \\
a\,b \\
a\;b \\
a\ b \\
a\quad b \\
a\qquad b
$$

```latex
a\!b \\
ab \\
a\,b \\
a\;b \\
a\ b \\
a\quad b \\
a\qquad b
```

### 4.2. 矩阵

$$
\left(
\begin{matrix}
1 & 0 & \cdots & 0 \\
0 & 1 & \cdots & 0 \\
\vdots &\vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1
\end{matrix}
\right)
$$

```latex
\left(
\begin{matrix}
1 & 0 & \cdots & 0 \\
0 & 1 & \cdots & 0 \\
\vdots &\vdots & \ddots & \vdots \\
0 & 0 & \cdots & 1
\end{matrix}
\right)
```

### 4.3. 行列式

$$
\left|
\begin{matrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{matrix}
\right|
$$

```latex
\left|
\begin{matrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{matrix}
\right|
```

### 4.4. 方程组

$$
\begin{cases} x+y+z=1\\ 
x^2+y^2+z^2=1\\
z=0 
\end{cases}
$$

```latex
\begin{cases} x+y+z=1\\ 
x^2+y^2+z^2=1\\
z=0 
\end{cases}
```

### 4.5. 多行等式

$$
\begin{aligned}
x &= (a+b)^2-(a-b^2)\\
&= 4ab
\end{aligned}
$$

```latex
\begin{aligned}
x &= (a+b)^2-(a-b^2)\\
&= 4ab
\end{aligned}
```

### 4.6. 分段函数

$$
f(x)=
\begin{cases}
x,\quad x\geq0\\
0,\quad x<0
\end{cases}
$$

```latex
f(x)=
\begin{cases}
x,\quad x\geq0\\
0,\quad x<0
\end{cases}
```

### 4.7. 表格

$$
\begin{array}{|c|l|r|}
\hline 1&2&3\\
\hline 4&5&6\\
\hline 7&8&9\\
\hline
\end{array}
$$

```latex
\begin{array}{|c|l|r|}
\hline 1&2&3\\
\hline 4&5&6\\
\hline 7&8&9\\
\hline
\end{array}
```

### 4.8. 其他

$$
\begin{equation}
y=x+1
\end{equation} \tag{1}
$$

```latex
\begin{equation}
y=x+1
\end{equation} \tag{1}
```


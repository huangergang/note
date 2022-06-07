# java核心技术2

## 主体内容

![](..\java\img\目录结构2.png)

## 第一章

### 1.从迭代到流

流提供了一种可以比集合更高的概念级别上指定计算的数据视图。

“做什么而非怎么做”。

将peoples的List集合转换为一个stream并以性别过滤，在转换为一个List集合。

```java
List<Person> collect = peoples.stream()
    						  .filter(people -> people.getGender().equals(Gender.FEMALE))
                              .collect(Collectors.toList());
```

迭代做法

```java
Iterator<Person> it = peoples.iterator();
List<Person> con = new ArrayList<>();
while (it.hasNext()) {
    Person person = it.next();
    if (person.getGender().equals(Gender.FEMALE))
        con.add(person);
}
con.forEach(System.out::println);
```

> 流和迭代的差异
>
> * 流并不存储元素。这些元素可能存储在底层的集合中，或者是按需生成的。
> * 流的操作不会修改其数据源。
> * 流的操作是尽可能惰性执行的。

> 流的操作过程
>
> 1. 创建一个流。
> 2. 指定将初始流转换为其他流的中间操作，可以包含多个步骤。
> 3. 应用终止操作，从而产生结果。

俩个区别

```java
Stream<Person> stream = peoples.stream();
Stream<Person> personStream = peoples.parallelStream();  // parallelStream可以让流库以并行的方式执行过滤和计算
```

### 2.创建流

1.Collection接口的stream方法可以将任意一个集合转换为一个流。

```java
Collection<String> collection = new HashSet<>();
Stream<String> stream = collection.stream();
```

2.使用静态的Stream.of方法。

```java
Stream<String> stringStream = Stream.of("jack",
                                        "rose",
                                        "frank",
                                        "aim",
                                        "jason");
```

3.使用Arrays.stream(array,from,to)方法可以从[from,to)的元素创建一个流。

```java
String[] arr = {"jack",
                "rose",
                "frank",
                "aim",
                "jason"};
Stream<String> stringStream = Arrays.stream(arr,0,3);
```

4.使用静态的Stram.empty()方法创建不包含任何元素的流。

```java
Stream stream = Stream.empty();
```

5.使用Stram.generate()创建无限流。

```java
Stream<String> stringStream = Stream.generate(()->"infinite...");
```

```java
Stream<Double> randomStream = Stream.generate(Math::random);
```

6.使用Stram.iterate()创建无限流。

接受一个种子值，以及一个函数（是一个UnaryOperaion<T>）,并且会反复地将该函数应用到之前的结果上。

```java
Stream<BigInteger> integerStream = Stream.iterate(BigInteger.ZERO, n -> n.add(BigInteger.TEN));
```

### 3.filter、map、flatmap


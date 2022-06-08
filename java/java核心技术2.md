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

filter转换会产生一个流，它的元素与某种条件向匹配。filter的引元是Predicate<T>，从T到boolean的函数。

```java
Stream<String> stream = Stream.of("a","b","c","d");
stream.filter(s->s.hashCode()>97).forEach(System.out::println);
```

map会有一个函数应用到每个元素上，返回一个流。

```java
Stream<String> stream = Stream.of("a","b","c","d");
stream.map(String::toUpperCase).forEach(System.out::println);
```

flatMap可以将流合并。如有一个stream字符串流，对他使用letters方法可以将字符串拆解为单个字符流，而对一个字符串流使用letters方法会产生一个字符串流的流，为了避免这种情况，可以使用flatMap方法直接生成完整的字符流。

```java
public static Stream<String> letters(String s) {
    List<String> result = new ArrayList<>();
    for (int i = 0; i < s.length(); i++) {
        result.add(s.substring(i, i + 1));
    }
    return result.stream();
}

public static void main(String[] args) throws IOException{
    
    Stream<String> stream = Stream.of("ABC","EFG","HIG");
    Stream<Stream<String>> streamStream = stream.map(w -> letters(w));
    streamStream.forEach(w->{
        System.out.print("[");
        w.forEach(System.out::print);
        System.out.print("]");
    });
    
}
```

```java
stream.flatMap(w->letters(w)).forEach(System.out::print);
```

### 4.抽取和连接

>```java
>Stream<T> limit(long maxSize)    // 产生一个流，从开始到maxSize结束，如果maxSize大于流内元素的长度，则返回全部元素组成的流
>```
>
>```java
>Stream<T> skip(long n)           // 产生一个流，它的元素是当前流中出出了前n个元素之外的所有元素
>```
>
>```java
>static <T> Stream<T> concat(Stream<? extends T> a,Stream<? extends T> b)  // 产生一个流，它的元素是a的元素后跟b的元素 
>```

### 5.流的转换

>```java
>Stream<T> distinct()   // 产生一个流，包含当前流的不同元素
>```
>
>```java
>Stream<T> sorted()     // 产生一个流，对元素进行排序，要求元素类型实现了Comparable接口
>Stream<T> sorted(Comparator<? super T) comparator)   // 产生一个流，按比较器的方式排序
>```
>
>```java
>Stream<T> peek(Consumer<? super T> action)         // 产生一个流，它与当前流中的元素相同，在获取其中每个元素时，会将其传递给action
>```

排序翻转

```java
List<String> list = List.of("jack", "frank", "aim", "bob");
list.stream()
    .sorted(Comparator.comparing(String::length).reversed())
    .forEach(System.out::println);
```

### 6.简单约简

这些操作都是终结操作。

```java
Optional<T> max(Comparator<? super T> comparator)  // 产生流的最大元素，返回Optional包装随想对象，若流为空，产生一个空的Optional对象
Optional<T> min(Comparator<? super T> comparator)  // 产生流的最小元素，返回Optional包装随想对象，若流为空，产生一个空的Optional对象
```

```java
List<String> list = List.of("jack", "frank", "aim", "bob");
Optional<String> max = list.stream()
    .max(Comparator.comparing(String::length));
Optional<String> min = list.stream()
    .min(Comparator.comparing(String::length));
System.out.println(max);
System.out.println(min);
```

```java
Optional<T> finalFirst()      // 产生流的第一个元素，若流为空，产生一个空的Optional对象
Optional<T> finalAny()        // 产生流的任意一个元素，若流为空，产生一个空的Optional对象
```

```java
boolean anyMatch(Predicate<? super T> predicate)    // 流中任意元素匹配时，返回true
boolean allMatch(Predicate<? super T> predicate)    // 流中全部元素匹配时，返回true
boolean noneMatch(Predicate<? super T> predicate)   // 流中没有任何元素匹配时，返回true
```

List中存在一个以a开头的人名。

```java
List<String> list = List.of("jack", "frank", "aim", "bob");
System.out.println(list.stream().anyMatch(s -> s.startsWith("a")));

//true
```

List中都是以a开头的人名。

```java
List<String> list = List.of("jack", "frank", "aim", "bob");
System.out.println(list.stream().allMatch(s -> s.startsWith("a")));

// false
```

List中全都是在不以a开头的人名。

```java
List<String> list = List.of("jack", "frank", "aim", "bob");
System.out.println(list.stream().noneMatch(s -> s.startsWith("a")));

// false
```

### 7.Optional

Optional是一种包装器对象，要么包装了T类型的对象，要么没有包装任何对象。Optional<T>类型被当作一种更安全的方式，来替代类型T的引用，这种引用要么引用某个对象，要么为null。

有效的使用Optional的关键是要使用这样的方法：它的值不存在的情况下产生一个可替代物，而只有在值 存在的情况下才会使用这个值。




# java 内置数据类型

## 0. 2的不同次方

```yml
2的1次方：2
2的2次方：4
2的3次方：8
2的4次方：16
2的5次方：32
2的6次方：64
2的7次方：128
2的8次方：256
2的9次方：512
2的10次方：1024
2的11次方：2048
2的12次方：4096
2的13次方：8192
2的14次方：16384
2的15次方：32768
2的16次方：65536
2的17次方：131072
2的18次方：262144
2的19次方：524288
2的20次方：1048576
2的21次方：2097152
2的22次方：4194304
2的23次方：8388608
2的24次方：16777216
2的25次方：33554432
2的26次方：67108864
2的27次方：134217728
2的28次方：268435456
2的29次方：536870912
2的30次方：1073741824
2的31次方：2147483648
2的32次方：4294967296
2的33次方：8589934592
2的34次方：17179869184
2的35次方：34359738368
2的36次方：68719476736
2的37次方：137438953472
2的38次方：274877906944
2的39次方：549755813888
2的40次方：1099511627776
2的41次方：2199023255552
2的42次方：4398046511104
2的43次方：8796093022208
2的44次方：17592186044416
2的45次方：35184372088832
2的46次方：70368744177664
2的47次方：140737488355328
2的48次方：281474976710656
2的49次方：562949953421312
2的50次方：1125899906842624
2的51次方：2251799813685248
2的52次方：4503599627370496
2的53次方：9007199254740992
2的54次方：18014398509481984
2的55次方：36028797018963968
2的56次方：72057594037927936
2的57次方：144115188075855872
2的58次方：288230376151711744
2的59次方：576460752303423488
2的60次方：1152921504606846976
2的61次方：2305843009213693952
2的62次方：4611686018427387904
2的63次方：9223372036854775808
2的64次方：18446744073709551616
```

## 1. byte

​		byte 类型在 java 中长度为 1 个字节（8位）其中一位为符号位，表示-128 ~ 127之间的数。

```java
byte min = -128;
byte max =  127;
```



​		Byte 包装类

```java
public final class Byte extends Number implements Comparable<Byte> {

    public static final byte   MIN_VALUE = -128;

    public static final byte   MAX_VALUE = 127;
    
}
```

​		

## 2. short

​		short 类型在 java 中长度为 2 个字节（16位）其中一位为符号位，表示-32768 ~ 32767之间的数。

```java
short max = -32768;
short min =  32767;
```



​		Short 包装类

```java
public final class Short extends Number implements Comparable<Short> {

    public static final short   MIN_VALUE = -32768;

    public static final short   MAX_VALUE = 32767;
    
}
```

​		

## 3. int

​		int 类型在 java中长度为 4 个字节（32位）其中一位为符号位，表示-2147483648 ~ 2147483647 之间的数。

```java
int min = -2147483648;
int max =  2147483647;
```



​		Integer 包装类

```java
public final class Integer extends Number implements Comparable<Integer> {

    @Native public static final int   MIN_VALUE = 0x80000000;

    @Native public static final int   MAX_VALUE = 0x7fffffff;

}
```



## 4. long

​		long 类型在 java 中长度为 8 个字节（64位）其中一位为符号位，${-2^{63}}$  ~  ${2^{63}-1}$ 之间的数。

​		注意用 long 关键字定义 long 变量的时候后跟 L 或 l 表示此为 long 类型。 

```java
long min = -9223372036854775808L;
long max = 9223372036854775807L;
```



​		Long 包装类

```java
public final class Long extends Number implements Comparable<Long> {

    @Native public static final long MIN_VALUE = 0x8000000000000000L;

    @Native public static final long MAX_VALUE = 0x7fffffffffffffffL;
    
}
```



## 5. float

​		float 是单精度浮点类型，在 java 中长度为 4 个字节（32位）












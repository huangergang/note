练习题自创API

``` java
/**
 * Created Time: 2021-12-22  21:22
 * Describe: 计算整数[MinNumber,MaxNumber]范围内字符TargetChar出现的个数。
 * Versions: 1.0
 */
public static int getTargetCharNumber(int MinNumber, int MaxNumber, char TargetChar) {
    int number = 0;
    for (int i = MinNumber; i <= MaxNumber; i++) {
        char[] arr = Integer.toString(i).toCharArray();
        for (int j = 0; j < arr.length; j++) {
            if (arr[j] == TargetChar) {
                number++;
            }
        }
    }
    return number;
}
```

``` java
/**
 * Created Time: 2021-12-23  21:02
 * Describe: 判断number是否为质数
 * Versions: 1.0
 * @return true
 */
public static boolean isPrime(int number) {
    int ubound = (int) Math.sqrt((double) number) + 1;
    boolean bool = true;
    for (int i = 2; i < ubound; i++) {
        if (number % i == 0) {
            bool = false;
            break;
        }
    }
    return bool;
}

```

``` java
/**
  * Created Time: 2021-12-23  21:02
  * Describe: 返回整数[begin,end]范围内的所有质数，包括整数1
  * Versions: 1.0
  * @return ArrayList
  */
public static ArrayList toPrimeArray(int begin, int end) {
    ArrayList arr = new ArrayList();
    for (int i = begin; i <= end; i++) {
        boolean bool = isPrime(i);
        if (bool) {
            arr.add(i);
        }
    }
    return arr;
}

```

``` java
/**
  * Created Time: 2021-12-23  21:02
  * Describe: 返回排列数A_n^m
  * Versions: 1.0
  * @return int
  */
public static int arrangement(int n, int m) {
    int num = n - m;
    int res = 1;
    for (int i = n; i > num; i--) {
        res = res * i;
    }
    return res;
}
```

``` java
杨辉三角
public static void main(String[] args) {
Scanner in = new Scanner(System.in);
int number = in.nextInt();
int[][] arr = new int[number+1][number+1];
for (int i = 1; i <=number ; i++) {
    for (int j = 1; j <=i; j++) {
        if(i==j||j==1){
            arr[i][j]=1;
        }else{
            arr[i][j]=arr[i-1][j-1]+arr[i-1][j];
        }
    }
}
for (int i = 1; i < number+1; i++) {
    for (int j = 1; j <= i; j++) {
        System.out.print(arr[i][j] + "  ");
    }
    System.out.println();
}
}
```


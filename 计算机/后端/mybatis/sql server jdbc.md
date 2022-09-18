## sql server login

``` shell
osql -S localhost -U sa -P ******
```

##   链接sql  server

``` java
public class Test {
    public static String url = "jdbc:sqlserver://192.168.197.1:1433;DatabaseName=stu_info";
    public static String user = "sa";
    public static String password = "123456";

    public static void main(String[] args) {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection connection = DriverManager.getConnection(url, user, password);
            PreparedStatement preparedStatement = connection.prepareStatement("select * from Student");
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                System.out.print(resultSet.getString(1) + "  ");
                System.out.print(resultSet.getString(2) + "  ");
                System.out.print(resultSet.getString(3) + "  ");
                System.out.print(resultSet.getString(4) + "  ");
                System.out.print(resultSet.getString(5) + "  ");
                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

}
```



## 查询所有数据库

```sql
 select name from  master.dbo.SysDatabases order by name;
```

## 查询所有表

```sql
select name from SysObjects where XType='U' order by name
```


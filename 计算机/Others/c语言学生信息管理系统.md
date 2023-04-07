``` shell
#define _CRT_SECURE_NO_WARNINGS
#include<iostream>
#include<string>
using namespace std;
//宏定义变量
#define N 1024
#define MAXSIZE 32
#define WIDESIZE 65
typedef struct Student
{
	/*学生基本信息*/
	int code;	//学号
	char name[MAXSIZE];	//姓名，采用字符数组
	int age;	//年龄
	char sex[MAXSIZE];	//性别
	/*学生成绩信息*/
	int math;	//数学成绩
	int chinese;	//语文成绩
	int english;	//英语成绩
	struct Student* next;	//指向下一个学生的指针
}Student;
/*
*创建学生链表
*/
Student* createList()
{
	//申请一个Student【学生结构体】大小的控件
	Student* studentList = (Student*)malloc(sizeof(Student));
	return studentList;
}
/*
*创建学生节点
*/
Student* createNode()
{
	Student* newStu = (Student*)malloc(sizeof(Student));
	printf("学号:");
	scanf("%d", &newStu->code);
	printf("姓名:");
	scanf("%s", newStu->name);
	printf("年龄:");
	scanf("%d", &newStu->age);
	printf("性别:");
	scanf("%s", newStu->sex);
	printf("数学:");
	scanf("%d", &newStu->math);
	printf("语文:");
	scanf("%d", &newStu->chinese);
	printf("英语:");
	scanf("%d", &newStu->english);
	newStu->next = NULL;
	return newStu;
}
//显示学生信息
void showMsg(Student* stu)
{
	printf("%d\t%s\t%d\t%s\t%d\t%d\t%d\t\n", stu->code, stu->name, stu->age, stu->sex,
		stu->math, stu->chinese, stu->english);
}
/*
*添加学生信息
*/
Student* insertStudent(Student* head)
{
	int i, count;
	printf("请输入录入的学生人数\n");
	scanf("%d", &count);
	//获得学生链表的头节点
	Student* tail = head;
	//初始批量录入学生信息
	if (head)
	{
		for (i = 0; i < count; i++)
		{
			printf("==============输入第%d个学生信息==============》\n", i + 1);
			Student* newNode = createNode();
			tail->next = newNode;//tail永远指向最后一位学生，即尾节点
			tail = tail->next;
		}
	}
	else {
		//批量添加学生信息
		while (tail)
		{
			tail = tail->next;
		}
		for (i = 0; i < count; i++)
		{
			printf("==============输入第%d个学生信息==============》\n", i + 1);
			Student* newNode = createNode();//创建存储学生信息的节点
			tail->next = newNode;//添加学生
			tail = tail->next;//尾节点后移
		}
	}
	return head;//返回头节点
}
/*
*删除学生信息
*/
void deleteStudent(Student* studentList)
{
	printf("请输入学号:");
	int ditCode;
	scanf("%d", &ditCode);
	//获取链表头节点
	Student* preStudent = studentList;
	//获取链表第一个节点
	Student* afterStudent = studentList->next;
	if (afterStudent)//链表不是空
	{
		while (afterStudent)
		{
			if (afterStudent->code == ditCode)//学号相等，则说明已找到要删除的学生
			{
				preStudent->next = afterStudent->next;//进行删除操作
				free(afterStudent);//释放节点控件
				break;
			}
			else
			{//学生编号不相等，则继续向后移动，进行遍历
				preStudent = afterStudent;
				afterStudent = afterStudent->next;
			}
		}
	}
	else
	{
		printf("没有这名学生的信息!");
	}
}
/*
*根据学号修改学生信息
*/
//1.修改姓名
void changeName(Student* stu)
{
	char newName[MAXSIZE];
	printf("请输入新的名字:");
	scanf("%s", newName);
	strcpy(stu->name, newName);
	showMsg(stu);
}
//2.修改年龄
void changeAge(Student* stu)
{
	int newAge;
	printf("请输入新的年龄:");
	scanf("%d", &newAge);
	stu->age = newAge;
	showMsg(stu);
}
//3.修改数学成绩
void changeMathScore(Student* stu)
{
	int newSocre;
	printf("请输入新的数学成绩:");
	scanf("%d", &newSocre);
	stu->math = newSocre;
	showMsg(stu);
}
//4.修改语文成绩
void changeChineseScore(Student* stu)
{
	int newSocre;
	printf("请输入新的语文成绩:");
	scanf("%d", &newSocre);
	stu->chinese = newSocre;
	showMsg(stu);
}
//5.修改英语成绩
void changeEnglishScore(Student* stu)
{
	int newSocre;
	printf("请输入新的英语成绩:");
	scanf("%d", &newSocre);
	stu->chinese = newSocre;
	showMsg(stu);
}
/*
*
*1、采用多分支选择结构，实现学生信息的修改
*2、编辑学生信息输入对应的编号，进行对应的修改，例：1，则进行姓名修改
*/
void editStudent(Student* studentList)
{
	printf("请输入学号:");
	int ditCode;
	scanf("%d", &ditCode);
	Student* ditStu = studentList->next;
	if (ditStu != NULL)
	{
		while (ditStu != NULL)
		{
			if (ditStu->code == ditCode)
			{
				printf("请输入修改信息编号:\n1.姓名\n2.年龄\n3.数学\n4.语文\n5.英语\n");
				int number;
				scanf("%d", &number);
				switch (number)
				{
				case 1: changeName(ditStu);
					break;
				case 2: changeAge(ditStu);
					break;
				case 3: changeMathScore(ditStu);
					break;
				case 4: changeChineseScore(ditStu);
					break;
				case 5: changeEnglishScore(ditStu);
					break;
				default:
					printf("输入内容无效!");
				}
			}
			ditStu = ditStu->next;
		}
	}
	else {
		printf("抱歉，你还未录入学生信息，请先录入学生信息!\n");
	}
}
//根据学生编号查找学生信息
void findStudent(Student* studentList)
{
	printf("请输入学号:");
	int code;
	scanf("%d", &code);
	//指向第一个学生节点
	Student* ditStu = studentList->next;
	//如果学生链表不为空，则进行查询
	if (ditStu != NULL)
	{
		while (ditStu != NULL)
		{
			if (ditStu->code != code)	//学生学号不相等，则继续下一个比对查找
			{
				ditStu = ditStu->next;
			}
			else {//找到后则进行学生信息的输出
				showMsg(ditStu);
				break;
			}
		}
	}
	else {
		printf("没有这名学生的信息!");
	}
}
/*
*显示学生列表
*/
void showStudent(Student* studentList)
{
	Student* temp = studentList->next;
	printf("学号\t姓名\t年龄\t性别\t数学\t语文\t英语\n");
	//如果学生链表不为空，则进行输出
	while (temp != NULL) {
		showMsg(temp);
		temp = temp->next;
	}
	printf("\n");
}
/*
*保存学生信息到文件中
*/
void saveStudent(Student* studentList)
{
	//创建文件指针
	FILE* fp = NULL;
	//存放在D【C盘需要事先创建文件夹】盘根目录下，自动【有就不创建。否则创建文件】
		//fp = fopen("D:\\studentMsg.txt","a+");
		fp = fopen("C:\\Users\\SherryHan\\Desktop\\学习文件\\political\\studentMsg.txt", "a+");
	//“a+”采用追加的形式保存到文件中
	Student* stu = studentList->next;	//指针指向第一个学生
	char title[N] = "学号\t姓名\t年龄\t性别\t数学\t语文\t英语\n";
	//将标题【学生属性列】写入文件中
	fprintf(fp, "%s", title);
	//遍历学生链表，并将学生信息写入文件，直到最后一个学生的下一个节点为空
	while (stu != NULL)
	{
		fprintf(fp, "%d\t%s\t%d\t%s\t%d\t%d\t%d\n", stu->code, stu->name, stu->age, stu->sex
			, stu->math, stu->chinese, stu->english);
		stu = stu->next;
	}
	fclose(fp);
}
void showHelp()
{
	printf("1、此系统可以对学生信息进行管理。\n");
	printf("2、输入对应功能项的编号即可进行不同功能的系统操作。\n");
}
/*
*显示菜单
*/
void showMenu()
{
	int i;
	printf("------------------------");
	printf("\t欢迎使用学生管理系统\t");
	printf("------------------------\n");
	printf("\t");
	for (i = 0; i < WIDESIZE; i++)
	{
		printf("*");
	}
	printf("\n");
	printf("\t*\t0.系统帮助及说明\t**");
	printf("\t1.刷新学生信息\t\t*\n");
	printf("\t*\t2.查询学生信息\t\t");
	printf("**\t3.修改学生信息\t\t*\n");
	printf("\t*\t4.增加学生信息\t\t**");
	printf("\t5.按学号删除信息\t*\n");
	printf("\t*\t6.显示所有学生信息\t**");
	printf("\t7.保存当前信息\t\t*\n");
	printf("\t*\t8.退出学生管理系统\t**");
	for (i = 0; i < 4; i++)
	{
		printf("\t");
	}
	printf("*\n");
	printf("\t");
	for (i = 0; i < WIDESIZE; i++)
	{
		printf("*");
	}
	printf("\n");
	printf("------------------------");
	printf("\t2017级软件工程开发\t");
	printf("------------------------\n");
	printf("请按所需输入菜单编号:");
}
/*
*
*采用带头结点的链表来存储学生信息
*
*/
int main(int argc, char const* argv[])
{
	int choice;
	Student* studentList = createList();
	do
	{
		showMenu();
		scanf("%d", &choice);
		switch (choice)
		{
		case 0: showHelp();
			break;
		case 1: printf("刷新完成!\n");
			break;
		case 2: findStudent(studentList);
			break;
		case 3: editStudent(studentList);
			break;
		case 4: insertStudent(studentList);
			break;
		case 5: deleteStudent(studentList);
			break;
		case 6: showStudent(studentList);
			break;
		case 7: saveStudent(studentList);
			break;
		default:
			exit(1);
		}
	} while (1);
	return 0;
}
```


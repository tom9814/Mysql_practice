use practice;

create table emp(
	id int comment '编号',
	workno varchar(10) comment '工号',
    name varchar(10) comment '姓名',
    gender char(1) comment '性别',
    age tinyint comment '年龄',
    idcard char(18) comment '身份证号',
    workaddress varchar(50) comment '工作地址',
    entrydate date comment '入职时间'
) comment '员工表';

insert into emp values
	(1,'1','潘俊成','男',19,'123456789123456789','重庆市沙坪坝区万科金色','2024-2-14'),
	(2,'2','样楚昊','男',19,'133456789123456789','火星','2024-3-14'),
    (3,'3','小黄','女',18,'123446789123456789','水星','2023-2-14'),
    (4,'4','小周','女',16,'129456789123456789','上桥','2026-2-14'),
    (5,'5','火狗','男',20,'123456789123456089','地球','2024-8-14');

select name,workno,age from emp;

select workaddress '工作地址'from emp; 

select distinct age from emp;

select * from emp;
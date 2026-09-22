select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;

select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where age = 19;

select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where age <= 18;

insert into emp value (6,'6','大黄','男',56,NULL,'地球','2014-8-14');
#查询身份证号是空的人的信息
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where idcard is NULL;

select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where idcard is not NULL;
#查询年龄在16到19岁之间的学生
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where age between 16 and 19;
#查询年龄等于18且性别为女
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where age = 18 and gender = '女';
#查询年龄等于19或者等于18的人的信息
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where age = 19 or age = 18;

select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where age in(19,18);
#查询姓名是两个字的学生
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where name like '__';

update emp set idcard = '12345678912345678X' where name = '大黄';
#查询身份证号最后一位是X的人的信息
select id,workno,name,gender,age,idcard,workaddress,entrydate from emp where idcard like '%X';
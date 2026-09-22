select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;
#查询年龄是18,19,20的女性员工的信息
select * from emp where age in(18,19,20) && gender = '女';

#查询男性，年龄在10到20，且名字是三个字的人的信息
select * from emp where gender = '男' && age between 10 and 20 && name like '___';

#查询年龄小于40的男性人数和女性人数
select gender,count(*) from emp where age <= 40 group by gender;

#查询年龄小于二十岁员工的name,age，年龄升序，如相同则按入职时间降序排序
select name,age from emp where age <= 35 order by age asc, entrydate desc;

insert into emp value (7,'7','大火狗','男',25,'123456789123456019','地球','2004-8-14');

#查询性别为男，年龄在15到39之间的前三个员工信息,年龄升序，如相同，入职时间升序
select * from emp where age between 15 and 30 && gender = '男' order by age asc, entrydate asc limit 0, 3;
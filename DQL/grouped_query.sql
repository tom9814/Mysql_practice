select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;
#按性别分组,男生和女生成绩
select gender,count(*) from emp group by gender;

#按性别分组，男生和女生的平均年龄
select gender,avg(age) from emp group by gender;

#先找到年龄大于18的人所住地址的数量，之后再在having后再筛选出条件:数量大于2的地址
select workaddress,count(*) address_count from emp where age >= 18 group by workaddress having address_count >= 2;
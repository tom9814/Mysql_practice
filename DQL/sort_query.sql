select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;
#按年龄升序排序
select * from emp order by age;

#按入职时间倒序排序
select * from emp order by entrydate desc;

#先按年龄升序排序，如年龄相同，则按入职时间升序排序
select * from emp order by age asc, entrydate asc;
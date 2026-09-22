select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;
#第一页，每页4行数据
select * from emp limit 0, 4;
#第二页,每页4行数据
select * from emp limit 4, 4;
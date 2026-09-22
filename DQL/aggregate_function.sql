select id,workno,name,gender,age,idcard,workaddress,entrydate from emp;

select count(id) from emp;

select avg(age) from emp;

select max(age) from emp;

select min(age) from emp;

select sum(age) from emp where workaddress = '地球';
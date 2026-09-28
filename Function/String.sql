select	concat('Hello', ' Mysql');

select lower('HeLLO');

select upper('hello');

select lpad('01', 5, '-');

select rpad('01', 5, '-');

select trim(' hello  mysql ');

select substring('Hello Mysql', 1, 5);

#字符串函数应用
use practice;

update emp set workno = lpad(workno, 5, 0);
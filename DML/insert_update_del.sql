use practice;

insert into employee(id, workno, name, gender, age, idcard, entrydata) value (1, '1', '老八', '男', 20, '1234567812345678','2022-3-18');

insert into employee value (2, '2' ,'潘俊成','男' ,19, '1234567812345658', '2025-2-23');

insert into employee value (3, '3', '样楚昊', '男', 19, '1234567812345608', '2023-7-18'),(4, '4', '匡超', '男', 20, '1234567812345978', '2024-2-17');

update employee set name = '傻逼' where id = 1;

update employee set name = '小昭', gender = '女' where id = 1;

update employee set entrydata = '2008-1-01';

delete from employee where gender = '女';

delete from employee;

select * from employee;
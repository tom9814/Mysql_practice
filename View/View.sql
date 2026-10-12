use practice;

-- 创造视图
create or replace view emp_v_1 as select id, name, age from emp where age < 20;

-- 查询视图
show create view emp_v_1;

select * from emp_v_1 where id <= 3;

-- 修改视图
create or replace view emp_v_1 as select id, name, age, workaddress from emp where age < 20;

alter view emp_v_1 as select name, age from emp where age < 20;

-- 删除视图
drop view if exists emp_v_1;

-- 检查选项cascaded
create or replace view emp_v_1 as select id, name from emp where id < 10;

select * from emp_v_1;

insert into emp_v_1 values (8,'TOM');

insert into emp_v_1 values (10,'Jack');

create or replace view emp_v_1 as select id, name from emp where id < 10 with cascaded check option;

insert into emp_v_1 values (10,'Jack');

create or replace view emp_v_1 as select id, name from emp where id <= 20;

create or replace view emp_v_2 as select id, name from emp_v_1 where id >= 5 with cascaded check option;

insert into emp_v_2 values (10,'Fucker');

insert into emp_v_2 values (25,'asskiller');

create or replace view emp_v_3 as select id, name from emp_v_2 where id <= 15;

insert into emp_v_3 values (18,'Ass');

-- 检查选项local
create or replace view emp_v_4 as select id,name from emp where id <= 15;

create or replace view emp_v_5 as select id,name from emp_v_4 where id >= 5 with local check option;

insert into emp_v_5 values (20,'Asskiller');

-- 练习
create or replace view stu_cor as select s.id,c.name from student s, student_course sc, course c where s.id = sc.studentid and c.id = sc.courseid;

select * from stu_cor;



























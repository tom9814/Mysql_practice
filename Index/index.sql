use practice;

-- 查看索引
show index from emp2;

-- 创造索引
create index idx_emp2_name on emp2(name);

create index idx_emp2_age_job_salary on emp2(age,job,salary);

-- 删除索引
drop index idx_emp2_name on emp2;

-- 查看执行频次
show global status like 'Com_______';

select * from emp2;


show variables like 'slow_query_log';

-- explain执行计划
select s.*,c.* from student s, course c, student_course sc where s.id = sc.studentid and c.id = sc.courseid;

explain select s.*,c.* from student s, course c, student_course sc where s.id = sc.studentid and c.id = sc.courseid;

select * from student where id in (select studentid from student_course where courseid = (select id from course where name = 'MySQL'));

explain select * from student where id in (select studentid from student_course where courseid = (select id from course where name = 'MySQL'));

-- 最左前缀法则
explain select * from emp2 where age = 48 and job = '开发' and salary = 11000;

explain select * from emp2 where age = 48 and job = '开发';

explain select * from emp2 where age = 48;

explain select * from emp2 where age = 48 and salary = 11000;

explain select * from emp2 where job = '开发' and salary = 11000;

explain select * from emp2 where job = '开发' and salary = 11000 and age = 48;

explain select * from emp2 where salary = 11000 and job = '开发' and age = 48;

-- 范围查询，范围查询右边的索引失效
explain select * from emp2 where age > 30 and job = '开发' and salary = 11000;

explain select * from emp2 where age >= 30 and job = '开发' and salary = 11000;

-- 索引失效
-- 1.头部模糊匹配
explain select * from emp2 where name like '火%';

explain select * from emp2 where name like '%狗';

-- 2.or的一侧有索引，一侧没有索引
explain select * from emp2 where name = '潘俊成' or job = '项目经理';

-- 3.数据分布，MySQL觉得扫描全表更快的话就不会使用索引
explain select * from emp2 where name is not null;

-- SQL提示
create index idx_emp2_age on emp2(age);

explain select * from emp2 where age = 48;

explain select * from emp2 use index(idx_emp2_age) where age = 48;

explain select * from emp2 ignore index(idx_emp2_age_job_salary) where age = 48;

explain select * from emp2 force index(idx_emp2_age) where age = 48;

-- 覆盖索引&回表查询
show index from emp2;

drop index idx_emp2_age on emp2;

explain select * from emp2 where name = '火狗';

-- 需要回表查询的情况
explain select id,name,age from emp2 where name = '火狗';

-- 前缀索引
select count(distinct substring(idcard,1,10)) / count(emp.idcard) from emp;

create index idx_emp_idcard_10 on emp(idcard(10));

show index from emp;

explain select * from emp where idcard = '123446789123456789';

































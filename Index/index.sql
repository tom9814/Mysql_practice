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


















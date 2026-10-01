use practice;

create table student(
	id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    no varchar(10) comment '学号'
) comment '学生表';

insert into student(id,name,no) values
	(1, '潘俊成', 2000100101),
    (2, '杨楚昊', 2000100102),
    (3, '大黄', 2000100103),
    (4, '匡超', 2000100104);
    
create table courese(
	id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '课程名称'
) comment '课程表';

insert into course(id,name) values
	(null, 'Java'),
    (null, 'PHP'),
    (null, 'MySQL'),
    (null, 'Hadoop');
    
create table student_course(
	id int auto_increment comment '主键' primary key,
    studentid int not null comment '学生ID',
    courseid int not null comment '课程ID',
    constraint fk_courseid foreign key (courseid) references course(id),
    constraint fk_studentid foreign key (studentid) references student(id)
) comment '学生课程中间表';

create table emp2(
	id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '工资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
)comment '员工表';

insert into emp2(id,name,age,job,salary,entrydate,managerid,dept_id) values
	(1,'潘俊成',66,'总裁',20000,'2000-01-01',null,5),
    (2,'杨楚昊',20,'项目经理',12500,'2005-12-05',1,1),
    (3,'小黄',33,'开发',8400,'2000-11-03',2,2),
    (4,'火狗',48,'开发',11000,'2002-02-05',2,2),
    (5,'大黄',43,'开发',10500,'2004-09-07',3,3),
    (6,'小周',19,'程序员鼓励师',6600,'2004-10-12',2,null),
    (7,'皮克曼',55,'项目经理',12500,'2015-12-05',1,1);

alter table emp2 add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);

insert into student_course(id,studentid,courseid) values
	(1,1,1),(2,1,2),(3,1,3),(4,2,2),(5,2,3),(6,3,4);
    
#多表查询
select * from emp2,dept where emp2.dept_id = dept.id;

#内连接的语法
select e.name, d.name from emp2 e, dept d where e.dept_id = d.id;

select e.name, d.name from emp2 e inner join dept d on e.dept_id = d.id;

#左外连接和右外连接
select  e.* , d.name from emp2 e left join dept d on e.dept_id = d.id;

select d.* , e.* from  emp2 e right join dept d on e.dept_id = d.id;

#自连接
select e1.name, e2.name  from emp2 e1 left join emp2 e2 on e1.managerid = e2.id;

#联合查询
select * from emp2 where salary > 10000
union all
select * from emp2 where age > 45;

select * from emp2 where salary > 10000
union
select * from emp2 where age > 45;

#标量子查询
select id from dept where name = '市场部';
select * from emp2 where dept_id = 2;

select * from emp2 where dept_id = (select id from dept where name = '市场部');

#列子查询
select id from dept where name in ('市场部','财务部');
select * from emp2 where dept_id in (select id from dept where name in ('市场部','财务部'));

select salary from emp2 where dept_id = (select id from dept where name = '市场部');
select * from emp2 where salary > all(select salary from emp2 where dept_id = (select id from dept where name = '市场部'));
select * from emp2 where salary > any(select salary from emp2 where dept_id = (select id from dept where name = '市场部'));

#行子查询
select managerid, dept_id from emp2 where name = '火狗';
select * from emp2 where (managerid, dept_id) = (select managerid, dept_id from emp2 where name = '火狗');

#表子查询
select managerid, dept_id from emp2 where name in ('火狗', '杨楚昊');
select * from emp2 where (managerid,dept_id) in (select managerid, dept_id from emp2 where name in ('火狗', '杨楚昊'));

select * from emp2 where entrydate > '2002-01-01';
select e.*, d.name from (select * from emp2 where entrydate > '2002-01-01') e left join dept d on e.dept_id = d.id;

#练习

#创一个新表
create table salgrade(
    grade int,
    losal int,
    hisal int
) comment '薪资等级表';

insert into salgrade values (1, 0,3000);
insert into salgrade values (2, 3001,5000);
insert into salgrade values (3, 5001,8000);
insert into salgrade values (4, 8001,10000);
insert into salgrade values (5, 10001,15000);
insert into salgrade values (6, 15001,20000);

#1.查询员工的姓名，年龄，职位，部门信息
select e.name, e.age, e.job, d.name from emp2 e , dept d where e.dept_id = d.id;

#2.查询年龄小于40岁的员工的姓名，年龄，职位，部门信息
select e.name, e.age, e.job, d.name from emp2 e join dept d on e.dept_id = d.id and e.age < 40;

#3.查询拥有员工的部门ID,部门信息
select distinct d.* from emp2 e, dept d where e.dept_id = d.id;

#4.查询所有年龄大于40的员工及其归属的部门名称
select e.*, d.name from emp2 e left join dept d on e.dept_id = d.id where e.age > 40;

#5.查询所有员工的工资等级
select e.id, e.name, g.grade from emp2 e join salgrade g on e.salary between g.losal and g.hisal;

#6.查询研发部所有员工的信息及工资等级
select id from dept where name = '研发部';
select e.*, s.grade from emp2 e, salgrade s where e.dept_id = (select id from dept where name = '研发部') and (e.salary between s.losal and s.hisal);
#另外的做法
select e.*, s.grade from emp2 e, dept d, salgrade s where e.dept_id = d.id and (e.salary between s.losal and s.hisal) and d.name = '研发部';

#7.查询"研发部"所有员工的平均工资
select * from emp2 where dept_id = (select id from dept where name = '研发部');
select avg(new.salary) from (select * from emp2 where dept_id = (select id from dept where name = '研发部')) new;
#另外的做法
select avg(e.salary) from emp2 e, dept d where e.dept_id = d.id and d.name = '研发部';

#8.查询工资比“火狗”高的员工信息
select salary from emp2 where name = '火狗';
select * from emp2 where salary > (select salary from emp2 where name = '火狗');

#9.查询比平均工资高的员工信息
select avg(salary) from emp2;
select * from emp2 where salary > (select avg(salary) from emp2);

#10.查询低于本部门平均薪资的员工信息
select avg(salary) from emp2 e2 where dept_id = 1;
select * from emp2 e1 where e1.salary = (select avg(salary) from emp2 e2 where e2.dept_id = e1.dept_id);

#11.查询所有的部门信息，并统计部门的员工人数
select d.id, d.name, (select count(*) from emp2 e where e.dept_id = d.id) '人数' from dept d;
select count(*) from emp2 e where e.dept_id = 1;

#12.查询所有学生的选课情况,展示出学生名称，学号，课程名称
select * from student;
select s.name, s.no, c.name from student s, course c, student_course sc where s.id = sc.studentid and c.id = sc.courseid;













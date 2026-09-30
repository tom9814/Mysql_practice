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
    (6,'小周',19,'程序员鼓励师',6600,'2004-10-12',2,null);

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

















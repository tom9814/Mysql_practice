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

insert into student_course(id,studentid,courseid) values
	(1,1,1),(2,1,2),(3,1,3),(4,2,2),(5,2,3),(6,3,4);
    
#多表查询
select * from emp2,dept where emp2.dept_id = dept.id;

#内连接的语法
select e.name, d.name from emp2 e, dept d where e.dept_id = d.id;

select e.name, d.name from emp2 e inner join dept d on e.dept_id = d.id;
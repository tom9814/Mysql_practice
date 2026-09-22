use practice;
create table emp (
	id int comment '编号',
    workno varchar(10) comment '工号',
    name varchar(10) comment '姓名',
    gender char(1) comment '性别',
    age tinyint unsigned comment '年龄',
    idcard char(18) comment '身份证号',
    entrydata date comment '入职时间'
    );
desc emp;

alter table emp add nickname varchar(20) comment '绰号';

desc emp;

alter table emp change nickname user_name varchar(30) comment '用户名';

desc emp;

alter table emp drop user_name;

desc emp;

alter table emp rename to employee;

show tables;

create table temptb (
	name varchar(20)
    );
    
show tables;

drop table if exists temptb;

show tables;
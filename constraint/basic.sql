create table user(
	id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int check (age > 0 and age <= 120) comment '年龄',
    status char(1) default '1' comment '状态',
    gender char(1) comment '性别'
)comment "用户表";

insert into user(name,age,status,gender) values
	('Tom1', 19, '1', '男'),
    ('Tom2', 25, '0', '男');
    
    
insert into user(name,age,status,gender) values('Tom1', 19, '1', '男');

insert into user(name,age,status,gender) values('Tom3', 130, '1', '男');

insert into user(name,age,status,gender) values('Tom3', 21, '1', '男');

insert into user(name,age,gender) values('Tom4', 100, '男');
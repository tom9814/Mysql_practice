select if(false, "Ok", "Error");

select ifnull(true, "dafult");

use practice;

select * from emp;

update emp set workaddress = '上海' where id = 7;

select name, (case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end) as '工作地址' from emp;

#应用练习
create table score (
	id int comment 'ID',
    name varchar(20) comment '姓名',
    math int comment '数学',
    english int comment '英语',
    chinese int comment '语文'
) comment '学员成绩表';

insert into score(id,name,math,english,chinese) values
	(1,'Tom',67,88,95),
    (2,'Rose',23,66,90),
    (3,'Jack',56,98,76);
    
select name,
	case when math >= 85 then '优秀' when math >= 60 then '及格' else '不及格' end,
	case when english >= 85 then '优秀' when english >= 60 then '及格' else '不及格' end,
    case when chinese >= 85 then '优秀' when chinese >= 60 then '及格' else '不及格' end
    from score;
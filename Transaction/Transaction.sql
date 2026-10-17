use practice;

create table account(
    id int auto_increment primary key  comment '主键id',
    name varchar(10) comment '姓名',
    money int comment '余额'
) comment '账户表';

insert into account(id, name, money) values (null,'张三',2000),(null,'李四',2000);

-- 还原数据
update account set money = 2000 where name in ('张三', '李四');


-- 方式1
select @@autocommit;
set @@autocommit = 0;

-- 1.查询张三的余额
select * from account where name = '张三';

-- 2.张三的余额-1000
update account set money = money - 1000 where name = '张三';
出现异常……

-- 3.李四的余额+1000
update account set money = money + 1000 where name = '李四';

-- 提交事务
commit;

-- 回滚事务
rollback;

-- 方式2
start transaction;

-- 1.查询张三的余额
select * from account where name = '张三';

-- 2.张三的余额-1000
update account set money = money - 1000 where name = '张三';
出现异常……

-- 3.李四的余额+1000
update account set money = money + 1000 where name = '李四';

-- 提交事务
commit;

-- 回滚事务
rollback;

select @@transaction_isolation;

set session transaction isolation level read committed;

set session transaction isolation level repeatable read;



















use practice;

-- 准备工作  创建表emp_logs
create table emp_logs(
    id int(11) not null auto_increment,
    operation varchar(20) not null comment '操作类型， insert/update/delete',
    operation_time datetime not null comment  '操作时间',
    operation_id int(11) not null comment '操作的ID',
    operation_params varchar(500) comment '操作参数',
    primary key (id)
)charset = utf8;

-- 创建插入数据触发器
create trigger emp_insert_trigger
    after insert on emp for each row
begin
    insert into emp_logs(id, operation, operation_time, operation_id, operation_params) values
    (null,'insert',now(),new.id,concat('插入的数据内容为: id = ',new.id,', workno = ',new.workno,', name = ',new.name,', gender = ',new.gender,', age = ',new.age,', idcard = ', new.idcard,', workaddress = ',new.workaddress,', entrydate = ',new.entrydate));
end;


-- 查看触发器
show triggers ;


-- 删除触发器
drop trigger emp_insert_trigger;


-- 插入数据
insert into emp(id, workno, name, gender, age, idcard, workaddress, entrydate) VALUES
    (8,'00008','Asskiller','男',23,'123456789123456789','东京','2002-01-08');


-- 创造修改数据的触发器
create trigger emp_update_trigger
    after update on emp for each row
begin
    insert into emp_logs(id, operation, operation_time, operation_id, operation_params) values
    (null,'insert',now(),new.id,
     concat('原来的数据内容为: id = ',old.id,', workno = ',old.workno,', name = ',old.name,', gender = ',old.gender,', age = ',old.age,', idcard = ', old.idcard,', workaddress = ',old.workaddress,', entrydate = ',old.entrydate,
                            ' | 更新后的数据内容为: id = ',new.id,', workno = ',new.workno,', name = ',new.name,', gender = ',new.gender,', age = ',new.age,', idcard = ', new.idcard,', workaddress = ',new.workaddress,', entrydate = ',new.entrydate));
end;

show triggers ;


update emp set gender = '女' where name = '潘俊成';

update emp set age = 18 where id <= 3;

-- 创造删除数据的触发器
create trigger emp_delete_trigger
    after delete on emp for each row
begin
    insert into emp_logs(id, operation, operation_time, operation_id, operation_params) values
    (null,'delete',now(),old.id,
     concat('删除之前的数据内容为: id = ',old.id,', workno = ',old.workno,', name = ',old.name,', gender = ',old.gender,', age = ',old.age,', idcard = ', old.idcard,', workaddress = ',old.workaddress,', entrydate = ',old.entrydate));
end;

show triggers ;

drop trigger emp_delete_trigger;

delete from emp where id = 6;












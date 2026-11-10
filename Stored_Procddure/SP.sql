use practice;

-- 存储过程基本语法
-- 创建
create procedure p1()
begin
    select count(*) from emp;
end;

-- 调用
call p1();

-- 查看
select * from information_schema.ROUTINES where ROUTINE_SCHEMA = 'practice';

show create procedure p1;

-- 删除
drop procedure p1;

-- 用户定义变量
-- 定义
set @myname = '潘俊成';
set @myage := 19;
set @mygender := '男', @myhobby := 'hiking';

select @mycolor := 'Blue';
select count(*) into @mycount from emp;

-- 使用
select @myname, @myage, @mygender, @myhobby;

select @mycolor, @mycount;

-- 局部变量
create procedure p2()
begin
    declare emp_count int default 0;
    select count(*) into emp_count from emp;
    select emp_count;
end;

call p2();

-- if语句与参数
create procedure p3(in score int, out result varchar(10))
begin
    if score >= 85 then
        set result = '优秀';
    elseif score >= 60 then
        set result = '及格';
    else
        set result = '不及格';
    end if;
end;

call p3(55,@result);
select @result;

create procedure p4(inout score double)
begin
    set score := score / 2;
end;

set @score = 151;
call p4(@score);
select @score;


-- case
create procedure p5(in month int)
begin
    declare result varchar(10);

    case
        when month between 1 and 3 then
            set result = '第一季度';
        when month between 4 and 6 then
            set result = '第二季度';
        when month between 7 and 9 then
            set result = '第三季度';
        when month between 10 and 12 then
            set result = '第四季度';
        else
            set result = '非法参数';
    end case;

    select concat('你输入的月份为: ', month, ', 所属的季度为: ', result);
end;

drop procedure p5;

call p5(16);

-- while
create procedure p6(in n int)
begin
    declare total int default 0;
    while n > 0 do
        set total = total + n;
        set n = n - 1;
    end while;
    select total;
end;

call p6(100);

-- repeat
create procedure p7(in n int)
begin
    declare total int default 0;
    repeat
        set total := total + n;
        set n := n - 1;
    until n <= 0
    end repeat;
    select total;
end;

call p7(100);

-- loop
create procedure p8(in n int)
begin
    declare total int default 0;

    sum:loop
        if n <= 0 then
            leave sum;
        end if;

        set total = total + n;
        set n = n - 1;
    end loop sum;

    select total;
end;

call p8(100);

create procedure p9(in n int)
begin
    declare total int default 0;

    sum:loop
        if n <= 0 then
            leave sum;
        end if;

        if n % 2 = 1 then
            set n := n - 1;
            iterate sum;
        end if;

        set total = total + n;
        set n = n - 1;
    end loop sum;

    select total;
end;

call p9(100);

-- cursor
create procedure p10(in uage int)
begin
    declare e_workno varchar(10);
    declare e_name varchar(10);
    declare e_cursor cursor for select workno,name from emp where age <= uage;
    -- 定义handle
    declare exit handler for SQLSTATE '02000' close e_cursor;

    drop table if exists tb_emp_workno;
    create table if not exists tb_emp_workno
    (
      id int primary key auto_increment,
      workno varchar(10),
      name varchar(10)
    );

    open e_cursor;
    while true do
        fetch e_cursor into e_workno,e_name;
        insert into tb_emp_workno values (null, e_workno,e_name);
    end while;
    close e_cursor;
end;

call p10(18);


-- 存储函数
create function fun1(n int)
returns int deterministic
begin
    declare total int default 0;

    while n > 0 do
        set total = total + n;
        set n = n - 1;
    end while;

    return total;
end;


select fun1(100);






























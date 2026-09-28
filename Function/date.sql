select curdate();

select curtime();

select now();

select year(now());

select month(now());

select day(now());

select date_add(now(), interval 70 month);

select datediff('2026-8-20', '2025-9-30');

#应用
select name, datediff(now(), entrydate) as 'entrydays'from emp order by entrydays desc;
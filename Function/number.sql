select ceil(1.1);

select floor(1.9);

select mod(6, 4);

select rand();

select round(2.345, 2);

#应用
select lpad(ceil(rand() * 1000000), 6, 0);
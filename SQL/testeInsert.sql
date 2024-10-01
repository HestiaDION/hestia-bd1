insert into cargo (cargo)
select nome from cliente where codigo = 201
union all
select nome from cliente where codigo = 202;

delete from cargo where cargo in (select nome from cliente where codigo = 201
union all
select nome from cliente where codigo = 202);

select * from cargo

insert into regiao (codigo, nome) values
(6, (select nome from cliente where codigo = 201)),
(7, (select nome from cliente where codigo = 202));
select * from regiao
delete from regiao where codigo = 6 or codigo = 7





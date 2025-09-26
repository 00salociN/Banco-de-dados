create table carros (
brand varchar(255),
model varchar(255),
year int
);

select * from carros;

select brand, year from carros;

---------------------------------------------

insert into carros (brand, model, year)
values
('Ford', 'Mustang', 1964);

insert into carros (brand, model, year)
values
('Volvo', 'p1800', 1968),
('BMW', 'M1', 1978),
('Toyota', 'Celica', 1975);

---------------------------------------------

alter table carros add
color varchar(255);

alter table carros alter 
column year type varchar(4);

/* alguns tipos de dados não podem ser convertidos se a coluna
tiver valor. Por exemplo, números sempre podem ser convertidos em texto, 
mas texto nem sempre pode ser convertido em números. */

alter table carros alter 
column color type varchar(30);

alter table carros drop
column color;

---------------------------------------------

update carros
set color = 'red'
where brand ='Volvo';

/* Exemplo de um erro

update carros 
set color = 'red';

Afeta todas as linhas */

update carros
set color = 'white', year = 1970
where brand = 'Toyota';

---------------------------------------------

/* Tenha cuidado ao excluir registros de uma tabela!
Observe a WHERE cláusula na DELETE instrução. 
A WHERE cláusula especifica qual(is) registro(s) deve(m) ser excluído(s).

Se você omitir a WHERE cláusula,
todos os registros na tabela serão excluídos !. */

delete from carros
where brand = 'Volvo';

delete from carros;

-- Excluir todos os registros na tabela carros
truncate table carros;
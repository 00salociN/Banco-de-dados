create table membros (
id int not null,
sobrenome varchar(200) not null,
nome varchar(200) not null,
endereco varchar(300) not null,
zipcode int not null,
telefone varchar(200) not null,
recomendado int,
data_de_entrada timestamp not null,
constraint pk_members primary key (id),
constraint fk_members foreign key (recomendado) references membros (id) on delete set null
);

create table instalacoes (
id int not null,
name varchar(100) not null,
custo_membro numeric not null,
custo_hospede numeric not null,
gasto_inical numeric not null,
manutencao_mensal numeric not null,
constraint pk_instalacoes primary key (id)
);

create table reservas (
id int not null,
id_instalacoes int not null,
id_membros int not null,
data_inicio timestamp not null,
lugares int not null,
constraint pk_reservas primary key (id),
constraint fk_reservas_instalcoes foreign key (id_instalacoes) references instalacoes (id),
constraint fk_reservas_membros foreign key (id_membros) references membros (id)
);


INSERT INTO membros (id, sobrenome, nome, endereco, zipcode, telefone, recomendado, data_de_entrada) VALUES
(1, 'Silva', 'João', 'Rua A, 123', 12345, '11999999999', NULL, '2022-01-10 08:30:00'),
(2, 'Souza', 'Maria', 'Rua B, 456', 54321, '11988888888', 1, '2022-02-15 10:00:00'),
(3, 'Lima', 'Carlos', 'Rua C, 789', 67890, '11977777777', 2, '2022-03-20 09:00:00'),
(4, 'Fernandes', 'Ana', 'Av. Central, 100', 98765, '11966666666', 1, '2022-04-01 14:00:00');

insert into membros (id, sobrenome, nome, endereco, zipcode, telefone, recomendado, data_de_entrada) values
(5, 'Lima', 'Fernanda', 'Rua Verde, 77', 11223344, '11922221111', 4, '2023-03-22 13:00:00'),
(6, 'Rodrigues', 'Marcos', 'Av. Laranja, 88', 55664488, '11933332222', null, '2023-04-05 15:00:00'),
(7, 'Martins', 'Juliana', 'Rua Azul, 99', 66778899, '11911112222', 2, '2023-05-10 10:30:00'),
(8, 'Gomes', 'Ricardo', 'Av. Central, 111', 77889900, '11900001111', 6, '2023-06-15 09:45:00'),
(9, 'Barbosa', 'Laura', 'Rua Nova, 123', 88990011, '11999990000', 3, '2023-07-01 11:00:00'),
(10, 'Almeida', 'Thiago', 'Rua dos Ipês, 333', 99001122, '11988880000', null, '2023-07-20 17:00:00');


INSERT INTO instalacoes (id, name, custo_membro, custo_hospede, gasto_inical, manutencao_mensal) VALUES
(1, 'Quadra de Tênis', 20.00, 50.00, 5000.00, 300.00),
(2, 'Piscina Coberta', 15.00, 40.00, 3000.00, 200.00),
(3, 'Sala de Yoga', 10.00, 25.00, 2000.00, 150.00);

insert into instalacoes (id, name, custo_membro, custo_hospede, gasto_inical, manutencao_mensal) values
(4, 'Pista de Corrida', 8.00, 20.00, 6000.00, 300.00),
(5, 'Sala de Pilates', 12.00, 25.00, 5000.00, 250.00),
(6, 'Salão de Festas', 50.00, 100.00, 20000.00, 1000.00);


INSERT INTO reservas (id, id_instalacoes, id_membros, data_inicio, lugares) VALUES
(1, 1, 2, '2022-05-01 09:00:00', 2),
(2, 2, 3, '2022-05-02 10:30:00', 1),
(3, 3, 1, '2022-05-03 08:00:00', 1),
(4, 1, 4, '2022-05-04 07:00:00', 2);





select * from instalacoes;

select name, custo_membro from instalacoes;

select * from instalacoes where id >= 0 and id <= 2;

select id, name, custo_membro, manutencao_mensal from instalacoes where custo_membro > 0 and (custo_membro < manutencao_mensal/ 50.0)

/* o like não sabe diferenciar joão e João
	já o ilike sabe a diferenciar maiusculas de minusculas, mas não sabe diferencias tenis e tênis */
select * from instalacoes where name ilike '%tênis%';

select * from instalacoes where name ilike 'sala%';

select name, case when (manutencao_mensal > 250) then 'caro demais'
else 'bararo pros pobres' end as preco from instalacoes;

select id, nome, sobrenome, data_de_entrada from membros where data_de_entrada > '2023-02-02';

-- parei no *Removendo duplicatas e ordenando resultados*

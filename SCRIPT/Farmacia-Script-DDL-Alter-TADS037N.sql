-- Comandos SQL DDL: Alter table

alter table departamento
	add column descricao varchar(100) null;
    
desc departamento;

alter table departamento
	change column descricao detalhamento varchar(130) null;
    
alter table departamento
	modify column nome varchar(25) not null;
    
alter table departamento
	add column telefone varchar(11) not null after email;

alter table departamento
	modify column telefone varchar(11) not null after `local`;

desc departamento;

alter table departamento
	drop column telefone;

alter table departamento
	drop column detalhamento;



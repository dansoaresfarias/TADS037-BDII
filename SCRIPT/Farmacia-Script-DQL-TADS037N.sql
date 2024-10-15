select * from cliente;

select * from funcionario;

select cpf, nome, email, sexo, estadoCivil, dataNasc,  ch, salario,
	comissao, dataAdm
	from funcionario;

select cpf as "CPF", nome "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    dataNasc "Data de Nascimento",  ch "Carga-horária", 
    salario "Salário", comissao "Comissão", dataAdm "Data de Admissão"
	from funcionario;

select cpf as "CPF", nome "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    dataNasc "Data de Nascimento",  ch "Carga-horária", 
    salario "Salário", comissao "Comissão", dataAdm "Data de Admissão"
	from funcionario
		order by nome;
        
select cpf as "CPF", nome "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    dataNasc "Data de Nascimento",  ch "Carga-horária", 
    salario "Salário", comissao "Comissão", dataAdm "Data de Admissão"
	from funcionario
		order by salario desc;
        
select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão"
	from funcionario
		order by nome;
        
select funcionario_cpf from enderecoFunc 
	where cidade like "Recife" and bairro like "Boa Vista";

select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão"
	from funcionario
		where cpf in (select funcionario_cpf from enderecoFunc 
			where cidade like "Recife" and bairro like "Boa Vista")
		order by nome;

select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão"
	from funcionario
		where salario > (select avg(salario) from funcionario)
			order by nome;

select avg(salario) from funcionario;

select concat("R$ ", format(avg(salario), 2, 'de_DE')) as "Média de Salarial"
	from funcionario;

select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão"
	from funcionario
		where salario + comissao > (select avg(salario+comissao) from funcionario)
			order by nome;
            
select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão"
	from funcionario
		where salario + comissao = (select max(salario+comissao) from funcionario)
			order by nome;
            
select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão"
	from funcionario
		where salario + comissao = (select min(salario+comissao) from funcionario)
			order by nome;
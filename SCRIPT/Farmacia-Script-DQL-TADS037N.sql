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
        
select cpf as "CPF", nome "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    ch "Carga-horária", 
    salario "Salário", comissao "Comissão", dataAdm "Data de Admissão"
	from funcionario
		order by nome;
        

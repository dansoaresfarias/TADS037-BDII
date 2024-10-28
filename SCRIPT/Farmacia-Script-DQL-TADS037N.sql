-- SQL DQL
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
            
select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão",
    cidade "Cidade"
	from funcionario, enderecofunc
		where cpf = Funcionario_cpf
			order by nome;

select cpf as "CPF", upper(nome) "Funcionário", email "E-mail", 
	sexo "Gênero", estadoCivil "Estado Civil", 
    date_format(dataNasc, '%d/%m/%Y') "Data de Nascimento",  
    concat(ch, "h") "Carga-horária", 
    concat("R$ ", format(salario, 2, 'de_DE')) "Salário", 
    concat("R$ ", format(comissao, 2, 'de_DE')) "Comissão", 
    concat("R$ ", format(salario + comissao, 2, 'de_DE')) "Salário + Comissão",
    date_format(dataAdm, '%H:%i %d/%m/%Y') "Data de Admissão",
    cidade "Cidade", bairro "Bairro"
	from funcionario
		inner join enderecofunc on cpf = Funcionario_cpf
			order by nome;

select dep.cpf "CPF do Dependente", dep.nome "Dependente", 
	dep.parentesco "Parentesco", 
    timestampdiff(year, dep.dataNasc, now()) "Idade", func.nome "Reponsável"
	from dependente dep
		inner join funcionario func on func.cpf = dep.Funcionario_cpf
			order by func.nome, dep.nome;

select dep.cpf "CPF do Dependente", dep.nome "Dependente", 
	dep.parentesco "Parentesco", 
    timestampdiff(year, dep.dataNasc, now()) "Idade", func.nome "Reponsável"
	from dependente dep
		inner join funcionario func on func.cpf = dep.Funcionario_cpf
			where timestampdiff(year, dep.dataNasc, now()) >= 4
				order by func.nome, Idade;

select func.cpf "CPF", func.nome "Funcionário", 
	concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
	concat("R$ ", format(func.comissao, 2, 'de_DE'))  "Comissão",
    count(dep.cpf) "Qtd de Dependentes"
	from funcionario func
		inner join dependente dep on dep.Funcionario_cpf = func.cpf
			group by func.cpf
				order by func.nome;

select func.cpf "CPF", func.nome "Funcionário", 
	concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
	concat("R$ ", format(func.comissao, 2, 'de_DE'))  "Comissão",
    count(dep.cpf) "Qtd de Dependentes",
    concat("R$ ", format(180 * count(dep.cpf), 2, 'de_DE')) "Aux. Escola",
    concat("R$ ", format(func.salario + func.comissao + 180 * count(dep.cpf), 2, 'de_DE')) "Salário Bruto"
	from funcionario func
		left join dependente dep on dep.Funcionario_cpf = func.cpf
			group by func.cpf
				order by func.nome;
-- Erro de group by
select func.cpf "CPF", func.nome "Funcionário", crg.nome "Cargo",
	concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
	concat("R$ ", format(func.comissao, 2, 'de_DE'))  "Comissão",
    count(dep.cpf) "Qtd de Dependentes",
    concat("R$ ", format(180 * count(dep.cpf), 2, 'de_DE')) "Aux. Escola",
    concat("R$ ", format(func.salario + func.comissao + 180 * count(dep.cpf), 2, 'de_DE')) "Salário Bruto"
	from funcionario func
		left join dependente dep on dep.Funcionario_cpf = func.cpf
		inner join trabalhar trab on trab.Funcionario_cpf = func.cpf
        inner join cargo crg on crg.cbo = trab.Cargo_cbo
			group by dep.Funcionario_cpf, trab.Funcionario_cpf
				order by func.nome;

select func.cpf "CPF", func.nome "Funcionário", crg.nome "Cargo",
	dep.nome "Departamento",
	concat("R$ ", format(func.salario, 2, 'de_DE')) "Salário", 
	concat("R$ ", format(func.comissao, 2, 'de_DE'))  "Comissão"
    from funcionario func
		inner join trabalhar trab on trab.Funcionario_cpf = func.cpf
        inner join cargo crg on crg.cbo = trab.Cargo_cbo
		inner join departamento dep on dep.idDepartamento = trab.Departamento_idDepartamento
				order by func.nome;

create view vPagFuncionario as
	select func.cpf "cpf", func.nome "funcionario", 
		concat("R$ ", format(func.salario, 2, 'de_DE')) "salario", 
		concat("R$ ", format(func.comissao, 2, 'de_DE'))  "comisao",
		count(dep.cpf) "qtdDependentes",
		concat("R$ ", format(180 * count(dep.cpf), 2, 'de_DE')) "auxEscola",
		concat("R$ ", format(func.salario + func.comissao + 180 * count(dep.cpf), 2, 'de_DE')) "salarioBruto"
		from funcionario func
			left join dependente dep on dep.Funcionario_cpf = func.cpf
				group by func.cpf
					order by func.nome;
                    
select vpagfunc.cpf "CPF", vpagfunc.funcionario "Funcionário",
	crg.nome "Cargo", 
    dep.nome "Departamento", vpagfunc.salario "Salário",
    vpagfunc.comisao "Comissão", 
    vpagfunc.qtdDependentes "Quantidade de Dependentes",
    vpagfunc.auxEscola "Auxílio Escola",
    vpagfunc.salarioBruto "Salário Bruto"
	from vpagfuncionario vpagfunc
	inner join trabalhar trb on trb.Funcionario_cpf = vpagfunc.cpf
    inner join cargo crg on crg.cbo = trb.Cargo_cbo
    inner join departamento dep on dep.idDepartamento = trb.Departamento_idDepartamento
		order by vpagfunc.funcionario;

create view vPagFolha as
	select vpagfunc.cpf "CPF", vpagfunc.funcionario "Funcionário",
		crg.nome "Cargo", 
		dep.nome "Departamento", vpagfunc.salario "Salário",
		vpagfunc.comisao "Comissão", 
		vpagfunc.qtdDependentes "Quantidade de Dependentes",
		vpagfunc.auxEscola "Auxílio Escola",
		vpagfunc.salarioBruto "Salário Bruto"
		from vpagfuncionario vpagfunc
		inner join trabalhar trb on trb.Funcionario_cpf = vpagfunc.cpf
		inner join cargo crg on crg.cbo = trb.Cargo_cbo
		inner join departamento dep on dep.idDepartamento = trb.Departamento_idDepartamento
			order by vpagfunc.funcionario;

select * from vPagFolha;





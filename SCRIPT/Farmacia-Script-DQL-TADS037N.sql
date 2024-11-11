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

-- Questões do petshop
-- Relatório 1 - Lista dos empregados admitidos entre 2019-01-01 e 2022-03-31, 
-- trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  Salário, 
-- Departamento, Número de Telefone), ordenado por data de admissão decrescente;
select upper(emp.nome) "Nome Empregado", emp.cpf "CPF Empregado", 
	date_format(emp.dataAdm, '%H:%i - %d/%m/%Y') "Data Admissão",  
	concat("R$ ", format(emp.salario, 2, 'de_DE'))"Salário", 
    dep.nome "Departamento", tel.numero "Número de Telefone" 
	from empregado emp
		inner join departamento dep on dep.idDepartamento = emp.Departamento_idDepartamento
		left join telefone tel on tel.empregado_cpf = emp.cpf
			where emp.dataAdm between '2019-01-01' and '2023-03-31'
				order by emp.dataAdm desc;


-- Relatório 2 - Lista dos empregados que ganham menos que a média salarial dos funcionários 
-- do Petshop, trazendo as colunas (Nome Empregado, CPF Empregado, Data Admissão,  
-- Salário, Departamento, Número de Telefone), ordenado por nome do empregado;
select upper(emp.nome) "Nome Empregado", emp.cpf "CPF Empregado", 
	date_format(emp.dataAdm, '%H:%i - %d/%m/%Y') "Data Admissão",  
	concat("R$ ", format(emp.salario, 2, 'de_DE')) "Salário", 
    dep.nome "Departamento", tel.numero "Número de Telefone" 
	from empregado emp
    inner join departamento dep on dep.idDepartamento = emp.Departamento_idDepartamento
	left join telefone tel on tel.empregado_cpf = emp.cpf
		where salario <= (select avg(salario) from empregado)
				order by emp.nome;
                
-- Relatório 3 - Lista dos departamentos com a quantidade de empregados total por 
-- cada departamento, trazendo também a média salarial dos funcionários do departamento 
-- e a média de comissão recebida pelos empregados do departamento, com as colunas 
-- (Departamento, Quantidade de Empregados, Média Salarial, Média da Comissão), 
-- ordenado por nome do departamento;
select dep.nome "Departamento", count(emp.cpf) "Quantidade de Empregados", 
	concat("R$ ", format(avg(emp.salario), 2, 'de_DE')) "Média Salarial", 
    concat("R$ ", format(avg(emp.comissao), 2, 'de_DE')) "Média da Comissão"
	from departamento dep
		left join empregado emp on emp.Departamento_idDepartamento = dep.idDepartamento
		group by dep.idDepartamento
			order by dep.nome;

-- Relatório 4 - Lista dos empregados com a quantidade total de vendas já realiza 
-- por cada Empregado, além da soma do valor total das vendas do empregado e a soma 
-- de suas comissões, trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, 
-- Quantidade Vendas, Total Valor Vendido, Total Comissão das Vendas), ordenado por 
-- quantidade total de vendas realizadas;
select upper(emp.nome) "Nome Empregado", emp.cpf "CPF Empregado", emp.sexo "Gênero",
	concat("R$ ", format(emp.salario, 2, 'de_DE')) "Salário", 
    count(vnd.idVenda) "Quantidade Vendas", 
    concat("R$ ", format(sum(vnd.valor - vnd.desconto), 2, 'de_DE')) "Total Valor Vendido", 
    concat("R$ ", format(sum(vnd.comissao), 2, 'de_DE')) "Total Comissão das Vendas"
	from empregado emp
		inner join venda vnd on vnd.Empregado_cpf = emp.cpf
			group by emp.cpf
				order by count(vnd.idVenda) desc;

-- Relatório 5 - Lista dos empregados que prestaram Serviço na venda computando a 
-- quantidade total de vendas realizadas com serviço por cada Empregado, além da soma do 
-- valor total apurado pelos serviços prestados nas vendas por empregado e a soma de suas 
-- comissões, trazendo as colunas (Nome Empregado, CPF Empregado, Sexo, Salário, Quantidade 
-- Vendas com Serviço, Total Valor Vendido com Serviço, Total Comissão das Vendas com Serviço)
-- , ordenado por quantidade total de vendas realizadas;
select upper(emp.nome) "Nome Empregado", emp.cpf "CPF Empregado", emp.sexo "Gênero",
	concat("R$ ", format(emp.salario, 2, 'de_DE')) "Salário", 
    count(vnd.idVenda) "Quantidade de Vendas com Serviço", 
    concat("R$ ", format(sum((isv.valor - isv.desconto) * isv.quantidade), 2, 'de_DE')) 
		"Total Valor Vendido com Serviço",
    concat("R$ ", format(sum(vnd.comissao), 2, 'de_DE')) 
		"Total Comissão das Vendas com Serviço"
	 from empregado emp
		inner join itensservico isv on isv.Empregado_cpf = emp.cpf
        inner join servico srv on srv.idServico = isv.Servico_idServico
        inner join venda vnd on vnd.idVenda = isv.Venda_idVenda
			group by emp.cpf
				order by count(vnd.idVenda) desc;

-- Relatório 6 - Lista dos serviços já realizados por um Pet, trazendo as colunas 
-- (Nome do Pet, Data do Serviço, Nome do Serviço, Quantidade, Valor, 
-- Empregado que realizou o Serviço), ordenado por data do serviço da mais recente a 
-- mais antiga;  
select p.nome "Nome do Pet", vnd.`data` "Data do Serviço", srv.nome "Nome do Serviço", 
	isv.quantidade "Quantidade", 
    concat("R$ ", format(isv.valor, 2, 'de_DE')) "Valor", 
	emp.nome "Empregado que realizou o Serviço"
	 from pet p 
		inner join itensservico isv on isv.pet_idpet = p.idpet
        inner join servico srv on srv.idServico = isv.Servico_idServico
        inner join venda vnd on vnd.idVenda = isv.Venda_idVenda
		inner join empregado emp on emp.cpf = isv.Empregado_cpf
			order by vnd.`data` desc;

-- Relatório 7 - Lista das vendas já realizados para um Cliente, 
-- trazendo as colunas (Data da Venda, Valor, Desconto, Valor Final, 
-- Empregado que realizou a venda), ordenado por data do serviço da mais 
-- recente a mais antiga;
select date_format(vnd.data, '%H:%i - %d/%m/%Y') "Data da Venda", 
	concat("R$ ", format(vnd.valor, 2, 'de_DE')) "Valor", 
    concat("R$ ", format(vnd.desconto, 2, 'de_DE')) "Desconto", 
    concat("R$ ", format(vnd.valor - vnd.desconto, 2, 'de_DE'))"Valor Final", 
	emp.nome "Funcionário que Atendeu"
	from venda vnd
		inner join empregado emp on emp.cpf = vnd.Empregado_cpf
        inner join cliente cli on cli.cpf = vnd.Cliente_cpf
			where cli.cpf = "604.569.393-00"
				order by vnd.data desc;

-- Relatório 8 - Lista dos 10 serviços mais vendidos, trazendo a quantidade 
-- vendas cada serviço, o somatório total dos valores de serviço vendido, 
-- trazendo as colunas (Nome do Serviço, Quantidade Vendas, Total Valor Vendido), 
-- ordenado por quantidade total de vendas realizadas;
select srv.nome "Nome do Serviço", count(isv.Venda_idVenda) "Quantidade Vendas",
	concat("R$ ", format(sum((isv.valor - isv.desconto) * isv.quantidade)
    , 2, 'de_DE')) "Total Valor Vendido"
	from itensservico isv
    inner join servico srv on srv.idServico = isv.Servico_idServico
		group by srv.idServico
			order by count(isv.Venda_idVenda) desc;

-- cpf, funcionario, salario(SB), comissao, aux alimentacao(550), 
-- aux saude(idade), aux escola(180*filho<=6), INSS, IRRF, salario liquido
select replace(replace(func.cpf, '.', ''), '-', '') "CPF", 
	upper(func.nome) "Funcionário",
    coalesce(tel.numero, "Não informado") "Telefone", 
	format(func.salario, 2, 'de_DE') "Salário Bruto", 
    format(func.comissao, 2, 'de_DE') "Comissão",
    format(550, 2, 'de_DE') "Auxílio Alimentação", 
	case when timestampdiff(year, func.dataNasc, now()) <= 25 then 250
		when timestampdiff(year, func.dataNasc, now()) >= 26 and 
			timestampdiff(year, func.dataNasc, now()) <= 35 then 350
            else 0
		end "Aux Saude"
	from funcionario func
		left join telefone tel on tel.Funcionario_cpf = func.cpf
		order by func.nome;














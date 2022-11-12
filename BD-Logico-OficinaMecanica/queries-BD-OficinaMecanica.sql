-- queries para o BD oficinaMecanica
use oficinaMecanica;

-- veiculos por cliente
select * from cliente inner join veiculo on cliente.idCliente = veiculo.idCliente;

-- serviços realizados
select nomeServico, count(*) as qtdServicos from rServico r 
	inner join servico s on r.idServico = s.idServico
    group by r.idServico;

-- serviços ainda não realizados pelos clientes
select * from Servico s  
	where s.idServico not in (select distinct(idServico) from rServico);
    
-- Especialidades dos mecanicos
select especialidade from mecanico;

-- quantidade de OS por cliente
select primeiroNome, sobrenome, count(*) as ordens from ordemServico o  
	inner join cliente c on o.idCliente = c.idCliente
    group by o.idCliente order by count(*);

-- quantidade de OS por mecanico
select nome, count(*) as ordens from rservico r 
	inner join mecanico m on r.idMecanico = m.idMecanico
    group by r.idMecanico;
    
-- veiculo com mais OS
select modelo, placa, count(*) as qtdVeiculos from ordemServico o 
	inner join veiculo v on o.idVeiculo = v.idVeiculo
    group by o.idVeiculo;
    
-- valores por OS
select c.PrimeiroNome, o.idOS, o.valorTotal as gastoPorOS from ordemServico o 
	inner join cliente c on o.idCliente = c.idCliente;
    
-- valor total por cliente
select c.PrimeiroNome, sum(o.valorTotal) as custoTotal from ordemServico o 
	inner join cliente c on o.idCliente = c.idCliente
    group by o.idCliente;
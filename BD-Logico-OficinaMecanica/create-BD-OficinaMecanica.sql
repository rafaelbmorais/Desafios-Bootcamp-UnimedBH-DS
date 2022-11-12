-- banco de dados de uma oficina mecanica

create database oficinaMecanica;
use oficinaMecanica;
-- drop database oficinamecanica;

-- tabela cliente
create table cliente(
	idCliente int not null auto_increment,
    cpf char(11) not null,
    primeiroNome varchar(45) not null,
    segundoNome varchar(3),
    sobrenome varchar(45) not null,
    endereco varchar(100) not null,
    telefone char(11) not null,
    email varchar(45),
    primary key (idCliente),
    constraint unique_cpf unique (cpf)
);

-- tabela veiculo
create table veiculo(
	idVeiculo int not null auto_increment,
    idCliente int,
    placa char(7) not null,
    marca varchar(45) not null,
    modelo varchar(45) not null,
    cor varchar(45) not null,
    ano int not null,
    km int not null,
    primary key (idVeiculo),
    constraint unique_placa unique (placa),
    constraint fk_veiculo_cliente foreign key (idCliente) references cliente(idCliente)
);

-- tabela ordem de servico
create table ordemServico(
	idOS int not null auto_increment,
    idVeiculo int,
    idCliente int,
    statusOS enum('Orçamento', 'Aprovada', 'Em andamento', 'Cancelada', 'Fechada') not null default 'Orçamento',
    dataEntrada date not null,
    dataSaida date not null,
    valorPecas float not null,
    valorServico float not null,
    valorTotal float not null,
    primary key (idOS),
    constraint fk_os_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
    constraint fk_os_cliente foreign key (idCLiente) references cliente(idCliente)
);

-- tabela mecanico
create table mecanico(
	idMecanico int not null auto_increment,
    matricula char(5) not null,
    nome varchar(60) not null,
    especialidade varchar(45) not null,
    primary key (idMecanico),
    constraint unique_matricula_mecanico unique (matricula)
);

-- tabela servico
create table servico(
	idServico int not null auto_increment,
    codigoServico char(10) not null,
    nomeServico varchar(45) not null,
    valor float not null,
    primary key (idServico)
);

-- tabela peça
create table insumo(
	idInsumo int not null auto_increment,
    codigoInsumo char(10) not null,
    nomeInsumo varchar(45) not null,
    fabricante varchar(45) not null,
    valor float not null,
    primary key (idInsumo)
);

-- relação tabela reposição insumo
create table rInsumo(
    idInsumo int not null,
    idOS int not null,
    quantidade int not null,
    primary key (idInsumo, idOS),
    constraint fk_rInsumo_insumo foreign key (idInsumo) references insumo(idInsumo),
    constraint fk_rInsumo_os foreign key (idOS) references ordemServico(idOS)
);

-- relaçao tabela realiza serviço
create table rServico(
	idOS int not null,
    idServico int not null,
    idMecanico int not null,
    TipoServico varchar(45) not null,
    primary key (idOS, idServico, idMecanico),
    constraint fk_rServico_os foreign key (idOS) references ordemServico(idOS),
    constraint fk_rServico_servico foreign key (idServico) references servico(idServico),
    constraint fk_rServico_mecanico foreign key (idMecanico) references mecanico(idMecanico)
);

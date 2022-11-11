-- criação do banco de dados para o cenário de e-commerce

create database ecommerce;
use ecommerce;

-- drop database ecommerce;

-- tabela cliente
create table cliente(
	idCliente int auto_increment primary key,
	TipoCliente enum('Pessoa Física', 'Pessoa Jurídica') default 'Pessoa Física'
);

alter table cliente auto_increment = 1;

-- tabela pessoa física
create table pessoaFisica(
	idPessoaFisica int auto_increment primary key,
    idCliente int,
	PrimeiroNome varchar(10),
    NomeMeio varchar(3),
	Sobrenome varchar(15),
    CPF char(11) not null,
    DataNascimento date,
    Endereco varchar(100),
    Telefone char(11),
    Email varchar(45),
    constraint unique_cpf_cliente unique (CPF),
    constraint fk_cliente_pessoafisica foreign key (idCliente) references cliente(idCliente)
);

-- tabela pessoa jurídica
create table pessoaJuridica(
	idPessoaJuridica int auto_increment primary key,
    idCliente int,
	RazaoSocial varchar(80) not null,
    NomeFantasia varchar(80),
	CNPJ char(14) not null,
	InscricaoEstadual varchar(45),
    InscricaoMunicipal varchar(45),
    Endereco varchar(100) not null,
    Telefone char(11) not null,
    Email varchar(45),
    constraint unique_cnpj_cliente unique (CNPJ),
    constraint fk_cliente_pessoajuridica foreign key (idCliente) references cliente(idCliente)
);

-- tabela produto
create table produto(
	idProduto int auto_increment primary key,
    NomeProduto varchar(45) not null,
    Categoria varchar(45),
    Descricao varchar(45),
    ValorUnitario float
);

-- tabela pedido
create table pedido(
	idPedido int auto_increment primary key,
    idPedidoCliente int,
    StatusPedido enum('Em andamento', 'Em processamento', 'Enviando', 'Entregue') default 'Em processamento',
    Descricao varchar(255),
    ValorPedido float not null,
    ValorFrete float not null,
    DataPedido date,
    constraint fk_pedido_cliente foreign key (idPedidoCliente) references cliente(idCliente)
);

-- tabela pagamento
create table pagamento(
	idPagamento int,
    idPagamentoPedido int,
    idPagamentoCliente int,
    StatusPagamento enum('Aguardando', 'Confirmado') default 'Aguardando',
    primary key(idPagamento, idPagamentoPedido, idPagamentoCliente),
    constraint fk_pagamento_pedido foreign key (idPagamentoPedido) references pedido(idPedido),
    constraint fk_pagamento_cliente foreign key (idPagamentoCliente) references cliente(idCliente)
);

-- tabela PIX - Pagamento
create table pix(
	idPix int auto_increment primary key,
    idPagamentoPix int,
    idPedidoPagamentoPix int,
    CodigoIdentificacao varchar(45) not null,
    Comentario varchar(80),
    constraint fk_pagamento_pix foreign key (idPagamentoPix) references pagamento(idPagamento),
    constraint fk_pedido_pagamento_pix foreign key (idPedidoPagamentoPix) references pedido(idPedido)
);

-- tabela Boleto - Pagamento
create table boleto(
	idBoleto int auto_increment primary key,
    idPagamentoBoleto int,
    idPedidoPagamentoBoleto int,
    CodigoBarras varchar(45) not null,
    CodigoBanco varchar(45) not null,
    DataVencimento date not null,
    constraint fk_pagamento_boleto foreign key (idPagamentoBoleto) references pagamento(idPagamento),
    constraint fk_pedido_pagamento_boleto foreign key (idPedidoPagamentoBoleto) references pedido(idPedido)
);

-- tabela Cartão de Crédito - Pagamento
create table cartaoCredito(
	idCartao int auto_increment primary key,
    NumeroCartao char(16) not null,
    Bandeira varchar(45) not null,
    DataValidade date not null,
    CVV int not null,
    constraint unique_numero_cartao unique (NumeroCartao)
);

-- tabela estoque
create table estoque(
	idEstoque int auto_increment primary key,
    LocalEstoque varchar(255),
    Quantidade int default 0
);

-- tabela entrega
create table entrega(
	idEntrega int auto_increment primary key,
    idPedidoEntrega int,
    idClientePedidoEntrega int,
    StatusEntrega enum('Aguardando Liberação', 'Em rota de entrega', 'Entregue') default 'Aguardando Liberação' not null,
    CodigoRastreio varchar(45) not null,
    EnderecoEntrega varchar(100) not null,
    constraint fk_pedido_entrega foreign key (idPedidoEntrega) references pedido(idPedido),
    constraint fk_cliente_pedido_entrega foreign key (idClientePedidoEntrega) references cliente(idCliente)
);

-- tabela fornecedor
create table fornecedor(
	idFornecedor int auto_increment primary key,
    RazaoSocial varchar(80) not null,
    NomeFantasia varchar(80),
    CNPJ char(14) not null,
    Endereco varchar(100) not null,
    NomeResponsavel varchar(45) not null,
    Email varchar(45) not null,
    telefone char(11) not null,
    constraint unique_fornecedor unique (CNPJ)
);

-- tabela vendedor
create table vendedor(
	idVendedor int auto_increment primary key,
    RazaoSocial varchar(80) not null,
    NomeFantasia varchar(80),
    CNPJ char(14),
    Endereco varchar(100) not null,
    NomeResponsavel varchar(45),
    Email varchar(45) not null,
    Telefone char(11) not null,
    constraint unique_cnpj_vendedor unique (CNPJ)
    -- constraint unique_cpf_vendedor unique (CPF)
);

-- relação Produtos por Vendedor
create table produtoVendedor(
	idProdutoVendedor int,
    idProduto int,
    Quantidade int default 1,
    primary key (idProdutoVendedor, idProduto),
    constraint fk_ProdutoVendedor foreign key (idProdutoVendedor) references vendedor(idVendedor),
    constraint fk_pv_produto foreign key (idProduto) references produto(idProduto)
);

-- relação Produtos por Pedido
create table produtoPedido(
	idProdutoProduto int,
    idPedidoPedido int,
    Quantidade int default 1,
    StatusProdutoPedido enum('Disponível', 'Indisponível') default 'Disponível',
    primary key (idProdutoProduto, idPedidoPedido),
    constraint fk_pp_produto foreign key (idProdutoProduto) references produto(idProduto),
    constraint fk_pp_pedido foreign key (idPedidoPedido) references pedido(idPedido)
);

-- relação Produtos em Estoque
create table produtoEstoque(
	idPEproduto int,
    idPEestoque int,
    Localidade varchar(255) not null,
    primary key (idPEproduto, idPEestoque),
    constraint fk_pe_produto foreign key (idPEproduto) references produto(idProduto),
    constraint fk_pe_estoque foreign key (idPEestoque) references estoque(idEstoque)
);

-- relação Produto Fornecedor
create table produtoFornecedor(
	idPFfornecedor int,
    idPFproduto int,
    Quantidade int not null,
	primary key (idPFfornecedor, idPFproduto),
    constraint fk_pf_produto foreign key (idPFproduto) references produto(idProduto),
    constraint fk_pf_fornecedor foreign key (idPFfornecedor) references fornecedor(idFornecedor)
);

-- relação Pagamento Cartão de Credito
create table pagamentoCartao(
	idPagamentoCartao int,
    idPagamentoCartaoPedido int,
    idCartaoCredito int,
    QuantidadeParcelas int default 1 not null,
    primary key (idPagamentoCartao, idPagamentoCartaoPedido, idCartaoCredito),
    constraint fk_pagamento_cartao foreign key (idPagamentoCartao) references pagamento(idPagamento),
    constraint fk_pagamento_cartao_pedido foreign key (idPagamentoCartaoPedido) references pedido(idPedido)
    -- constraint fk_cartao_credito foreign key (idCartaoCredito) references cartaoCredito(idCartao)
);


-- show tables;
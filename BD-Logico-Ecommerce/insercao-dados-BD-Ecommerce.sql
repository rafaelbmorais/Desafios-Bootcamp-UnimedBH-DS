-- inserção de dados
use ecommerce;

-- tabela cliente
insert into cliente (TipoCliente)
	values('Pessoa Física'),
		  ('Pessoa Física'),
          ('Pessoa Física'),
          ('Pessoa Jurídica'),
          ('Pessoa Jurídica'),
		  ('Pessoa Física');
-- select * from cliente;

-- tabela pessoa fisica
insert into pessoaFisica (idCliente, PrimeiroNome, NomeMeio, Sobrenome, CPF, DataNascimento, Endereco, Telefone, Email)
	values(1, 'Jose', 'S', 'Santos', 12345678900, '1975-05-02', 'Rua da Posse, 01, Centro - São Paulo/SP - 1234-567', '11000000001', 'jose@jose.br'),
          (2, 'Maria', 'J', 'Silva', 45678912301, '1980-10-05', 'Rua Dr Zezinho, 99, Bairro 1 - Jandira/SP - 4567-890', 11000000002, 'maria@maria.br'),
          (3, 'Carol', 'A', 'Oliveira', 35216489715, '1990-01-01', 'Av dos Camelos, 711, Centro - São José do Rio Preto/SP - 10001-213', 16900041234, 'carol@carol.com'),
		  (6, 'Sergio', 'A', 'Oliveira', 34646516310, '1951-02-12', 'Av dos Camelos, 711, Centro - São José do Rio Preto/SP - 10001-213', 16902241456, 'sergio@sergio.com'); 
-- select * from pessoaFisica;

-- tabela pessoa juridica
insert into pessoaJuridica (idCliente, RazaoSocial, NomeFantasia, CNPJ, InscricaoEstadual, InscricaoMunicipal, Endereco, Telefone, Email)
	values(4, 'Empresa ABC Eletroeletronicos', 'ABC Eletronicos', 11123456000101, 'Isento', 'Isento', 'Av dos Eletronicos, 123 - Industrial - Guarulhos/SP - 1230-001', 11000010001, 'contato@abceletro.com'),
		  (5, '123 Comercio Geral Ltda', 'Loja 123', 89123789000101, 'Isento', 'Isento', 'Rua dos Buracos, 10 - Jd. Furado - São Paulo/SP - 2300-101', 11456221234, 'contato@123.com');
-- select * from pessoaJuridica;

-- tabela produto
insert into produto (NomeProduto, Categoria, Descricao, ValorUnitario)
	values('Use a cabeça - Aprenda SQL', 'Livro', 'Programação', 80.00),
		  ('Cadeira Gamer', 'Móveis', 'Designer e conforto', 1200.99),
          ('Torneira Elétrica', 'Elétrica', 'Conforto', 125.60),
          ('Bule café', 'Utensílio Doméstico', 'Praticidade', 65.99),
          ('Camiseta simples', 'Vestuário', 'Conforto e qualidade', 50.00); 
-- select * from produto;

-- tabela pedido
insert into pedido (idPedidoCliente, StatusPedido, Descricao, ValorPedido, ValorFrete, DataPedido)
	values(1, 'Em andamento', 'App', 80.00, 12.00, '2022-10-21'),
		  (2, 'Enviando', 'Site', 1200.99, 75.00, '2022-11-03'),
          (3, default, 'Site', 125.60, 12.00, '2022-10-30'),
          (4, default, 'App', 65.99, 12.00, '2022-11-03'),
          (5, 'Entregue', 'App', 50.00, 12.00, '2022-10-05'),
		  (3, 'Em andamento', 'Site', 80.00, 12.00, '2022-11-01');
-- select * from pedido;

-- tabela pagamento
insert into pagamento (idPagamento, idPagamentoPedido, idPagamentoCliente, StatusPagamento)
	values(1, 1, 1, default),
          (2, 2, 2, 'Confirmado'),
          (3, 3, 3, default),
          (4, 4, 4, default),
          (5, 5, 5, 'Confirmado');
-- select * from pagamento;

-- tabela pix - pagamento
insert into pix (idPagamentoPix, idPedidoPagamentoPix, CodigoIdentificacao, Comentario)
	values(1, 1, 'abc123def456', 'compra de livro');
-- select * from pix;
    
-- tabela Boleto - Pagamento
insert into boleto (idPagamentoBoleto, idPedidoPagamentoBoleto, CodigoBarras, CodigoBanco, DataVencimento)
	values(2, 2, 16497229989961349, 112, '2022-11-15');
-- select * from boleto;

-- tabela cartão de credito - Pagamento
insert into cartaoCredito (NumeroCartao, Bandeira, DataValidade, CVV)
	values(9876123467894321, 'Visa', '2023-10-12', 123),
          (1234789525873654, 'Mastercard', '2024-05-26', 527),
          (1954824697314826, 'Elo', '2023-07-01', 487);
-- select * from cartaoCredito;

-- tabela estoque
insert into estoque (LocalEstoque, Quantidade)
	values('Campinas', 20),
          ('Curitiba', 35),
          ('Belo Horizonte', 100),
          ('Rio Grande do Norte', 56),
          ('São Paulo', 250);
-- select * from estoque;

-- tabela entrega
insert into entrega (idPedidoEntrega, idClientePedidoEntrega, StatusEntrega, CodigoRastreio, EnderecoEntrega)
	values(1, 1, 'Aguardando Liberação', 1234567, 'Rua da Posse, 01, Centro - São Paulo/SP - 0010-100'),
          (2, 2, 'Em rota de entrega', 6497313, 'Rua Dr Zezinho, 99, Bairro 1 - Jandira/SP - 4567-890'),
          (3, 3, default, 5138646, 'Av dos Camelos, 711, Centro - São José do Rio Preto/SP - 10001-213'),
          (4, 4, default, 1345891, 'Av dos Eletronicos, 123 - Industrial - Guarulhos/SP - 1230-001'),
          (5, 5, 'Entregue', 4976453, 'Rua dos Buracos, 10 - Jd. Furado - São Paulo/SP - 2300-101');
-- select * from entrega;

-- tabela fornecedor
insert into fornecedor (RazaoSocial, NomeFantasia, CNPJ, Endereco, NomeResponsavel, Email, Telefone)
	values('Programando Editora e Distribuidora Ltda', 'Programando', 01001111000101, 'Rua SQL, 789 - Bairro Tabela - São Paulo/SP - 1010-101', 'Bill Gates', 'bill@programando.com', 11900001000),
          ('XinguiLing Distribuidora Ltda', 'ShopeeLing', 45321789000101, 'Rua da China, 1010 - Jd Chinatown - São Paulo/SP - 7845-321', 'Jet Lee', 'lee@shopeeling.com', 11912345678),
          ('Luren Elétrica S.A.', 'Lurenzetu', 12398754000101, 'Rua Ducha Morna, 123 - Agua Fria - São Paulo/SP - 5678-134', 'Rafael Luren', 'luren@lurenzetu.com', 11900221000),
          ('Coffee Utensilios Ltda', 'Café no Bule', 64981111000101, 'Av Cheiro Bom, 789 - Coador - Belo Horizonte/MG - 3497-100', 'Barão do Conde', 'conde@cafenobule.com', 3191201000),
          ('Camisetas Boas Ltda.', null, 46791344000101, 'Rua do Bras, 587 - Bairro Tecido - São Paulo/SP - 5487-100', 'Zé do Algodão', 'ze@camisetasboas.com', 11912341234);
-- select * from fornecedor;

-- tabela Vendedor
insert into vendedor (RazaoSocial, NomeFantasia, CNPJ, Endereco, NomeResponsavel, Email, Telefone)
	values('VendeTudo Comercial S.A.', 'VendeTudo', 24531698000101, 'Av Faz de Conta, 1201 - São Paulo/SP - 3214-123', 'Paulinho Gogó', 'gogo@vendetudo.com', 11912346789),
          ('Negocio da China Ltda.', null, 64841164000101, 'Rua Dona Esperança, 1711 - São Paulo/SP - 0641-789', 'Luiz Silva', 'silva@negociodachina.com', 11946328888),
          ('Fazemos Negocios Ltda.', null, 33467899000101, 'Alameda Ze da Feira, 111 - São Paulo/SP - 3487-746', 'Eduardo Chique', 'chique@negocios.com', 11956417891),
          ('Qualidade Premium S.A.', 'Premium', 1354321000101, 'Rua 5 estrelas, 55 - São Paulo/SP - 2148-181', 'Silva Telles', 'telles@premium.com', 11918349780),
          ('Top dos Tops Ltda.', 'TopTop', 3412008000101, 'Av Lugar Top, 10 - São Paulo/SP - 1010-010', 'Santos Silvio', 'santos@toptop.com', 11982546000);
-- select * from vendedor;

-- relação produtos por vendedor
insert into produtoVendedor (idProdutoVendedor, idProduto, Quantidade)
	values(1, 1, 60),
          (2, 2, 15),
          (3, 3, 42),
          (4, 4, 28),
          (5, 5, 167);
-- select * from produtoVendedor;

-- relação Produtos por Pedido
insert into produtoPedido (idProdutoProduto, idPedidoPedido, Quantidade, StatusProdutoPedido)
	values(1, 1, 3, 'Disponível'),
		  (2, 2, 1, 'Disponível'),
          (3, 3, 2, 'Disponível'),
          (4, 4, 1, 'Disponível'),
          (5, 5, 10, 'Disponível');
-- select * from produtoPedido;

-- relação Produto em Estoque
insert into produtoEstoque (idPEproduto, idPEestoque, Localidade)
	values(1, 1, 'SP'),
		  (2, 2, 'PR'),
          (3, 3, 'MG'),
          (4, 4, 'PB'),
          (5, 5, 'SP');
-- select * from produtoEstoque;

-- relação Produto Fornecedor
insert into produtoFornecedor(idPFfornecedor, idPFproduto, Quantidade)
	values(1, 1, 140),
		  (2, 2, 62),
          (3, 3, 81),
          (4, 4, 35),
          (5, 5, 101);
-- select * from produtoFornecedor;

-- relação Pagamento Cartão de Credito
insert into pagamentoCartao (idPagamentoCartao, idPagamentoCartaoPedido, idCartaoCredito, QuantidadeParcelas)
	values(1, 1, 1, 2),
		  (2, 2, 2, 6),
          (3, 3, 3, 3),
          (4, 4, 4, 1),
          (5, 5, 5, 4);
-- select * from pagamentoCartao;


-- QUERIES
-- quantidade de clientes que possui
select count(*) from cliente;

-- reupera informações dos pedidos e clientes
select * from pessoaFisica pf, pedido p where pf.idCliente = idPedidoCliente;
select * from pessoaJuridica pj, pedido p where pj.idCliente = idPedidoCliente;
select concat(PrimeiroNome, ' ', Sobrenome) as Cliente, idPedido as Pedido, StatusPedido as Status from pessoaFisica pf, pedido p where pf.idCliente = idPedidoCliente;


select count(*) from pessoaFisica pf, pedido p 
		where pf.idCliente = idPedidoCliente;

select * from pessoaFisica left outer join pedido on idCliente = idPedidoCliente;

-- Recupera quantos pedidos foram realizados por cliente
select pf.idCliente, PrimeiroNome, count(*) as Qtd_Pedidos from pessoaFisica pf 
		inner join pedido p on pf.idCliente = p.idPedidoCliente
        group by pf.idCliente;

-- Recupera pedido com produtos associados
select * from pessoaFisica pf 
		inner join pedido p on pf.idCliente = p.idPedidoCliente
		inner join produtoPedido pp on pp.idProdutoProduto = p.idPedido
        group by pf.idCliente;
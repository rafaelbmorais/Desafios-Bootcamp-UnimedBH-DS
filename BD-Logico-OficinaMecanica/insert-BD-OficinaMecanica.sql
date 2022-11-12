-- inserção de dados BD OfinicaMecanica

use oficinaMecanica;

-- tabela cliente
insert into cliente (cpf, primeiroNome, segundoNome, sobrenome, endereco, telefone, email)
			  values(13598434510, 'Rafael', 'B', 'Morais', 'Rua A, 15 - São Paulo/SP - 7293-010', 11901011234, 'rafael@rafael.com'),
				    (65646876146, 'Carol', 'A', 'Oliveira', 'Av. BCD, 30 - São Paulo/SP - 2343-748', 11697655678, 'carol@carol.com'),
					(24542256133, 'Jose', null, 'Silva', 'Rua XPTO, 1 - São Paulo/SP - 8288-132', 11645664123, 'jose@silva.com'),
					(56544665465, 'Renato', null, 'Marques', 'Rua XYZ, 21 - São Paulo/SP - 9891-331', 11986779879, 'renato@renato.com'),
					(45856761658, 'Sebastiana', 'D', 'Rolim', 'Rua ST, 45 - São Paulo/SP - 2654-444', 11413546566, 'ana@ana.com');
          
-- tabela veiculo
insert into veiculo (idCliente, placa, marca, modelo, cor, ano, km)
			 values(1, 'RFL1234', 'Ford', 'Ka', 'Prata', 2017, 71520),
				   (2, 'ABC4545', 'GM', 'Onix', 'Branco', 2015, 50101),
                   (3, 'DJK5476', 'Fiat', 'Argo', 'Preto', 2020, 21964),
                   (4, 'ODK6545', 'Toyota', 'Corolla', 'Azul Metalico', 2021, 10010),
                   (5, 'OEK0135', 'Honda', 'Fit', 'Preto', 2014, 90000),
                   (2, 'FPW1239', 'Honda', 'HRV', 'Vinho Metalico', 2020, 20259),
                   (5, 'SKL1546', 'Fiat', 'Mobi', 'Vermelho', 2019, 46612);
                   
-- tabela ordem de servico - statusOS('Orçamento', 'Aprovada', 'Em andamento', 'Cancelada', 'Fechada')
insert into ordemServico (idVeiculo, idCliente, statusOS, dataEntrada, dataSaida, valorPecas, valorServico, valorTotal)
				   values(1, 1, 'Fechada', '2022-10-30', '2022-11-01', 100.01, 120.49, 220.50),
						 (2, 2, 'Aprovada', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (3, 3, 'Orçamento', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (4, 4, 'Em andamento', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (5, 5, 'Aprovada', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (6, 2, 'Orçamento', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (7, 5, 'Em andamento', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (1, 1, 'Aprovada', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50),
                         (2, 2, 'Aprovada', '2022-11-11', '2022-11-14', 100.01, 120.49, 220.50);
						
-- tabela mecanico 
insert into mecanico (matricula, nome, especialidade)
			   values('A1234', 'Jose Alexandre', 'Injeção Eletrônica e motor'),
					 ('B1467', 'Maria Conceição', 'Auto-Elétrica e motor'),
                     ('C1454', 'Jean Carlos', 'Alinhamento e motor'),
                     ('D1431', 'Silvia Silva', 'Ar-condicionado e Arrefecimento');

-- tabela serviço
insert into servico (codigoServico, nomeServico, valor)
			  values('12345', 'Troca de óleo e filtro de óleo', 120.49),
				    ('34656', 'Alinhamento e balanceamento', 120.49),
                    ('34123', 'Troca do fluído de arrefecimento', 120.49),
                    ('14685', 'Troca do fluído de freio', 120.49),
                    ('54321', 'Troca de lampadas', 120.49),
                    ('43215', 'Limpeza e regulagem do ar condicionado', 120.49),
                    ('46823', 'Troca de embreagem', 120.49),
                    ('87900', 'Troca de pastilhas de freio', 120.49),
                    ('16752', 'Troca das velas de ignição', 120.49);
                    
-- tabela insumo
insert into insumo (codigoInsumo, nomeInsumo, fabricante, valor)
			 values('12345', 'Óleo para motor 5w20', 'Castrol', 100.01),
				   ('42315', 'Filtro de óleo', 'Mann Filter', 100.01),
                   ('45678', 'Fluido Arrefecimento', 'Varga', 100.01),
                   ('98765', 'Kit Velas de ignição', 'NGK', 100.01),
                   ('67946', 'Pastilhas de freio', 'Bosch', 100.01),
                   ('23309', 'Lampada para Farol', 'Philips', 100.01),
                   ('20800', 'Lampada para lanterna', 'Osram', 100.01),
                   ('48980', 'kit embreagem', 'Bosch', 100.01),
                   ('97997', 'Fluído para freios', 'Varga', 100.01);
                   
-- tabela reposição insumo
insert into rInsumo (idInsumo, idOS, Quantidade)
			  values(1, 1, 2),
					(4, 2, 1),
                    (9, 3, 1),
                    (6, 4, 1),
                    (8, 5, 1),
                    (3, 6, 1),
                    (1, 7, 1),
                    (7, 8, 1),
                    (8, 9, 1);
                    
-- tabela realiza serviço 
insert into rServico (idOS, idServico, idMecanico, TipoServico)
			   values(1, 1, 2, 'Trocar óleo do motor'),
					 (2, 9, 1, 'Trocar velas de ignição'),
                     (3, 4, 2, 'Trocar fluído de freio'),
                     (4, 3, 4, 'Trocar fluído de arrefecimento'),
                     (5, 5, 1, 'Trocar lampadas do farol'),
                     (6, 8, 3, 'Trocar pastilhas de freio'),
                     (7, 7, 2, 'Trocar embreagem'),
                     (8, 1, 1, 'Trocar óleo do motor'),
                     (9, 9, 3, 'Trocar velas de ignição');
                    

                   
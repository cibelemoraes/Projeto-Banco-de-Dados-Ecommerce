-- recuperando dados apartir de consultas SQL

select * from product;
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
							(1,null, 'compra via aplicativo', null, 1),
                            (2, null, 'compra via aplicativo', 50 , 0),
                            (3, 'Confirmado', null, null,1),
                            (4,null,'compra via web site',150, 0);
                            
-- idPOproduct, idPOorder, poQunatity, poStatus
select* from orders;
insert into productOrder (idPOproduct, idPOoder, poQuantity, poStatus) values
						 (1,1,2,null),
                         (2,5,1,null),
                         (3,5,1,null);
                         
-- storageLocation, quantity

insert into productStorage (storageLocation, quantity)values
                             ('Rio de Janeiro', 1000),
                             ('Rio de janeiro', 500),
                             ('São Paulo',10),
                             ('São Paulo',100),
                             ('São Paulo',10),
                             ('Brasilia',60);
							
-- idLproduct, idLstorage, location

insert into storageLocation (idLproduct, idLstorage, location) values
                             (1,2,'RJ'),
                             (2,6,'GO');
                             
-- IdSupplier, SocialName, CNPJ, contact

insert into supplier (SocialName, CNPJ, cfontact) values
                        ('Almeida e filhos', 32535356456456,'443543543'),
                        ('Eletrônicos Silva',' 48483954389578', '454543544'),
                        ('Marcenaria Vilma', 3235675676757567, '464364645');
                        
select * from supplier;
 
-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (dPsSupplier, idPsProduct, quantity) values
                              (1,1,500),
                              (1,3,400),
                              (2,4,644),
                              (3,5,6),
                              (2,6,10);
                              
-- idSeller, SocialName, AbstName, CNPJ, CPF, location , contact
insert into seller(SocialName, AbstName, CNPJ, CPF, location , contact) values
                    ('Tech eletronics', null, 14213243454456, null, 'Rio de Janeiro', 654454545),
                    ('Botique Durgas', null, null,1231432432,'Rio de Janeiro', 3432534545),
                    ('Kids World', null, 5465457676575, null, 'São Paulo', 1234324324);
                    
select* from seller;

-- idPseller, idPproduct, prodQuantity

insert into productSeller (idPseller, idPproduct, prodQuantity) values
                           (1,6,89),
                           (2,7,10);
 select * from productSeller;                                

-- recuperando o número de clientes que eu tenho
select count(*) from clients;


select * from clients c, orders o where c.idCliente = idOrderClient;

-- consultando os status dos pedidos

select Fname, Lname, idOrder, orderStatus from clients c, orders o where c.idClient = idOderCliente;
select concat (Fname, ' ',Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOderCliente;


insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
				    (2, defult, 'compra via aplicativo', null,1);
                    
-- consultando clientes com o group by				
select * from clients c, orders o 
             where c.idcliente = idorderCliente
             group by  idOrder;
             
-- utilizando o left outer join 

select * from clients left outer join orders ON c.idClient = idOrderClient;
      
 select * from orders;     
 -- recuparação de pedido com produto associado
      select * from clients c 
               inner join orders o  On c.idClient = o.idOrderClient
			   inner join productOrder p on p.idOrder = o.idOrder
			   group by idClient;

      
-- recuparar quantos pedidos foram realizados pelos clientes
select c.idClient, Fname, count(*) as Number_of_Orders  from clients c 
       inner join orders o  On c.idClient = o.idOrderClient
	     group by idClient;






                             
                             
                             
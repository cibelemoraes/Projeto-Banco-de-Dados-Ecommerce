-- crição do banco de dados para o cenário de E-commerce

create database ecommerce;
use ecommerce;

-- criar tabela client

create table cliente(
        idClient int auto_increment primary Key,
        Fname varchar(10),
        Minit char(3),
        Lanem varchar(20),
        CPF char (11) not null,
        constraint unique_cpf_cliente unique (CPF)

);
desc cliente;  --criando tabela cliente

-- criar tabela produto

create table product(
	    idProduct int auto_increment primary Key,
        Pnome varchar(10) not null,
        classification_kids bool default false,
        category enum('Eletronico', 'Vestimenta' , 'Brinquedos', 'Alimentos' ,'Móveis'),
        avaliação float default 0,
        size varchar(10),
		constraint unique_cpf_cliente unique (CPF)
);

create table payments(
       idcliente int,
       idpayment int,
       typePayment enum ('Boleto', 'Cartão','Dois cartões'),
       limitAvaliable float,
       primary key (IdCliente, id_payment)
);

-- criar tabela pedidos

create table orders(
	    idOrder int auto_increment primary Key,
        idOrderClient int,
        orderStatus enum('Cancelado' , 'Confirmado', 'Em processamento') default 'Em processamento',
        orderDescription varchar(255),
        sendValue float default 10,
        paymentCash boolean default false,
        constraint fk_orders_client  foreign Key (idOrderCliente) references clients(idCliente)
        
);

desc orders; -- criando tabela orders

-- criar tabela estoque

create table productStorage(
		idProdStorage int auto_increment primary Key,
        storageLocation varchar (255),
        quantity int default 0

);

-- criar tabela fornecedor

create table supplier(
        idSupplier int auto_increment primary Key,
        SocialName varchar(255) not null,
        CNPJ char(15) not null,
        contact char(11) not null,
        constraint unique_supplier unique (CNPJ)
);
-- criar tabela vendedor 

create table seller(
       idSeller int auto_increment primary Key,
       SocialName varchar(255) not null,
       AbsName varchar(255),
       CNPJ char(15),
       CPF char(9),
       contact char (11) not null,
       constraint unique_CNPJ_seller unique(CNPJ),
       constraint unique_CPF_seller unique(CPF)

);

create table productSeller(
	   idPseller int,
       idProduct int,
       Quantify int default 1,
       primary key (idPseller, idProduct),
       constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
       constraint fk_product_seller foreign Key (idProduc) references product(idProduct)
);

create table productOrder(
	   idPOproduct int,
       idPOorder int,
       poQuantify int default 1,
       poStatus enum('Disponivel', 'Sem estoque') default 'Disponivel',
       primary key(idPOproduct, idPOorder),
       constraint fk_product_seller foreign key (idPOproduct) references sproduct(idProduct),
       constraint fk_product_product foreign Key (idPOorder) references orders(idOrder)
);

create table storageLocation(
        idLproduct int,
        idlStorage int,
        location varchar(255) not null,
        primary key (idLproduct, idlStorage),
        constraint fk_storage_location_product foreign key (idLproduct) references sproduct(idProduct),
        constraint fk_storage_location_storage foreign Key (idlStorage) references productStorage(idProdStorage)
);

create table productSupplier(
        idPsSupplier int,
        idPsProduct int, 
        quantify int not null,
        primary Key(idPsSupplier, idPsProduct),
        constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
        constraint fk_product_supplier_product foreign Key (idPsProduct) references product(idProduct)
);

desc productSupplier;

show tables;

use information_schema;
show tables;
desc referencial_constraints;
select * from referencial_constraints where constraint_schema = 'ecommerce'





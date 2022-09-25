create database ecommerce;
use ecommerce;

-- criar tabela cliente

create table clients(
	idClient int auto_increment primary key ,
    Fname varchar(10),
    Minit varchar(3),
    Lname varchar(20),
    Address varchar(255),
    Bdate date,
	constraint unique_cpf_client unique (CPF)
);

create table PessoaFisica(
	idPfisica int auto_increment ,
    idPfisicaClient int,
    CPF char(11),
    primary key (idPfisica, idPfisicaClient),
    constraint fk_idFisica_client foreign key (idPfisicaClient) references clients(idClient)
);

create table PessoaJuridica(
	idPjuridica int auto_increment ,
    idPjuridicaClient int,
    CPF char(11),
    primary key (idPfisica, idPjuridicaClient),
    constraint fk_idFisica_client foreign key (idPjuridicaClient) references clients(idClient)
);


alter table clients auto_increment=1;

-- criar tabela produto
-- size = dimensão

create table product(
	idProduct int auto_increment primary key,
    Pname varchar(50),
    category enum('Eletrônicos', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    description_product varchar(40),
    value_product float,
    classification_kids bool default false,
	avaliation float default 0,
    size varchar(10)
);

alter table product auto_increment=1;

-- criar tabelado pagamento

create table payments(
	idPayment int auto_increment primary key,
    typePayment enum('Boleto', 'Pix', 'Cartão de Débito', 'Cartão de Crédito'),
    paymentStatus enum ('Cancelado', 'Aguardando', 'Em processamento', 'Confirmado')
    
);
alter table payments auto_increment=1;

-- criar tabela pedido

create table orders (
	idOrder int auto_increment primary key,
    idOrderClient int,
    idOrderPayment int,
    orderStatus enum('Cancelado', 'Concluído', 'Em processamento')  default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient),
    constraint fk_orders_Payment foreign key (idOrderPayment) references payments(idPayment)
		on update cascade
);
alter table orders auto_increment=1;




-- criar tabela estoque
-- drop table productStorage;
create table productStorage (
	idProdStorage int auto_increment primary key,
    storageLocation varchar(45) not null,
    quantity int not null
);
alter table productStorage auto_increment=1;


-- criar tabela fornecedor
create table suppleir (
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ)
);
alter table suppleir auto_increment=1;



-- criar tabela vendedor
create table seller (
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(15),
    CPF char(11),
    AbstName varchar(255),
    location varchar(255),
    contact char(11) not null,
    phisicalPerson bool default false,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);
alter table seller auto_increment=1;

-- criar tabela produto vendedor
create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPseller, idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product__seller_product foreign key (idPproduct) references product(idProduct)
);

-- criar tabela produto pedido
create table productOrder(
	idPOorder int,
    idPOproduct int,
    orderQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOorder, idPOproduct),
    constraint fk_product_order foreign key (idPOorder) references orders(idOrder),
    constraint fk_product__order_product foreign key (idPOproduct) references product(idProduct)
);


-- criar tabela produto fornecedor
create table productSuppleir(
	idPsSuppleir int,
    idPSproduct int,
    suppleirQuantity int not null,
    primary key (idPsSuppleir, idPSproduct),
    constraint fk_product_suppleir foreign key (idPsSuppleir) references suppleir(idSupplier),
    constraint fk_product_suppleir_product foreign key (idPSproduct) references product(idProduct)
);

-- criar tabela produto estoque
-- drop table storageLocation;
create table storageLocation(
	idLstorage int,
    idSproduct int,
    storageQuantity int ,
    location varchar(255) not null,
    primary key (idLstorage, idSproduct),
    constraint fk_storage_location foreign key (idLstorage) references productStorage(idProdStorage),
    constraint fk_storage_location_product foreign key (idSproduct) references product(idProduct)
);

-- funções e cláusula de agregamento

select * from clients;
select count(*) from clients;

select count(*) from clients, orders
	where idClient = idOrderClient and Fname = 'Maria'
    order by idClient;
    
    -- JOIN
select concat(Fname, ' ', Lname) as Cliente, idProduct, Pname 
from clients inner join orders on idOrderClient = idClient
inner join productOrder on idPOproduct = idProduct
where Pname = 'Fone%'
group by idProduct, Pname;

-- Having

select idProduct, Pname, count(*)
 from product
 where category = 'Eletrônicos'
 having count(*)>=2;




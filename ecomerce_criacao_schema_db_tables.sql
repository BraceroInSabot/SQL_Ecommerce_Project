-- CREATE SCHEMA `ecommerce`;
-- DROP SCHEMA `ecommerce`;
-- USE `ecommerce`;
-- CREATE DATABASE ecommerce;
USE ecommerce;


CREATE TABLE client(
	id_client INT AUTO_INCREMENT,
    f_name VARCHAR(30),
    m_name_init CHAR(1),
    l_name VARCHAR(30),
    cpf char(11) NOT NULL,
    address varchar(30),
    
    PRIMARY KEY (id_client),
    CONSTRAINT unique_cpf_client UNIQUE (cpf)
);


DESC client;
SELECT * FROM client;


CREATE TABLE product (
	id_product INT AUTO_INCREMENT,
    p_name VARCHAR(40) NOT NULL,
    promotion BOOL DEFAULT FALSE,
    category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,
    rating FLOAT,
    size VARCHAR(10),
    
    PRIMARY KEY (id_product),
    /*
    Verifica se a avaliação está entre 0 e 5
    */
    CONSTRAINT chk_min_rating CHECK (rating>=0),
    CONSTRAINT chk_max_rating CHECK (rating<=5)
);

-- DROP TABLE product;

DESC product;
/*
INSERT INTO product (p_name, promotion, category, rating) 
VALUES ('Samsung Galaxy S8', false, 'Eletrônico', 4.0);

INSERT INTO product (p_name, promotion, category, rating) 
VALUES ('Iphone 12', false, 'Eletrônico', 0);

DELETE FROM product WHERE id_product=1;
*/
SELECT * FROM product;


CREATE TABLE payment (
	id_client INT,
    id_payment INT,
    payment_type ENUM('Boleto', 'Debito', 'Credito', 'Parcelado'),
    realized_in DATETIME,
    
    PRIMARY KEY (id_client, id_payment)
);

DESC payment;


CREATE TABLE product_order (
	id_order INT AUTO_INCREMENT,
    id_order_client INT,
    order_status ENUM('Cancelado', 'Em processo', 'Efetuado') DEFAULT 'Em processo',
    shipment FLOAT DEFAULT 10.92,
    value_order FLOAT NOT NULL,
    payment_cash BOOL DEFAULT FALSE,
	
    PRIMARY KEY (id_order),
    CONSTRAINT fk_order_client FOREIGN KEY (id_order_client) REFERENCES client(id_client)
		ON UPDATE CASCADE
);

DESC product_order;


CREATE TABLE product_storage (
	id_prod_storage INT AUTO_INCREMENT,
    storage_location VARCHAR(255),
    quantity INT DEFAULT 0,
    
    PRIMARY KEY (id_prod_storage)
);

DESC product_storage;


CREATE TABLE supplier (
	id_supplier INT AUTO_INCREMENT,
    social_name VARCHAR(255) NOT NULL,
    cnpj CHAR(15) NOT NULL,
    contact CHAR(11) NOT NULL,
    
    PRIMARY KEY (id_supplier),
    CONSTRAINT unique_supplier UNIQUE (cnpj)
);

DESC supplier;


CREATE TABLE seller (
	id_seller INT AUTO_INCREMENT,
    social_name VARCHAR(255) NOT NULL,
    abst_name VARCHAR(255),
    cnpj CHAR(15),
    cpf CHAR(9),
    location VARCHAR(255),
    contact CHAR(11) NOT NULL,
    
    PRIMARY KEY (id_seller),
    CONSTRAINT unique_cnpj_seller UNIQUE (cnpj),
    CONSTRAINT unique_cpf_seller UNIQUE (cpf)
);

DESC seller;


CREATE TABLE product_seller (
	id_prod_seller INT,
    id_product INT,
    prod_quantity INT DEFAULT 0,
    
    PRIMARY KEY (id_prod_seller, id_product),
    CONSTRAINT fk_product_seller FOREIGN KEY (id_prod_seller) REFERENCES seller(id_seller),
    CONSTRAINT fk_product_product FOREIGN KEY (id_product) REFERENCES product(id_product)
);

DESC product_seller;


CREATE TABLE product_order_status (
	id_ProdOrder_product INT,
    id_ProdOrder_order INT,
    po_quantity INT DEFAULT 1,
    po_status ENUM('Disponivel', 'Sem estoque') DEFAULT 'Disponivel',
    
    PRIMARY KEY (id_ProdOrder_product, id_ProdOrder_order),
    CONSTRAINT fk_ProdOrder_seller FOREIGN KEY (id_ProdOrder_product) REFERENCES product(id_product),
    CONSTRAINT fk_ProdOrder_product FOREIGN KEY (id_ProdOrder_order) REFERENCES product_order(id_order)
);

DESC product_order_status;


CREATE TABLE storage_location (
	id_location_product INT,
    id_location_storage INT,
	location VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (id_location_product, id_location_storage),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (id_location_product) REFERENCES product(id_product),
    CONSTRAINT fk_storage_location_storage FOREIGN KEY (id_location_storage) REFERENCES product_storage(id_prod_storage)
);

DESC storage_location;


CREATE TABLE product_supplier (
	id_ps_supllier INT,
    id_ps_product INT,
    quantity INT NOT NULL,
    
    PRIMARY KEY (id_ps_supllier, id_ps_product),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (id_ps_supllier) REFERENCES supplier(id_supplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (id_ps_product) REFERENCES product(id_product)
);

DESC product_supplier;

SHOW TABLES;
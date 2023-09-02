USE ecommerce;

SHOW TABLES;

-- CLIENT
DESC client;

INSERT INTO client (f_name, m_name_init, l_name, cpf, address) VALUES 
	('Jorge', 'S', 'Pauliano', '15482365179', 'Rua x do adsiaojo'),
    ('Mariana', 'G', 'Silveira', '45218796358', 'Rua y do adsiaojo'),
    ('Igor', 'H', 'Moreira', '85723659456', 'Rua z do adsiaojo'),
    ('Roberta', 'A', 'Solla', '11124526783', 'Rua a do adsiaojo'),
    ('Mateus', 'M', 'Gonzaga', '25485235791', 'Rua b do adsiaojo')
;

SELECT * FROM client;


-- PRODUCT
DESC product;

INSERT INTO product (p_name, promotion, category, rating, size) VALUES 
	('Samsung J9', true, 'Eletrônico', 4.6, '7"'),
    ('Moletom Preto', false, 'Vestimenta', 4.2, 'M'),
    ('Jogo da Vida', false, 'Brinquedos', 2.7, '30cmx30cm'),
    ('Ração p/ cachorro Generico', true, 'Alimentos', 1.6, '2kg'),
    ('Sofa Verde de Três Lugares', true, 'Móveis', 3.5, '3mx1.5mx2m')
;

SELECT * FROM product;


-- SELLER
DESC seller;

INSERT INTO seller (social_name, abst_name, cnpj, cpf, location, contact) VALUES 
	('Empresa ABC', 'ABC Ltda.', '12345678901234', '123456789', 'Rua A, Cidade X', '98765432101'),
	('Empresa XYZ', 'XYZ Comércio', '98765432109876', '987654321', 'Avenida B, Cidade Y', '12345678901'),
    ('Empresa 123', '123 Ltda.', '56789012345678', '567890123', 'Rua C, Cidade Z', '45678901234')
;

SELECT * FROM seller;


-- PRODUCT STORAGE
DESC product_storage;

INSERT INTO product_storage (storage_location, quantity) VALUES 
	('Baía 07, porto tal', 20),
    ('Armazem do balbalabl', 17),
    ('Armazem do dasdas', 3),
    ('Armazem do zxczxca', 5),
    ('Baía 02, porto jkygkghj', 13)
;

SELECT * FROM product_storage;

-- SUPPLIER
DESC supplier;

INSERT INTO supplier (social_name, cnpj, contact) VALUES 
	('Fornecedor A', '12345678901234', '98765432101'),
	('Fornecedor B', '98765432109876', '12345678901'),
	('Fornecedor C', '56789012345678', '45678901234'),
	('Fornecedor D', '34567890123456', '23456789012'),
	('Fornecedor E', '76543210987654', '34567890123'),
	('Fornecedor F', '54321098765432', '56789012345')
 ;

SELECT * FROM supplier;


-- PRODUCT SUPPLIER
DESC product_supplier;

SELECT * FROM product;
SELECT * FROM supplier;
INSERT INTO product_supplier (id_ps_supllier, id_ps_product, quantity) VALUES 
	(1, 4, 4),
    (2, 5, 6),
    (5, 1, 10),
    (5, 3, 2),
    (4, 2, 3)
;

SELECT * FROM product_supplier;


-- PRODUCT ORDER 
DESC product_order;

SELECT * FROM client;
INSERT INTO product_order (id_order_client, id_payment, order_status, shipment, value_order, payment_cash) VALUES 
	(2, 'Efetuado', 8.50, 150.00, TRUE),
	(3, 'Em processo', 12.00, 89.99, FALSE),
	(5, 'Em processo', 10.92, 200.50, TRUE),
	(2, 'Cancelado', 5.75, 45.60, FALSE)
;
-- DELETE FROM product_order WHERE id_order=1 OR id_order=2 OR id_order=3 OR id_order=4;

SELECT * FROM product_order;


--  PAYMENT
DESC payment;

SELECT * FROM client;
INSERT INTO payment (id_pay_client, id_payment, payment_type, realized_in) VALUES 
	(2, 21, 'Boleto', '2023-09-01 08:30:00'),
	(3, 34, 'Debito', '2023-08-28 14:15:00'),
	(5, 66, 'Credito', '2023-08-25 17:45:00'),
	(2, 10, 'Parcelado', '2023-08-20 11:00:00')
;

SELECT * FROM payment;


-- PRODUCT ORDER STATUS
DESC product_order_status;

SELECT * FROM product;
SELECT * FROM product_order;
INSERT INTO product_order_status (id_ProdOrder_product, id_ProdOrder_order, po_quantity, po_status) VALUES
	(2, 5, 1, 'Disponivel'),
    (3, 6, 3, 'Disponivel'),
    (5, 7, 2, 'Disponivel'),
    (2, 8, 4, 'Sem estoque')
;

SELECT * FROM product_order_status;


-- STORAGE LOCATION
DESC storage_location;

SELECT * FROM product_storage;
SELECT * FROM product;
INSERT INTO storage_location (id_location_product, id_location_storage, location) VALUES 
	(1, 5, 'SP'),
    (4, 2, 'SP'),
    (2, 1, 'RJ'),
    (5, 4, 'AM'),
    (3, 3, 'PE')
;

SELECT * FROM storage_location;


-- PRODUCT SELLER
DESC product_seller;

SELECT * FROM seller;
SELECT * FROM product;
INSERT INTO product_seller (id_prod_seller, id_product, prod_quantity) VALUES 
	(1, 3, 200),
    (3, 2, 207),
    (3, 1, 156),
    (2, 5, 100),
    (1, 4, 53)
;

SELECT * FROM product_seller;
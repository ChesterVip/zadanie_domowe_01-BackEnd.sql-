
SELECT products.name AS 'Product Name:', suppliers.name AS 'Supplier Name:'FROM products, suppliers WHERE products.id_pruduct = suppliers.id_product;
SELECT products.name AS 'Product Name:', suppliers.name AS 'Supplier Name:' FROM products JOIN suppliers ON products.id_pruduct = suppliers.id_product;



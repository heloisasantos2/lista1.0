SELECT 
    Orders.order_id,
    Orders.order_data,
    Customers.first_nome AS customer_first_nome,
    Customers.last_nome AS customer_last_nome,
    Customers.email
FROM 
    Orders
JOIN 
    Customers ON Orders.customer_id = Customers.customer_id;

SELECT 
    Products.product_nome,
    Order_Items.quantidade
FROM 
    Order_Items
JOIN 
    Orders ON Order_Items.order_id = Orders.order_id
JOIN 
    Products ON Order_Items.produto_id = Produtos.produto_id
WHERE 
    Orders.customer_id = 1;


SELECT 
    Customers.first_nome AS customer_first_nome,
    Customers.last_nome AS customer_last_nome,
    SUM(Produtos.price * Order_Items.quantidade) AS total_spent
FROM 
    Customers
JOIN 
    Orders ON Customers.customer_id = Orders.customer_id
JOIN 
    Order_Items ON Orders.order_id = Order_Items.order_id
JOIN 
    Produtos ON Order_Items.produto_id = Produtos.produto_id
GROUP BY 
    Customers.customer_id, Customers.first_nome, Customers.last_nome;


SELECT 
    Customers.first_nome AS customer_first_nome,
    Customers.last_nome AS customer_last_nome
FROM 
    Customers
LEFT JOIN 
    Orders ON Customers.customer_id = Orders.customer_id
WHERE 
    Orders.order_id IS NULL;
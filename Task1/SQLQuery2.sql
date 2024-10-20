CREATE TABLE Orders (
order_id INT Primary key, 
items NVARCHAR NOT NULL,
shipping_adderss NVARCHAR(30)  NOT NULL,
);


INSERT INTO Orders(order_id,items,shipping_adderss)
Values(1000,'phone,keyboard' , 'Irbid');


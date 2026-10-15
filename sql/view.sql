use warehouse_management;
CREATE VIEW orders_overview AS
SELECT customers.id               AS customer_number,
       customers.firstname        AS first_name,
       customers.lastname         AS last_name,
       orders.id                  AS order_number,
       articles.name              AS article_name,
       order_items.numberOfItems  AS quantity,
       order_items.price_per_item AS price_per_item,
       order_items.numberOfItems * order_items.price_per_item
                                  AS position_price

FROM customers
         LEFT JOIN orders ON customers.id = orders.customers_id
         LEFT JOIN order_items ON orders.id = order_items.orders_id
         LEFT JOIN articles on order_items.articles_id = articles.id;
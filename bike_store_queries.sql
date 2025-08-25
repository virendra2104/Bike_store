use bike_store;
# Basic Queries
# 1. list all customers----------
select * from customers;
# 2.find all stores in a specific city
select * from stores where city="baldwin";
# 3.Get all product with price above 1000
select* from products where list_price>1000;
# 4. show all active staff member
select * from staffs where active=1;
# 5. count total number of orders
select count(*)as total_orders from orders;
# Intermediate queries
# 6.Get customer names and their 
select c.first_name,c.last_name,o.order_id,o.order_date from customers c 
join orders o on c.customer_id=o.customer_id;
# 7.List products with their brand and category
select p.product_name,b.brand_name,c.category_name from categories c join products p 
on c.category_id=p.category_id join brands b on p.brand_id=b.brand_id;
# 8.Find total stock of each product across all stores
select product_id,sum(quantity) as total_quantity from stocks group by product_id;
# 9 show orders that were completed
select * from orders where order_status=4;
# 10. get staff details  along with their store name
select s.first_name,s.last_name,st.store_name from staffs s join stores st on s.store_id=st.store_id;

#----Advanced Queries
# 11.Find top 5 most expensive products
select * from products order by list_price desc limit 5;
# 12. Calculate total revenue from each order
select order_id,sum((list_price*quantity)-discount) as total_revenue from order_items
group by order_id;
# 13.Get monthly order count
select month(order_date)as month ,count(*) as order_count from orders group by month(order_date);
# 14 Find Customers who havenot placed any orders
SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);
# 15. Get average discount product
SELECT product_id, AVG(discount) AS avg_discount
FROM order_items
GROUP BY product_id;


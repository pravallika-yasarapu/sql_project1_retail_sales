create table retail_sales
      (transactions_id int, 
	  sale_date	date,
	  sale_time	time,
	  customer_id int,
	  gender varchar(15),
	  age int,
	  category varchar(15),
	  quantiy int,
	  price_per_unit float,
	  cogs float,
	  total_sale float
);

select * from retail_sales;
--identifying null values
select* from retail_sales
where  
     transactions_id is null
	 or
	 sale_date is null
	 or
	 sale_time is null
	 or
	 customer_id is null
	 or
	 gender is null
	 or
	 category is null
	 or
	 quantiy is null
	 or
	 price_per_unit is null
	 or
	 cogs is null
	 or
	 total_sale is null
--data cleaning	 
delete from retail_sales
where 
      transactions_id is null
	 or
	 sale_date is null
	 or
	 sale_time is null
	 or
	 customer_id is null
	 or
	 gender is null
	 or
	 category is null
	 or
	 quantiy is null
	 or
	 price_per_unit is null
	 or
	 cogs is null
	 or
	 total_sale is null

--Data exploration
---How many sales we have??
select count(*) as no_of_sales from retail_sales;

---How many unique customers we have?
select count(distinct customer_id) from retail_sales;
--How many categories we have ?
select category from retail_sales
group by category;
--Find out how much revenue each product category generates.
select*from retail_sales
select category, sum(total_sale) as total_revenue from retail_sales
group by category
order by  count(total_sale) desc;
--Find the top 10 customers who made the most purchases.
select customer_id, count(*) as purchase_count from retail_sales
group by customer_id
order by  count(*) desc
limit 10;
--Business Insights

--Find the total revenue generated.

select sum(total_sale) as total_revenue from retail_sales;
--Find which product categories generate the most profit.
select category, sum(total_sale) from retail_sales
group by category
order by sum(total_sale) desc
limit 1;

--Find the average amount customers spend per transaction.
select transactions_id, avg(total_sale) from retail_sales
group by transactions_id;

--Find daily sales trends
select sale_date, sum(total_sale) as daily_sles from retail_sales
group by sale_date
order by  sum(total_sale)

--Find how many customers are repeat buyers.
select customer_id, count(customer_id) as purchase_count from retail_sales
group by customer_id
having count(customer_id)>1
order by customer_id;

-- Find Which Day Has the Most Sales
select sale_date,sum(total_sale) as most_sales,
to_char(sale_date,'day') as day
from retail_sales
group by sale_date
order by sum(total_sale) desc
limit 1
--Find Products That Were Never Sold
SELECT category FROM retail_sales WHERE quantiy = 0;
--my findings and insights
--Write a SQL Query to find the Top 5 Days with Highest Total Sales

select sale_date,sum(total_sale) from retail_sales
group by sale_date
order by sum(total_sale) desc
limit 5;

--Write a SQL Query to find out Category-wise Average sales
select category, avg(total_sale) as avg_sale from retail_sales
group by category
select*from retail_sales
--Write SQL Query for Which gender shops more in each product category?
select category ,gender,count(*) from retail_sales
group by category,gender
order by category,count(*)
--Write SQL query to find out top 5 customers based on the sales
select customer_id,sum(total_sale) from retail_sales
group by customer_id
order by sum(total_sale) desc
limit 5;
--Write SQL Query to calculate number of customers purchased in each category
select category, count(customer_id) from retail_sales
group by category

--Write SQL Query to calculate number of transactions in each gender
select count(transactions_id),gender from retail_sales
group by gender
--Write SQL Query to calculate highest sale of the year
select extract(year from sale_date) ,sum(total_sale) from retail_sales
group by extract(year from sale_date)
order by sum(total_sale) desc
limit 1;
-- Write SQL Query to calculate In which category has the highest cogs
select category, sum(cogs) as highest_cogs from retail_sales
group by category
limit 1;
--
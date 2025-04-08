# sql_project1_retail_sales:

##project overview:
**project Tilte** : Retail Sales Analysis.
**Level** : Begginer.
**Database** : 'p1_retail_db' .
This project is designed to analyse the retail_sales by using  SQL skills at begginer level.This project invovles setting up the retail_sale database , performing data cleaning,explarotary data analysis and answering business questions through SQL queries.

##objectives
1. **Set up data base** : create database of your project
2. **Data Cleaning** : identify and remove null values,missing values in your sales data
3. **Exploratory Data Analysis** : perform basic exploratory analasis to understand the data
4. **Buisiness Insights** : perform some buisness type queries and derive insights from the data
# project structure
### 1.Database setup
**Data base creation** : create a database like 'p1_retail_db'.
**creating table** : The table is created with the name of 'retail_sales' .The table contain these columns: transactions_id,	sale_date,	sale_time,	customer_id,	gender,	age,	category,	quantiy	, price_per_unit, (cost of goods of sold)	cogs,	total_sale.


'''create table retail_sales
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
'''
###2.Data Cleaning
**cleaning** : In Data cleaning process , we need to find out missing values or null values and remove those null values from our data
##identifying null_values
'''
select* from retail_sales
where  
     transactions_id is null or sale_date is null or sale_time is null or customer_id is null or gender is null or category is null or
	 quantiy is null or  price_per_unit is null orcogs is null or total_sale is null
  '''
## removing null values
'''
delete from retail_sales
where 
     transactions_id is null or sale_date is null or sale_time is null or customer_id is null or gender is null or category is null or
	 quantiy is null or  price_per_unit is null orcogs is null or total_sale is null
  '''
  ###3.Data Analysis,EDA and Buisiness Findings
  **How many sales we have??**:
  '''select count(*) as no_of_sales from retail_sales;
  '''
  **How many unique customers we have?**:
  '''select count(distinct customer_id) from retail_sales;
  '''
  **How many categories we have?**:
  '''select category from retail_sales
     group by category;
  '''
  **Find out how much revenue each product category generates.**:
  '''select*from retail_sales
     select category, sum(total_sale) as total_revenue from retail_sales
     group by category
     order by  count(total_sale) desc;
  '''
  **Find the top 10 customers who made the most purchases.**:
  '''select customer_id, count(*) as purchase_count from retail_sales
     group by customer_id
     order by  count(*) desc
     limit 10;
 '''
 **Find the total revenue generated.**:

'''select sum(total_sale) as total_revenue from retail_sales;
'''
**Find which product categories generate the most profit.**:
'''select category, sum(total_sale) from retail_sales
   group by category
   order by sum(total_sale) desc
   limit 1;
'''
**Find the average amount customers spend per transaction.**:
'''select transactions_id, avg(total_sale) from retail_sales
   group by transactions_id;
'''
**Find daily sales trends**:
'''select sale_date, sum(total_sale) as daily_sles from retail_sales
   group by sale_date
   order by  sum(total_sale);
'''
**Find how many customers are repeat buyers.**:
'''select customer_id, count(customer_id) as purchase_count from retail_sales
  group by customer_id
  having count(customer_id)>1
  order by customer_id;
'''
**Find Which Day Has the Most Sales**:
'''select sale_date,sum(total_sale) as most_sales,
   to_char(sale_date,'day') as day
   from retail_sales
   group by sale_date
  order by sum(total_sale) desc
  limit 1;
'''
**Find Products That Were Never Sold**:
'''SELECT category FROM retail_sales WHERE quantiy = 0;
'''
**Write a SQL Query to find the Top 5 Days with Highest Total Sales**:

'''select sale_date,sum(total_sale) from retail_sales
   group by sale_date
   order by sum(total_sale) desc
  limit 5;
'''
**Write a SQL Query to find out Category-wise Average sales**:
'''select category, avg(total_sale) as avg_sale from retail_sales
   group by category
   select*from retail_sales
'''
**Write SQL Query for Which gender shops more in each product category?**:
'''select category ,gender,count(*) from retail_sales
  group by category,gender
  order by category,count(*)
'''
**Write SQL query to find out top 5 customers based on the sales**:
'''select customer_id,sum(total_sale) from retail_sales
   group by customer_id
   order by sum(total_sale) desc
   limit 5;
'''
**Write SQL Query to calculate number of customers purchased in each category**:
'''select category, count(customer_id) from retail_sales
group by category;
'''
**Write SQL Query to calculate number of transactions in each gender**:
'''select count(transactions_id),gender from retail_sales
group by gender;
'''
**Write SQL Query to calculate highest sale of the year**:
'''select extract(year from sale_date) ,sum(total_sale) from retail_sales
   group by extract(year from sale_date)
   order by sum(total_sale) desc
   limit 1;
'''
**Write SQL Query to calculate In which category has the highest cogs**:
'''select category, sum(cogs) as highest_cogs from retail_sales
   group by category
   limit 1;
'''
## Findings of the Retail Sales Analysis Project:
The analysis of this project dataset revealed several key insights into customer behavior, product performance, and overall business health. A clear sales trend was observed across different hours of the day, with peak sales occurring during late afternoon hours, suggesting optimal times for promotions and staffing. Among the various product categories, a few stood out by generating the highest revenue, while others had a higher frequency of purchases but lower overall earnings, highlighting potential areas for pricing or marketing improvements.These findings can help the business  strategy, improve targeted marketing efforts, and optimize operations for greater profitability.

## Conclusion
In conclusion, the analysis of the retail_sales dataset provided valuable insights into the business's sales performance, customer demographics, and product category trends.Overall, this project demonstrates how SQL can be effectively used to extract insights from raw transactional data, enabling improvements in business operations.

## Author pravallika-yasarapu

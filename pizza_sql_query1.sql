USE [Pizza DB];

select * from [dbo].[pizza_sales];

--KPI'S REQUIREMENT

select sum(total_price) as Total_Revenue 
from [dbo].[pizza_sales];

select sum(total_price)/count (distinct order_id) 
from [dbo].[pizza_sales] as Average_Order_Value;

select sum(quantity) 
from [dbo].[pizza_sales] as Total_Pizzas_Sold;

select	count (distinct order_id)as Total_orders 
from [dbo].[pizza_sales] 

select cast(cast(sum(quantity) as decimal(10,2))/ cast(count (distinct order_id) as decimal(10,2)) as decimal(10,2)) 
from [dbo].[pizza_sales];

--CHARTS REQUIREMENT
select * from [dbo].[pizza_sales];

select DATENAME(DW,order_date) as Order_day, count(distinct order_id) as total_orders
from [dbo].[pizza_sales]
group by DATENAME(DW,order_date);

select datename(month,order_date) as Month_Name ,count(distinct order_id) as total_orders
from [dbo].[pizza_sales]
group by datename(month,order_date);

select distinct pizza_category as pizza_category, cast((sum(total_price)) as decimal(10,2)) as total_revenue,
cast(sum(total_price)*100/(select sum(total_price) from [dbo].[pizza_sales] where month(order_date)=1)as decimal(10,2)) as PCT
from [dbo].[pizza_sales]
where month(order_date)=1
group by pizza_category;

select distinct pizza_size as pizza_size , cast(sum(total_price)as decimal(10,2)) as total_revenue ,
round(sum(total_price)*100/(select sum(total_price) from [dbo].[pizza_sales]),2)as PCT
from [dbo].[pizza_sales]
group by pizza_size
order by pizza_size;

select distinct pizza_category as pizza_category, sum(quantity) as Total_Quantity_Sold
from [dbo].[pizza_sales]
group by pizza_category
order by Total_Quantity_Sold desc;

select  top 5 pizza_name ,sum(total_price) as Total_Revenue
from [dbo].[pizza_sales]
group by pizza_name
order by Total_Revenue desc;

select  top 5 pizza_name ,sum(total_price) as Total_Revenue
from [dbo].[pizza_sales]
group by pizza_name
order by Total_Revenue asc;

select top 5 pizza_name,sum(quantity) as total_pizza_sold
from [dbo].[pizza_sales]
group by pizza_name
order by total_pizza_sold desc;

select top 5 pizza_name,sum(quantity) as total_pizza_sold
from [dbo].[pizza_sales]
group by pizza_name
order by total_pizza_sold asc;

select top 5 pizza_name,count(distinct order_id) as total_orders
from [dbo].[pizza_sales]
group by pizza_name
order by total_orders desc;


select top 5 pizza_name,count(distinct order_id) as total_orders
from [dbo].[pizza_sales]
group by pizza_name
order by total_orders asc;

  



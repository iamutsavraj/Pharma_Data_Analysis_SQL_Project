/* Pharma Data Analysis using SQL */

/* Q1. Retrieve all columns for all records in the dataset. */
select * from pharma_data_analysis;


/* Q2. How many unique countries are represented in the dataset? */
select distinct(country) from pharma_data_analysis;


/* Q3. Select the names of all the customers on the 'Retail' channel. */
select `customer name`,channel from pharma_data_analysis 
where channel="Retial";

/* Q4. Find the total quantity sold for the ' Antibiotics' product class. */
select sum(Quantity) as Total_Quantity_sold from pharma_data_analysis
where `Product Class`="Antibiotics";


/* Q5. List all the distinct months present in the dataset. */
select distinct(month) from pharma_data_analysis;

/* Q6. Calculate the total sales for each year. */
select year,sum(sales) as Total_Sales from pharma_data_analysis
group by year;


/* Q7. Find the customer with the highest sales value. */
select `customer name`,Sales from pharma_data_analysis 
order by Sales desc limit 1 ;


/* Q8. Get the names of all employees who are Sales Reps and are managed by 'James Goodwill'. */
select `Name of Sales Rep` as Employee_Names,Manager from pharma_data_analysis
where manager="James Goodwill";


/* 9. Retrieve the top 5 cities with the highest sales. */
select * from pharma_data_analysis order by sales desc limit 5;


/* Q10. Calculate the average price of products in each sub-channel. */
select `Sub-channel`,round(avg(Price),2) as Average_price from pharma_data_analysis 
group by `Sub-channel`;


/* Q11. Calculate the total sales for each product class, for each month, and order the results by
year, month, and product class. */
select Year,Month,`Product Class`,sum(Sales) as Total_sales from pharma_data_analysis group by year,month,`Product Class`,Month
order by year,month,`Product Class`;


/* Q12. Find the top 3 sales reps with the highest sales in 2018. */
select `Name of Sales Rep` as Sales_Reps, sales from pharma_data_analysis
where year=2018 order by sales desc limit 3;


/* Q13. Calculate the monthly total sales for each sub-channel, and then calculate the average
monthly sales for each sub-channel over the years. */
select Year,month,`sub-channel`,round(sum(sales),2) as total_sales,
round(avg(sales),2) as avg_sales
from pharma_data_analysis group by `sub-channel`,year,month;


/* 14. Create a summary report that includes the total sales, average price, and total quantity
sold for each product class. */
select `Product Class`,sum(sales) as Total_sales,round(avg(price),2) as Avg_Price, sum(quantity) as Total_quantity
from pharma_data_analysis group by `Product Class`; 


/* Q15. Find the top 5 customers with the highest sales for each year. */
(select year,`Customer Name`, sales as Highest_sales from pharma_data_analysis
 where year = 2017 order by sales desc limit 5)
 union
 (select year,`Customer Name`, sales as Highest_sales from pharma_data_analysis
 where year = 2018 order by sales desc limit 5);
 
 
 /* Q16. List the months with the lowest sales for each year. */
 (select year,month,sales from pharma_data_analysis where year=2017 order by Sales limit 5) 
union
(select year,month,sales from pharma_data_analysis where year=2018 order by Sales limit 5); 


/* Q17. Calculate the total sales for each sub-channel in each country, and then find the country
with the highest total sales for each sub-channel. */
select country,`sub-channel`,sum(sales) as Total_Sales from pharma_data_analysis
group by country,`sub-channel`;
/* second query */
select distinct(`sub-channel`),country,sum(sales) as Total_Sales from pharma_data_analysis
group by `sub-channel`,Country
order by sum(Sales) desc;

/*          END QUERY          */
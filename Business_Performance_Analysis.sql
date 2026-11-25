CREATE DATABASE business_performance;
use business_performance;

select * from business;
select count(*) from project;

#Business Question: What are the total revenue, total cost and total profit of the business?
select round(sum(Billable_Revenue),2)as Total_revenue,
round(sum(Total_Transaction_Cost),2) as Total_cost, 
round(sum(Transaction_Profit),2) as Total_Profit from business;

#Business Question: What is the overall profit margin of the business?

select round(sum(Transaction_Profit)/nullif(sum(Billable_Revenue),0)*100,2) as Profit_margin_percentage 
from business;

#Business Question: How does revenue and profit change month by month?

select month,round(sum(Billable_revenue)/10000000,2) as revenue_cr,
round(sum(transaction_profit)/10000000,2) as profit_cr
from business
group by month
order by  min(transaction_date);

#Business Question: Which month has the lowest profit margin?

select month,round(sum(Transaction_Profit)/nullif(sum(billable_revenue),0)*100,2)as profit_margin_percentage from business
 group by month
 order by min(transaction_date);
 
#Business Question: Which service line generates the highest revenue and profit?
select service_line, round(sum(billable_revenue)/10000000,2)as revenue_cr,
round(sum(transaction_profit)/10000000,2)as profit_cr
from business
group by service_line
order by revenue_cr desc;

#Business Question: Which service line has the lowest profit margin?
select service_line, round(sum(transaction_profit)/ nullif(sum(billable_revenue),0)*100,2) as profit_margin
from business 
group by service_line
order by profit_margin ;

#Business Question: Which client industry generates the highest revenue and profit?
select client_industry, round(sum(billable_revenue)/10000000,2)as revenue_cr,
round(sum(transaction_profit)/10000000,2)as profit_cr
from business
group by client_industry
order by revenue_cr desc;

#Business Question: What are the total Labor, Technology, and Operational Costs of the business??
SELECT
    ROUND(SUM(Labor_Cost) / 10000000, 2) AS Labor_Cost_Cr,
    ROUND(SUM(Technology_Cost) / 10000000, 2) AS Technology_Cost_Cr,
    ROUND(SUM(Operational_Cost) / 10000000, 2) AS Operational_Cost_Cr,
    ROUND(SUM(Other_Direct_Cost) / 10000000, 2) AS Other_Cost_Cr,
    ROUND(SUM(Allocated_Overhead) / 10000000, 2) AS Overhead_Cr
FROM business;

#Business Question:How many total Billable and Non-Billable Hours have employees worked? 
select sum(billable_hours) as total_billable_hours,
sum(non_billable_hours) as total_non_billable_hours,
sum(hours_worked)as total_working_hours from business;

#Business Question: Which department has the lowest average employee utilization??
select employee_department,
round(avg(resource_utilization_percentage),2) as average_utilization
 from business
 group by employee_department
 order by average_utilization;
 
# Which delivery status has the highest number of projects?
select delivery_status,count(*) as total_projects from project 
group by delivery_status
order by total_projects desc ;

#Which projects have the highest budget?
select project_id,project_name,project_budget from project
order by project_budget desc
limit 1;

#Which project type generates the highest revenue?
select project_type,round(sum(billable_revenue)/10000000, 2)as revenue_cr from business 
group by project_type
order by revenue_cr desc;


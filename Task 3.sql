# Task 3 
-- question 1 
-- Average delivery time 
select Route_ID , avg(datediff( Actual_Delivery_Date, Expected_Delivery_Date)) as Delay_day
from orders
group by Route_ID
limit 10;
-- Average traffic delay
select Route_ID, Round(avg(Traffic_Delay_Min),2) AS Avg_Traffic_delay
from routes
group by Route_ID
limit 10;
-- Distance-to-time efficiency ratio
select Route_ID , 
Distance_KM/Average_Travel_Time_Min as Distance_Time_Ratio
from routes;

-- question 2 
select Route_ID , 
Distance_KM/Average_Travel_Time_Min as top_3
from routes
order by top_3 asc 
limit 3;

-- question 3 
select Route_ID,
(sum(case when Actual_Delivery_Date > Expected_Delivery_Date then 1 else 0 end)* 1 / count(*)) * 100 as Delay
from orders
group by Route_ID 
having (sum(case when Actual_Delivery_Date > Expected_Delivery_Date then 1 else 0 end)* 1 / count(*)) > 0.20 limit 10;

-- question 4
with route_optimization AS (
select r.Route_ID ,
Distance_KM/Average_Travel_Time_Min as Distance_Time_Ratio,
(sum(case when Actual_Delivery_Date > Expected_Delivery_Date then 1 else 0 end)* 1 / count(*)) * 100 as Delay
from orders as o
join routes as r
on o.Route_ID = r.Route_ID
group by r.Route_ID, Distance_Time_Ratio
)
select * from route_optimization
where Delay > 0.20
order by Distance_Time_Ratio asc limit 10;

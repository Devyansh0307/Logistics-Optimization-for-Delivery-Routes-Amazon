# Task 7 
-- question 1 
Select Start_Location , Round(Avg(Datediff(Actual_Delivery_Date ,Expected_Delivery_Date)),2) as Avg_Delay_days , count(*) as total_orders
from orders AS o
join routes as r
on o.Route_ID = r.Route_ID
group by Start_Location
order by Avg_Delay_days DESC;

-- question 2 
select Round(Sum(case when Actual_Delivery_Date <= Expected_Delivery_Date then 1 else 0 end)* 100 / count(*),2) As On_Time_Delivery_Days
from orders;

-- question 3 
select Route_ID , round(avg(Traffic_Delay_Min),0) as Avg_Delay_Date
from routes
group by Route_ID
order by Avg_Delay_Date DESC;
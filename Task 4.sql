# Task 4
-- question 1
select Warehouse_ID, Location , avg(Processing_Time_Min) as Avg_Max_Processing
From warehouses
group by Warehouse_ID, Location
order by Avg_Max_Processing Desc
Limit 3;

-- question 2
select w.Warehouse_ID , Location , count(Order_ID) As Total_shipment,
Sum( case when Actual_Delivery_Date > Expected_Delivery_Date then 1 else 0 end) as Delay
from warehouses as w
join orders as o
on o.Warehouse_ID = w.Warehouse_ID
group by Warehouse_ID, Location
order by Delay DESC;

-- question 3
with warehouse_avg AS (
    select Warehouse_ID,
           round(avg(Processing_Time_Min),2) as avg_processing_min
    from warehouses
    group by Warehouse_ID
),
global_avg as (
    select round(avg(avg_processing_min),2) as global_avg_min
    from warehouse_avg
)
select w.Warehouse_ID, w.avg_processing_min, g.global_avg_min
from warehouse_avg as w,
global_avg as g
where w.avg_processing_min > g.global_avg_min
order by w.avg_processing_min desc;

-- question 4
select Warehouse_ID , sum(case when Actual_Delivery_Date <= Expected_Delivery_Date then 1 else 0 end)*100/ count(*) as On_Time,
rank() over (order by sum(case when Actual_Delivery_Date <= Expected_Delivery_Date then 1 else 0 end)*1 / count(*) DESC) as Time_Rank
from orders 
group by Warehouse_ID
order by Time_Rank;

# Task 2
-- question 1
select Order_ID ,
datediff (Actual_Delivery_Date, Expected_Delivery_Date) as delivery_delay_days
from Orders
limit 10;

-- question 2
select Route_ID,
avg(datediff(Actual_Delivery_Date, Expected_Delivery_Date)) as Avg_Delay_Days
from Orders
group by Route_ID
order by Avg_Delay_Days DESC
limit 10;

-- question 3
select Order_ID , Warehouse_ID,
datediff(Actual_Delivery_Date, Expected_Delivery_Date) as Avg_Delay_Days,
rank() over(partition by Warehouse_ID
            order by datediff(Actual_Delivery_Date, Expected_Delivery_Date) desc) as delay_rank
from orders;
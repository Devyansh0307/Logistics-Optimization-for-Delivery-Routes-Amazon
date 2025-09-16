# Task 1
-- question 1 
select Order_ID, count(*) AS count
from Orders
group by Order_ID
having count(*) > 1;

-- question 2 
select avg(Traffic_Delay_Min) from routes;
select * from routes
where Traffic_Delay_Min IS NULL;

-- question 3
-- for Orders table
UPDATE Orders
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d'),
    Expected_Delivery_Date = str_to_date(Expected_Delivery_Date, '%Y-%m-%d'),
    Actual_Delivery_Date = str_to_date(Actual_Delivery_Date, '%Y-%m-%d');
-- for shimpment tracking table 
UPDATE shipment_tracking
SET Checkpoint_Time = STR_TO_DATE(Checkpoint_Time, '%Y-%m-%d');

-- question 4
select Order_ID, Order_Date, Actual_Delivery_Date
from orders
where Actual_Delivery_Date < Order_Date;
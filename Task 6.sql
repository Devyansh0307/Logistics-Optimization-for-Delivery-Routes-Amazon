# Task 6 
-- question 1 
select s.Order_ID , s.Checkpoint , s.Checkpoint_Time 
from shipment_tracking as s
join ( select Order_ID , Max(Checkpoint_Time) as max_time
from shipment_tracking
group by Order_ID) as t
on s.Order_ID = t.Order_ID and s.Checkpoint_Time = t.max_time
order by s.Order_ID;

-- question 2 
select Delay_Reason , count(*) as count_of_reason 
From shipment_tracking
where Delay_Reason IS NOT null 
and Delay_Reason != 'None'
group by Delay_Reason
Order by count_of_reason  DESC; 

-- question 3 
select Order_ID , count(*) as Delay_Checkpoint
From shipment_tracking
where Delay_Reason IS NOT null 
and Delay_Reason != 'None'
group by Order_ID
having count(*) > 2
Order by Delay_Checkpoint  DESC; 

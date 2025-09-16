# Task 5
-- question 1 
select Agent_ID , Route_ID, On_Time_Percentage,
rank() over(
Partition by Route_ID order by On_Time_Percentage desc) As Ranking
From deliveryagents;

-- question 2 
select Agent_ID 
from deliveryagents
where On_Time_Percentage > 80;

-- question 3 
select
(select avg(Avg_Speed_KM_HR) 
from ( select Avg_Speed_KM_HR 
from deliveryagents
order by Avg_Speed_KM_HR desc
limit 5 ) as top_5 ) as Top_Avg_speed,

(select Avg(Avg_Speed_KM_HR) 
from ( select Avg_Speed_KM_HR from deliveryagents
order by Avg_Speed_KM_HR asc
limit 5) as Bottom_5) as Bottom_avg_speed;
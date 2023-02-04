use sqlbook;


select * from subs;



select max(stop_date) from subs;
select tenure, case when stop_date is null then datediff(max_date, start_date) else datediff(stop_date, start_date) end as tenure 
from subs, (select max(stop_date) max_date from subs) stop_subs;


select 
sum(case when tenure=100 and stop_date is not null then 1 else 0 end),
sum(case when tenure=100 then 1 else 0 end),
sum(case when tenure=100 and stop_date is not null then 1 else 0 end) / sum(case when tenure>=100 then 1 else 0 end) ,
avg(case when tenure=100 and stop_date is not null then 1 else 0 end)
from subs
where tenure >= 100;


select 
count(*)
from subs
where tenure >= 100;





select tenure, count(*) as pop,
sum(case when stop_date is not null then 1 else 0 end) as stop_t
from subs
group by tenure;

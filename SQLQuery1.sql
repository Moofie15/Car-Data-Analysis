use project_car






-----hyndai insight for top 5 model_id count and their total_price 

select  Hyndai_Model_name,Count_of_Hyndai,Hyndai_total_price from
(select concat('Hyndai',' ',' ',model_name) as Hyndai_Model_name,Hyndai_total_price,Count_of_Hyndai,
dense_rank() over(order by Count_of_hyndai desc) as ranking from
(select model_name,count(*) as Count_of_hyndai,sum(price) as Hyndai_total_price
from hyndai join models on
hyndai.model_ID = models.model_ID
group by model_name) as a) as b
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5




------BMW insight for top 5 model_id count and their total_price 

select  BMW_Model_name,Count_of_BMW,BMW_total_price from
(select concat('BMW',' ',' ',model_name) as BMW_Model_name,BMW_total_price,Count_of_BMW,
dense_rank() over(order by Count_of_BMW desc) as ranking from
(select model_name,count(*) as Count_of_BMW,sum(price) as BMW_total_price
from bmw join models on
BMW.model_ID = models.model_ID
group by model_name) as a) as b
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5



------Audi insight for top 5 model_id count and their total_price 

select  Audi_Model_name,Count_of_Audi,Audi_total_price from
(select concat('Audi',' ',' ',model_name) as Audi_Model_name,Audi_total_price,Count_of_Audi,
dense_rank() over(order by Count_of_Audi desc) as ranking from
(select model_name,count(*) as Count_of_Audi,sum(price) as Audi_total_price
from Audi join models on
Audi.model_ID = models.model_ID
group by model_name) as a) as b
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5 



-----Merc insight for top 5 model_id count and their total_price 

select  Merc_Model_name,Count_of_Merc,Merc_total_price from
(select concat('Merc',' ',' ',model_name) as Merc_Model_name,Merc_total_price,Count_of_Merc,
dense_rank() over(order by Count_of_Merc desc) as ranking from
(select model_name,count(*) as Count_of_Merc,sum(price) as Merc_total_price
from Merc join models on
Merc.model_ID = models.model_ID
group by model_name) as a) as b
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5 




----cclass insight for top 5 model_id count and their total_price 

select  cclass_Model_name,Count_of_cclass,cclass_total_price from
(select concat('cclass',' ',' ',model_name) as cclass_Model_name,cclass_total_price,Count_of_cclass,
dense_rank() over(order by Count_of_cclass desc) as ranking from
(select model_name,count(*) as Count_of_cclass,sum(price) as cclass_total_price
from cclass join models on
cclass.model_ID = models.model_ID
group by model_name) as a) as b
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5 



------BMW DATA

select Model_name,EngineSize,Fueltype,Mileage,round(mpg,2) as Mpg,Price,Transmission,tax,Year
from bmw as a
join models as b on
a.model_ID = b.model_ID
join fueltype as c on
c.fuel_ID = a.fuel_ID
join transmission as d on
d.ID = a.transmission_ID



----Audi DATA

select Model_name,EngineSize,Fueltype,Mileage,round(mpg,2) as Mpg,Price,Transmission,tax,Year
from audi as a
join models as b on
a.model_ID = b.model_ID
join fueltype as c on
c.fuel_ID = a.fuel_ID
join transmission as d on
d.ID = a.transmission_ID



-----hyndai DATA

select Model_name,EngineSize,Fueltype,Mileage,round(mpg,2) as Mpg,Price,tax,Transmission,Year
from hyndai as a
join models as b on
a.model_ID = b.model_ID
join fueltype as c on
c.fuel_ID = a.fuel_ID
join transmission as d on
d.ID = a.transmission_ID



-----Merc DATA

select Model_name,EngineSize,Fueltype,Mileage,round(mpg,2) as Mpg,Price,Transmission,tax,Year
from merc as a
join models as b on
a.model_ID = b.model_ID
join fueltype as c on
c.fuel_ID = a.fuel_ID
join transmission as d on
d.ID = a.transmission_ID




------cclass DATA

select Model_name,EngineSize,Fueltype,Mileage,Price,Transmission,Year
from cclass as a
join models as b on
a.model_ID = b.model_ID
join fueltype as c on
c.fuel_ID = a.fuel_ID
join transmission as d on
d.ID = a.transmission_ID



---BMW insight for avg_price change across year in percent negative

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from bmw
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year < 0



---BMW insight for avg_price change across year in percent positive

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from bmw
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year > 0




----hyndai insight for avg_price change across year in percent positive

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from hyndai
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year > 0



-----hyndai insight for avg_price change across year in percent negative

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from hyndai
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year < 0




----merc insight for avg_price change across year in percent positive

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from merc
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year > 0




----merc insight for avg_price change across year in percent negative

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from merc
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year < 0




---audi insight for avg_price change across year in percent negative

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from audi
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year < 0




----audi insight for avg_price change across year in percent positive

select avg_price,avg_mileage,avg_mpg,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,round(avg_mpg,2) as avg_mpg ,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,avg_mpg,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage, avg(mpg) as avg_mpg ,year
from audi
group by year) as a
group by avg_price,avg_mileage,avg_mpg,year) as b) as c
where Cumulative_diff_in_price_across_year > 0



----cclass insight for avg_price change across year in percent positive

select avg_price,avg_mileage,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage,year
from cclass
group by year) as a
group by avg_price,avg_mileage,year) as b) as c
where Cumulative_diff_in_price_across_year > 0



----cclass insight for avg_price change across year in percent negative

select avg_price,avg_mileage,year,Cumulative_diff_in_price_across_year,Percentage_change_in_AVG_price_across_year from
(select round(avg_price,2) as avg_price,avg_mileage,year,
round(Cumulative_diff_in_price_across_year,2) as Cumulative_diff_in_price_across_year
,concat(round(Cumulative_diff_in_price_across_year * 100/sum(Cumulative_diff_in_price_across_year)
over(),2),' ', '%') as Percentage_change_in_AVG_price_across_year
from
(select avg_price,avg_mileage,year,isnull(avg_price -lag(avg_price) over(order by year),0) as Cumulative_diff_in_price_across_year 
from
(select avg(price) as avg_price,avg(mileage) as avg_mileage ,year
from cclass
group by year) as a
group by avg_price,avg_mileage,year) as b) as c
where Cumulative_diff_in_price_across_year < 0




---bmw insight for top 5 model_id according to total_tax

select top 5 * from
(select concat('BMW',' ',' ',' ',' ',model_id) as Model_id,total_tax,dense_rank() over(order by total_tax desc) as ranking from
(select model_id,sum(tax) as total_tax
from bmw
group by model_id) as a) as c


---audi insight for top 5 model_id according to total_tax

select top 5 * from
(select concat('Audi',' ',' ',' ',' ',model_id) as model_id,total_tax,dense_rank() over(order by total_tax desc) as ranking from
(select model_id,sum(tax) as total_tax
from audi
group by model_id) as a) as c



---merc insight for top 5 model_id according to total_tax

select top 5 * from
(select concat('Merc',' ',' ',' ',' ',model_id) as model_id,total_tax,dense_rank() over(order by total_tax desc) as ranking from
(select model_id,sum(tax) as total_tax
from merc
group by model_id) as a) as c


---hyndai insight for top 5 model_id according to total_tax

select top 5 * from
(select concat('Hyndai',' ',' ',' ',' ',model_id) as model_id,total_tax,dense_rank() over(order by total_tax desc) as ranking from
(select model_id,sum(tax) as total_tax
from hyndai
group by model_id) as a) as c



----hyndai insight for top 5 model_id according to total_tax

select top 5* from
(select concat('Hyndai',' ',' ',model_name) as Model_name,total_tax,total_price,dense_rank() over(order by total_tax desc) as ranking from
(select model_name,sum(price) as total_price,sum(tax) as total_tax
from hyndai join models on
hyndai.model_ID = models.model_ID
group by model_name) as a) as c


-----merc insight for top 5 model_id according to total_tax

select top 5* from
(select concat('Merc',' ',' ',model_name) as Model_name,total_tax,total_price,dense_rank() over(order by total_tax desc) as ranking from
(select model_name,sum(price) as total_price,sum(tax) as total_tax
from merc join models on
merc.model_ID = models.model_ID
group by model_name) as a) as c

-----Audi insight for top 5 model_id according to total_tax

select top 5* from
(select concat('Audi',' ',' ',model_name) as Model_name,total_tax,total_price,dense_rank() over(order by total_tax desc) as ranking from
(select model_name,sum(price) as total_price,sum(tax) as total_tax
from audi join models on
Audi.model_ID = models.model_ID
group by model_name) as a) as c



------Bmw insight for top 5 model_id according to total_tax

select top 5* from
(select concat('Bmw',' ',' ',model_name) as Model_name,total_tax,total_price,dense_rank() over(order by total_tax desc) as ranking from
(select model_name,sum(price) as total_price,sum(tax) as total_tax
from bmw join models on
bmw.model_ID = models.model_ID
group by model_name) as a) as c




------Bmw insight for top 5 model_id according to total_tax
 
select Avg(tax) as BMW_AVG_TAX, round(Avg(price),2) as BMW_Avg_price
from bmw


-----Audi insight for top 5 model_id according to total_tax

select Avg(tax) as Audi_AVG_TAX, round(Avg(price),2) as Audi_Avg_price
from audi


----merc insight for top 5 model_id according to total_tax

select Avg(tax) as merc_AVG_TAX, round(Avg(price),2) as merc_Avg_price
from merc


----Hyndai insight for top 5 model_id according to total_tax

select Avg(tax) as Hyndai_AVG_TAX, round(Avg(price),2) as Hyndai_Avg_price
from Hyndai



----bmw insight for avg price and count of cars based on fuel type accross each year

select distinct(year),round(avg(price),2) as avg_price,
sum(case when fuel_ID = 5 then count_Of_Bmw  else 0 end) as 'petrol',
sum(case when fuel_id= 1 then count_Of_Bmw else 0 end) as 'diesel',
sum(case when fuel_id= 2 then count_Of_Bmw  else 0 end) as 'electric',
sum(case when fuel_id= 3 then count_Of_Bmw  else 0 end) as 'hybrid',
sum(case when fuel_id= 4 then count_Of_Bmw else 0 end) as 'others'
from
(select year,count_Of_Bmw,fuel_ID,price
from
(select fuel_id,year,count_Of_Bmw,price
from 
(select  fuel_id,year,count(*) as count_Of_Bmw,price from
(select year,fuel_ID,price
from bmw
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,count_Of_Bmw,price) as k
group by year,count_Of_Bmw,fuel_id,price) as i
group by year




----audi insight for avg price and count of cars based on fuel type accross each year

select distinct(year),round(avg(price),2) as avg_price,
sum(case when fuel_ID = 5 then count_Of_audi  else 0 end) as 'petrol',
sum(case when fuel_id= 1 then count_Of_Audi else 0 end) as 'diesel',
sum(case when fuel_id= 2 then count_Of_Audi  else 0 end) as 'electric',
sum(case when fuel_id= 3 then count_Of_Audi  else 0 end) as 'hybrid',
sum(case when fuel_id= 4 then count_Of_Audi else 0 end) as 'others'
from
(select year,count_Of_Audi,fuel_ID,price
from
(select fuel_id,year,count_Of_Audi,price
from 
(select  fuel_id,year,count(*) as count_Of_Audi,price from
(select year,fuel_ID,price
from audi
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,count_Of_Audi,price) as k
group by year,count_Of_Audi,fuel_id,price) as i
group by year




----MErc insight for avg price and count of cars based on fuel type accross each year

select distinct(year),round(avg(price),2) as avg_price,
sum(case when fuel_ID = 5 then count_Of_merc  else 0 end) as 'petrol',
sum(case when fuel_id= 1 then count_Of_merc else 0 end) as 'diesel',
sum(case when fuel_id= 2 then count_Of_merc  else 0 end) as 'electric',
sum(case when fuel_id= 3 then count_Of_merc else 0 end) as 'hybrid',
sum(case when fuel_id= 4 then count_Of_merc else 0 end) as 'others'
from
(select year,count_Of_merc,fuel_ID,price
from
(select fuel_id,year,count_Of_merc,price
from 
(select  fuel_id,year,count(*) as count_Of_merc,price from
(select year,fuel_ID,price
from merc
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,count_Of_merc,price) as k
group by year,count_Of_merc,fuel_id,price) as i
group by year



----Hyndai insight for avg price and count of cars based on fuel type accross each year

select distinct(year),round(avg(price),2) as avg_price,
sum(case when fuel_ID = 5 then count_Of_Hyndai  else 0 end) as 'petrol',
sum(case when fuel_id= 1 then count_Of_Hyndai else 0 end) as 'diesel',
sum(case when fuel_id= 2 then count_Of_Hyndai  else 0 end) as 'electric',
sum(case when fuel_id= 3 then count_Of_Hyndai else 0 end) as 'hybrid',
sum(case when fuel_id= 4 then count_Of_Hyndai else 0 end) as 'others'
from
(select year,count_Of_Hyndai,fuel_ID,price
from
(select fuel_id,year,count_Of_Hyndai,price
from 
(select  fuel_id,year,count(*) as count_Of_Hyndai,price from
(select year,fuel_ID,price
from hyndai
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,count_Of_Hyndai,price) as k
group by year,count_Of_Hyndai,fuel_id,price) as i
group by year



----cclass insight for avg price and count of cars based on fuel type accross each year

select distinct(year),round(avg(price),2) as avg_price,
sum(case when fuel_ID = 5 then count_Of_Cclass  else 0 end) as 'petrol',
sum(case when fuel_id= 1 then count_Of_Cclass else 0 end) as 'diesel',
sum(case when fuel_id= 2 then count_Of_Cclass  else 0 end) as 'electric',
sum(case when fuel_id= 3 then count_Of_Cclass else 0 end) as 'hybrid',
sum(case when fuel_id= 4 then count_Of_Cclass else 0 end) as 'others'
from
(select year,count_Of_Cclass,fuel_ID,price
from
(select fuel_id,year,count_Of_Cclass,price
from 
(select  fuel_id,year,count(*) as count_Of_Cclass,price from
(select year,fuel_ID,price
from cclass
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,count_Of_Cclass,price) as k
group by year,count_Of_Cclass,fuel_id,price) as i
group by year



----BMW insight for avg_price according to model_id and transmission id

select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_ID,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_Bmw) as maximunm_of_count,price
from 
(select  transmission_ID,model_ID,count(*) as count_Of_Bmw,price from
(select model_ID,transmission_ID,price
from bmw
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_ID,transmission_ID,price) as h
group by transmission_ID,model_ID,price) as k
group by model_ID,maximunm_of_count,transmission_ID,price) as i
group by model_ID




---BMW insight for avg price according to transmission_id and year

select distinct(year),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select year,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,year,max(count_Of_Bmw) as maximunm_of_count,price
from 
(select  transmission_ID,year,count(*) as count_Of_Bmw,price from
(select year,transmission_ID,price
from bmw
group by fuel_id,transmission_ID,year,price) as g
group by year,transmission_ID,price) as h
group by transmission_ID,year,price) as k
group by year,maximunm_of_count,transmission_ID,price) as i
group by year
order by round(avg(price),2) desc



----bmw insight for avg price and count of cars based on fuel type accross each year

select distinct(year),round(avg(price),2) as avg_price,
sum(case when fuel_ID = 5 then count_Of_Bmw  else 0 end) as 'petrol',
sum(case when fuel_id= 1 then count_Of_Bmw else 0 end) as 'diesel',
sum(case when fuel_id= 2 then count_Of_Bmw  else 0 end) as 'electric',
sum(case when fuel_id= 3 then count_Of_Bmw  else 0 end) as 'hybrid',
sum(case when fuel_id= 4 then count_Of_Bmw else 0 end) as 'others'
from
(select year,count_Of_Bmw,fuel_ID,price
from
(select fuel_id,year,count_Of_Bmw,price
from 
(select  fuel_id,year,count(*) as count_Of_Bmw,price from
(select year,fuel_ID,price
from bmw
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,count_Of_Bmw,price) as k
group by year,count_Of_Bmw,fuel_id,price) as i
group by year
order by year




----bmw insight for fuel_id across model_id

select distinct(model_id),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,model_id
from
(select fuel_id,model_id,year,max(count_Of_Bmw) as maximunm_of_count
from 
(select  fuel_id,year,model_id,count(*) as count_Of_Bmw from
(select year,fuel_ID,price,model_ID
from bmw
group by fuel_id,year,price,model_id) as g
group by year,fuel_ID,model_id) as h
group by fuel_id,year,model_id) as k
group by year,maximunm_of_count,model_id,fuel_id) as i
group by model_ID
order by model_ID




---Bmw insight of fuel type per year of max count

select distinct(year),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID
from
(select fuel_id,year,max(count_Of_Bmw) as maximunm_of_count
from 
(select  fuel_id,year,count(*) as count_Of_Bmw from
(select year,fuel_ID,price
from bmw
group by fuel_id,year,price) as g
group by year,fuel_ID) as h
group by fuel_id,year) as k
group by year,maximunm_of_count,fuel_id) as i
group by year
order by year




---BMW insight for top 5 who has best mileage 

select model_id,mileage,year,fuel_type,Ranking from
(select model_id,mileage,year,fuel_type,dense_rank() over(order by mileage desc) as Ranking,
count(*)as count_Of_Bmw from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from bmw
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5



---BMW insight for avg_Engine_size according to each model_id and year

select * from 
(select distinct(avg_engine_Size) as average_Engine_size,model_id,year from
(select fuel_type,year,price,model_id,tax,transmission_ID,avg(engineSize) over(partition by model_id order by model_id) as avg_engine_Size,
count(*)as count_Of_Bmw from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from bmw
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d) as e





---Bmw insight for avg_price transmission_id according to each model_id and each_year

select * from 
(select distinct(avg_price) as average_price,transmission_id,model_id,year from
(select fuel_type,year,price,model_id,tax,transmission_ID,avg(price) over(partition by transmission_id order by model_id ) as avg_price,
count(*)as count_Of_Bmw from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from bmw
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,transmission_ID,tax,price,model_ID) as d) as e
order by year




---bmw insight for maximum price of model for each year

select fuel_type,year,price as max_price_of_Model,count_of_bmw,model_ID from
(select fuel_type,year,price,model_id,dense_rank() over(partition by year order by price desc) as rank,
count(*)as count_Of_Bmw from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from bmw
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,price,model_ID) as d
where rank like 1



---bmw insight according_to_fuel_type_and_year

select  fuel_type,year,count(*) as count_Of_Bmw from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from bmw
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year



----bmw insight for count_of_cars according to fuel_type

select  fuel_type,count(*) as count_Of_Bmw from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from bmw
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type



----AUdi insight for avg_price according to model_id and transmission id

select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_ID,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_audi) as maximunm_of_count,price
from 
(select  transmission_ID,model_ID,count(*) as count_Of_audi,price from
(select model_ID,transmission_ID,price
from audi
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_ID,transmission_ID,price) as h
group by transmission_ID,model_ID,price) as k
group by model_ID,maximunm_of_count,transmission_ID,price) as i
group by model_ID



---audi insight for avg price according to transmission_id and year

select distinct(year),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select year,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,year,max(count_Of_audi) as maximunm_of_count,price
from 
(select  transmission_ID,year,count(*) as count_Of_audi,price from
(select year,transmission_ID,price
from audi
group by fuel_id,transmission_ID,year,price) as g
group by year,transmission_ID,price) as h
group by transmission_ID,year,price) as k
group by year,maximunm_of_count,transmission_ID,price) as i
group by year
order by round(avg(price),2) desc




----audi insight for avg price by year and fuel_type

select distinct(year),round(avg(price),2) as avg_price,
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,price
from
(select fuel_id,year,max(count_Of_audi) as maximunm_of_count,price
from 
(select  fuel_id,year,count(*) as count_Of_audi,price from
(select year,fuel_ID,price
from audi
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,price) as k
group by year,maximunm_of_count,fuel_id,price) as i
group by year
order by round(avg(price),2) desc



----audi insight for fuel_id across model_id

select distinct(model_id),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,model_id
from
(select fuel_id,model_id,year,max(count_Of_audi) as maximunm_of_count
from 
(select  fuel_id,year,model_id,count(*) as count_Of_audi from
(select year,fuel_ID,price,model_ID
from audi
group by fuel_id,year,price,model_id) as g
group by year,fuel_ID,model_id) as h
group by fuel_id,year,model_id) as k
group by year,maximunm_of_count,model_id,fuel_id) as i
group by model_ID
order by model_ID



---audi insight of others per year of max count

select fuel_type,year,maximunm_of_count from
(select fuel_type,year,max(count_Of_audi) as maximunm_of_count
from 
(select  fuel_type,year,count(*) as count_Of_audi from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from audi
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year) as g
group by year,fuel_type) as h
order by year




---Audi insight of fuel_type per year of max count

select fuel_type,year,maximunm_of_count from
(select fuel_type,year,max(count_Of_audi) as maximunm_of_count
from 
(select  fuel_type,year,count(*) as count_Of_audi from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from audi) as c
group by fuel_type,year) as g
group by year,fuel_type) as h
order by year




---Audi insight for top 5 who has best mileage 

select model_id,mileage,year,fuel_type,Ranking from
(select model_id,mileage,year,fuel_type,dense_rank() over(order by mileage desc) as Ranking,
count(*)as count_Of_audi from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from audi
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5



---audi insight for avg_price transmission_id according to each model_id and each_year

select * from 
(select distinct(avg_price) as average_price,transmission_id,model_id,year from
(select fuel_type,year,price,model_id,tax,transmission_ID,avg(price) over(partition by transmission_id order by model_id ) as avg_price,
count(*)as count_Of_Bmw from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from audi
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,transmission_ID,tax,price,model_ID) as d) as e
order by year



---audi insight according_to_fuel_type_and_year

select  fuel_type,year,count(*) as count_Of_audi from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from audi
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year
order by year




---audi insight for count_of_cars according to fuel_type

select  fuel_type,count(*) as count_Of_audi from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from audi
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type




---audi insight for max_price for each model in each year

select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,rank
 from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,DENSE_RANK() over(partition by model_id,year order by price desc) as rank  
from audi
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
where rank like 1
order by year



----merc insight for avg_price according to model_id and transmission id

select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_ID,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_merc) as maximunm_of_count,price
from 
(select  transmission_ID,model_ID,count(*) as count_Of_merc,price from
(select model_ID,transmission_ID,price
from merc
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_ID,transmission_ID,price) as h
group by transmission_ID,model_ID,price) as k
group by model_ID,maximunm_of_count,transmission_ID,price) as i
group by model_ID



---merc insight for avg price according to transmission_id and year

select distinct(year),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select year,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,year,max(count_Of_merc) as maximunm_of_count,price
from 
(select  transmission_ID,year,count(*) as count_Of_merc,price from
(select year,transmission_ID,price
from merc
group by fuel_id,transmission_ID,year,price) as g
group by year,transmission_ID,price) as h
group by transmission_ID,year,price) as k
group by year,maximunm_of_count,transmission_ID,price) as i
group by year
order by round(avg(price),2) desc



----merc insight for avg price by year and fuel_type

select distinct(year),round(avg(price),2) as avg_price,
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,price
from
(select fuel_id,year,max(count_Of_merc) as maximunm_of_count,price
from 
(select  fuel_id,year,count(*) as count_Of_merc,price from
(select year,fuel_ID,price
from merc
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,price) as k
group by year,maximunm_of_count,fuel_id,price) as i
group by year
order by round(avg(price),2) desc




----merc insight for fuel_id across model_id

select distinct(model_id),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,model_id
from
(select fuel_id,model_id,year,max(count_Of_merc) as maximunm_of_count
from 
(select  fuel_id,year,model_id,count(*) as count_Of_merc from
(select year,fuel_ID,price,model_ID
from merc
group by fuel_id,year,price,model_id) as g
group by year,fuel_ID,model_id) as h
group by fuel_id,year,model_id) as k
group by year,maximunm_of_count,model_id,fuel_id) as i
group by model_ID
order by model_ID



---merc insight of fuel type per year of max count

select distinct(year),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID
from
(select fuel_id,year,max(count_Of_merc) as maximunm_of_count
from 
(select  fuel_id,year,count(*) as count_Of_merc from
(select year,fuel_ID,price
from merc
group by fuel_id,year,price) as g
group by year,fuel_ID) as h
group by fuel_id,year) as k
group by year,maximunm_of_count,fuel_id) as i
group by year



---merc insight for top 5 who has best mileage 

select model_id,mileage,year,fuel_type,Ranking from
(select model_id,mileage,year,fuel_type,dense_rank() over(order by mileage desc) as Ranking,
count(*)as count_Of_merc from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5



---merc insight for avg_Engine_size according to each model_id and year

select * from 
(select distinct(avg_engine_Size) as average_Engine_size,model_id,year from
(select fuel_type,year,price,model_id,tax,transmission_ID,avg(engineSize) over(partition by model_id order by model_id) as avg_engine_Size,
count(*)as count_Of_merc from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from merc
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d) as e




---merc insight for avg_price transmission_id according to each model_id and each_year

select * from 
(select distinct(avg_price) as average_price,transmission_id,model_id,year from
(select fuel_type,year,price,model_id,tax,transmission_ID,avg(price) over(partition by transmission_id order by model_id ) as avg_price,
count(*)as count_Of_merc from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from merc
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,transmission_ID,tax,price,model_ID) as d) as e
order by year




---merc insight for maximum price of model for each year

select fuel_type,year,price as max_price_of_Model,count_Of_merc,model_ID from
(select fuel_type,year,price,model_id,dense_rank() over(partition by year order by price desc) as rank,
count(*)as count_Of_merc from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,price,model_ID) as d
where rank like 1



---merc insight according_to_fuel_type_and_year

select  fuel_type,year,count(*) as count_Of_merc from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from merc
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year



---merc insight for count_of_cars according to fuel_type

select  fuel_type,count(*) as count_Of_merc from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from merc
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type




---merc insight for max_price for each model in each year

select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,rank
 from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,DENSE_RANK() over(partition by model_id,year order by price desc) as rank  
from merc
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
where rank like 1) 
order by year



---hyndai insight for avg_price according to model_id and transmission id

select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_ID,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_hyndai) as maximunm_of_count,price
from 
(select  transmission_ID,model_ID,count(*) as count_Of_hyndai,price from
(select model_ID,transmission_ID,price
from hyndai
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_ID,transmission_ID,price) as h
group by transmission_ID,model_ID,price) as k
group by model_ID,maximunm_of_count,transmission_ID,price) as i
group by model_ID



---hyndai insight for avg price according to transmission_id and model_id

select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_id,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_hyndai) as maximunm_of_count,price
from 
(select  transmission_ID,model_id,count(*) as count_Of_hyndai,price from
(select model_ID,transmission_ID,price
from hyndai
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_id,transmission_ID,price) as h
group by transmission_ID,model_id,price) as k
group by model_id,maximunm_of_count,transmission_ID,price) as i
group by model_id
order by round(avg(price),2) desc



---hyndai insight for avg price according to transmission_id and year

select distinct(year),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select year,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,year,max(count_Of_hyndai) as maximunm_of_count,price
from 
(select  transmission_ID,year,count(*) as count_Of_hyndai,price from
(select year,transmission_ID,price
from hyndai
group by fuel_id,transmission_ID,year,price) as g
group by year,transmission_ID,price) as h
group by transmission_ID,year,price) as k
group by year,maximunm_of_count,transmission_ID,price) as i
group by year
order by round(avg(price),2) desc



----hyndai insight for avg price by year and fuel_type

select distinct(year),round(avg(price),2) as avg_price,
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,price
from
(select fuel_id,year,max(count_Of_hyndai) as maximunm_of_count,price
from 
(select  fuel_id,year,count(*) as count_Of_hyndai,price from
(select year,fuel_ID,price
from hyndai
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,price) as k
group by year,maximunm_of_count,fuel_id,price) as i
group by year
order by round(avg(price),2) desc



----hyndai insight for fuel_id across model_id

select distinct(model_id),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,model_id
from
(select fuel_id,model_id,year,max(count_Of_hyndai) as maximunm_of_count
from 
(select  fuel_id,year,model_id,count(*) as count_Of_hyndai from
(select year,fuel_ID,price,model_ID
from hyndai
group by fuel_id,year,price,model_id) as g
group by year,fuel_ID,model_id) as h
group by fuel_id,year,model_id) as k
group by year,maximunm_of_count,model_id,fuel_id) as i
group by model_ID
order by model_ID



---hyndai insight of fuel type per year of max count
 
select distinct(year),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID
from
(select fuel_id,year,max(count_Of_hyndai) as maximunm_of_count
from 
(select  fuel_id,year,count(*) as count_Of_hyndai from
(select year,fuel_ID,price
from hyndai
group by fuel_id,year,price) as g
group by year,fuel_ID) as h
group by fuel_id,year) as k
group by year,maximunm_of_count,fuel_id) as i
group by year



---hyndai insight of fuel_type per year of max count

select fuel_type,year,maximunm_of_count from
(select fuel_type,year,max(count_Of_hyndai) as maximunm_of_count
from 
(select  fuel_type,year,count(*) as count_Of_hyndai from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from hyndai) as c
group by fuel_type,year) as g
group by year,fuel_type) as h



---hyndai_ insight for top 5 who has best mileage 

select model_id,mileage,year,fuel_type,Ranking from
(select model_id,mileage,year,fuel_type,dense_rank() over(order by mileage desc) as Ranking,
count(*)as count_Of_hyndai from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5



---hyndai insight for avg_Engine_size according to each model_id and year

select * from 
(select distinct(avg_engine_Size) as average_Engine_size,model_id,year from
(select fuel_type,year,price,model_id,tax,transmission_ID,avg(engineSize) over(partition by model_id order by model_id) as avg_engine_Size,
count(*)as count_Of_hyndai from
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mpg,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mpg,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,tax,price,model_ID) as d) as e





---hyndai insight for avg_price for each model_ID according to each_year

select * from 
(select distinct(avg_price) as average_price,model_id,year from
(select fuel_type,year,price,model_id,tax,avg(price) over(partition by model_id order by year desc) as avg_price,
count(*)as count_Of_hyndai from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,tax,price,model_ID) as d) as e
order by year



---hyndai insight for maximum price of model for each year

select fuel_type,year,price as max_price_of_Model,count_Of_hyndai,model_ID from
(select fuel_type,year,price,model_id,dense_rank() over(partition by year order by price desc) as rank,
count(*)as count_Of_hyndai from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,price,model_ID) as d
where rank like 1




---hyndai insight according_to_fuel_type_and_year

select  fuel_type,year,count(*) as count_Of_hyndai from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year



---hyndai insight for count_of_cars according to fuel_type

select  fuel_type,count(*) as count_Of_hyndai from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from hyndai
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,tax,mileage,mpg,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type





---cclass insight for avg price according to transmission_id and model_id

select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_id,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_cclass) as maximunm_of_count,price
from 
(select  transmission_ID,model_id,count(*) as count_Of_cclass,price from
(select model_ID,transmission_ID,price
from cclass
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_id,transmission_ID,price) as h
group by transmission_ID,model_id,price) as k
group by model_id,maximunm_of_count,transmission_ID,price) as i
group by model_id
order by round(avg(price),2) desc



----cclass insight for avg_price according to model_id and transmission id
 
select distinct(model_ID),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select model_ID,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,model_id,max(count_Of_cclass) as maximunm_of_count,price
from 
(select  transmission_ID,model_ID,count(*) as count_Of_cclass,price from
(select model_ID,transmission_ID,price
from cclass
group by fuel_id,transmission_ID,model_ID,price) as g
group by model_ID,transmission_ID,price) as h
group by transmission_ID,model_ID,price) as k
group by model_ID,maximunm_of_count,transmission_ID,price) as i
group by model_ID





----cclass insight for avg price by year and fuel_type

select distinct(year),round(avg(price),2) as avg_price,
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,price
from
(select fuel_id,year,max(count_Of_cclass) as maximunm_of_count,price
from 
(select  fuel_id,year,count(*) as count_Of_cclass,price from
(select year,fuel_ID,price
from cclass
group by fuel_id,year,price) as g
group by year,fuel_ID,price) as h
group by fuel_id,year,price) as k
group by year,maximunm_of_count,fuel_id,price) as i
group by year
order by round(avg(price),2) desc



---cclass insight for avg price according to transmission_id and year

select distinct(year),round(avg(price),2) as avg_price,
max(case when transmission_ID = 4 then maximunm_of_count else 0 end) as 'semi_Auto',
max(case when transmission_ID = 1 then maximunm_of_count else 0 end) as 'Automatic',
max(case when transmission_ID = 2 then maximunm_of_count else 0 end) as 'Manual',
max(case when transmission_ID = 3 then maximunm_of_count else 0 end) as 'Other_transmission'
from
(select year,maximunm_of_count,transmission_ID,price
from
(select transmission_ID,year,max(count_Of_cclass) as maximunm_of_count,price
from 
(select  transmission_ID,year,count(*) as count_Of_cclass,price from
(select year,transmission_ID,price
from cclass
group by fuel_id,transmission_ID,year,price) as g
group by year,transmission_ID,price) as h
group by transmission_ID,year,price) as k
group by year,maximunm_of_count,transmission_ID,price) as i
group by year
order by round(avg(price),2) desc




---cclass insight of fuel type per year of max count

select distinct(year),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID
from
(select fuel_id,year,max(count_Of_cclass) as maximunm_of_count
from 
(select  fuel_id,year,count(*) as count_Of_cclass from
(select year,fuel_ID,price
from cclass
group by fuel_id,year,price) as g
group by year,fuel_ID) as h
group by fuel_id,year) as k
group by year,maximunm_of_count,fuel_id) as i
group by year
order by year



----cclass insight for fuel_id across model_id

select distinct(model_id),
max(case when fuel_ID = 5 then maximunm_of_count else 0 end) as 'petrol',
max(case when fuel_id= 1 then maximunm_of_count else 0 end) as 'diesel',
max(case when fuel_id= 2 then maximunm_of_count else 0 end) as 'electric',
max(case when fuel_id= 3 then maximunm_of_count else 0 end) as 'hybrid',
max(case when fuel_id= 4 then maximunm_of_count else 0 end) as 'others'
from
(select year,maximunm_of_count,fuel_ID,model_id
from
(select fuel_id,model_id,year,max(count_Of_cclass) as maximunm_of_count
from 
(select  fuel_id,year,model_id,count(*) as count_Of_cclass from
(select year,fuel_ID,price,model_ID
from cclass
group by fuel_id,year,price,model_id) as g
group by year,fuel_ID,model_id) as h
group by fuel_id,year,model_id) as k
group by year,maximunm_of_count,model_id,fuel_id) as i
group by model_ID
order by model_ID





---cclass insight of fuel_type per year of max count

select fuel_type,year,maximunm_of_count from
(select fuel_type,year,max(count_Of_cclass) as maximunm_of_count
from 
(select  fuel_type,year,count(*) as count_Of_cclass from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from cclass) as c
group by fuel_type,year) as g
group by year,fuel_type) as h




---cclass insight of others per year of max count

select fuel_type,year,maximunm_of_count from
(select fuel_type,year,max(count_Of_cclass) as maximunm_of_count
from 
(select  fuel_type,year,count(*) as count_Of_cclass from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year) as g
group by year,fuel_type) as h
order by year





---cclass_ insight for top 5 who has best mileage 

select model_id,mileage,year,fuel_type,Ranking from
(select model_id,mileage,year,fuel_type,dense_rank() over(order by mileage desc) as Ranking,
count(*)as count_Of_cclass from
(select id,model_id,year,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,price,model_ID) as d
where ranking = 1 or ranking = 2 or ranking = 3 or ranking = 4 or ranking = 5



---cclass insight for avg_Engine_size according to each model_id and year

select * from 
(select distinct(avg_engine_Size) as average_Engine_size,model_id,year from
(select fuel_type,year,price,model_id,transmission_ID,avg(engineSize) over(partition by model_id order by model_id) as avg_engine_Size,
count(*)as count_Of_cclass from
(select id,model_id,year,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,enginesize,transmission_ID,fuel_ID,price,mileage,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,mileage,enginesize,transmission_ID,price,model_ID) as d) as e
order by year



---cclass insight for maximum price of model for each year

select fuel_type,year,price as max_price_of_Model,count_Of_cclass,model_ID from
(select fuel_type,year,price,model_id,dense_rank() over(partition by year order by price desc) as rank,
count(*)as count_Of_cclass from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,price,model_ID) as d
where rank like 1




---cclass insight for avg_price for each model_ID according to each_year

select * from 
(select distinct(avg_price) as average_price,model_id,year from
(select fuel_type,year,price,model_id,avg(price) over(partition by model_id order by year desc) as avg_price,
count(*)as count_Of_cclass from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type from 
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year,price,model_ID) as d) as e
order by year



---cclass insight for count_of_cars according to fuel_type

select  fuel_type,count(*) as count_Of_cclass from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type




---cclass insight according_to_fuel_type_and_year

select  fuel_type,year,count(*) as count_Of_cclass from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,percentage_change_across_year
,case when fuel_ID = 5 then 'petrol'
when fuel_id= 1 then 'diesel'
when fuel_id= 2 then 'Electric'
when fuel_id= 3 then 'Hybrid'
when fuel_id= 4 then 'others'
end as fuel_type
from 
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff,
cumulative_diff * 100/sum(cumulative_diff) over() as percentage_change_across_year
from
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,isnull(price -lag(price) over(order by year),0) as cumulative_diff 
from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,cumulative_diff) as b) as c
group by fuel_type,year





---cclass insight for max_price for each model in each year

select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price,rank
 from 
(select id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price
,DENSE_RANK() over(partition by model_id,year order by price desc) as rank  
from cclass
group by id,model_id,year,mileage,enginesize,transmission_ID,fuel_ID,price) as a
where rank like 1
order by year



----Avg price of all cars according to 3 buckets

select Bucket, avg(price) as Price
from 
(select distinct(Bucket),round(avg(price),2) as Price from
(Select model_name,price,ntile(3) over(order by price desc) as Bucket
from bmw join models
on bmw.model_ID = models.model_ID
group by  model_name,price) as a
group by Bucket
union all
select distinct(Bucket),round(avg(price),2) as Price from
(Select model_name,price,ntile(3) over(order by price desc) as Bucket
from audi join models
on Audi.model_ID = models.model_ID
group by  model_name,price) as a
group by Bucket
union all
select distinct(Bucket),round(avg(price),2) as Price from
(Select model_name,price,ntile(3) over(order by price desc) as Bucket
from merc join models
on Merc.model_ID = models.model_ID
group by  model_name,price) as a
group by Bucket
union all
select distinct(Bucket),round(avg(price),2) as Price from
(Select model_name,price,ntile(3) over(order by price desc) as Bucket
from hyndai join models
on hyndai.model_ID = models.model_ID
group by  model_name,price) as a
group by Bucket
union all
select distinct(Bucket),round(avg(price),2) as Price from
(Select model_name,price,ntile(3) over(order by price desc) as Bucket
from cclass join models
on cclass.model_ID = models.model_ID
group by  model_name,price) as a
group by Bucket) as i
group by Bucket
order by bucket 
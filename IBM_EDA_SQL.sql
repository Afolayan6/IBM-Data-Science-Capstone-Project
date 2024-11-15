#Display the names of the unique launch sites  in the space mission
select distinct(Launch_Site)
from ibm_datascience_capstone_project.spacex;


#Display 5 records where launch sites begin with the string 'CCA'
select *
from ibm_datascience_capstone_project.spacex
where Launch_site like "%CCA%"
limit 5;


#Display the total payload mass carried by boosters launched by NASA (CRS)
select sum(PAYLOAD_MASS__KG_) as PayloadMass_NASA
from ibm_datascience_capstone_project.spacex
where Customer = "NASA (CRS)";


#Display average payload mass carried by booster version F9 v1.1
select avg(PAYLOAD_MASS__KG_) as Average_PayloadMass
from ibm_datascience_capstone_project.spacex
where Booster_Version = "F9 v1.1";


#List the date when the first succesful landing outcome in ground pad was acheived
select min(Date)
from ibm_datascience_capstone_project.spacex
where Landing_Outcome = "Success (ground pad)";


#List the names of the boosters which have success in drone ship and have payload mass greater than 4000 but less than 6000
select Booster_Version
from ibm_datascience_capstone_project.spacex
where Landing_Outcome = "Success (drone ship)" and PAYLOAD_MASS__KG_ between 4000 and 6000;



#List the total number of successful and failure mission outcomes
select Mission_Outcome, count(Mission_Outcome)
from ibm_datascience_capstone_project.spacex
group by Mission_Outcome;



#List the names of the booster_versions which have carried the maximum payload mass. Use a subquery
select Booster_Version
from ibm_datascience_capstone_project.spacex
where PAYLOAD_MASS__KG_ = (select max(PAYLOAD_MASS__KG_) from ibm_datascience_capstone_project.spacex);


#Rank the count of landing outcomes (such as Failure (drone ship) or Success (ground pad)) between the date 2010-06-04 and 2017-03-20, in descending order.
select Landing_Outcome, count(Landing_Outcome) as Landing_Outcome_Count
from ibm_datascience_capstone_project.spacex
where Date between "2010-06-04" and "2017-03-20"
group by Landing_Outcome
order by Landing_Outcome_Count desc;













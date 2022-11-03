select state,
	sum(population)
from "populationdb"."population"
where state='Sao Paulo'
group by state;

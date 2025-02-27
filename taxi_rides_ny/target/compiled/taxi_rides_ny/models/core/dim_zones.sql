

select 
    locationid, 
    borough, 
    zone, 
    replace(service_zone,'Boro','Green') as service_zone 
from `dataengineering-449109`.`zoomcamp_dataset`.`taxi_zone_lookup`
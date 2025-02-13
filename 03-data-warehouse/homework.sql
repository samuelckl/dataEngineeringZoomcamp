
  CREATE OR REPLACE EXTERNAL TABLE `dataengineering-449109.zoomcamp_dataset.yellow_trip_2024`
    OPTIONS(
      format = 'PARQUET',
      uris=['gs://my-kestra-storage-bucket-203/*.parquet']
    );

SELECT count(*) FROM `dataengineering-449109.zoomcamp_dataset.yellow_trip_2024`;

CREATE OR REPLACE TABLE `dataengineering-449109.zoomcamp_dataset.fhv_partitioned_yellow_trip_2024`
AS SELECT * FROM `dataengineering-449109.zoomcamp_dataset.yellow_trip_2024`;


SELECT COUNT(DISTINCT(PULocationID)) FROM `dataengineering-449109.zoomcamp_dataset.fhv_partitioned_yellow_trip_2024`;

SELECT COUNT(DISTINCT(PULocationID)) FROM `dataengineering-449109.zoomcamp_dataset.yellow_trip_2024`;

SELECT DISTINCT(VendorID) FROM `dataengineering-449109.zoomcamp_dataset.fhv_partitioned_yellow_trip_2024`
WHERE DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01' AND '2024-03-15';

CREATE OR REPLACE TABLE `dataengineering-449109.zoomcamp_dataset.fhv_partitioned_clustered_yellow_trip_2024`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID AS
SELECT * FROM `dataengineering-449109.zoomcamp_dataset.fhv_partitioned_yellow_trip_2024`;

SELECT DISTINCT(VendorID) FROM `dataengineering-449109.zoomcamp_dataset.fhv_partitioned_clustered_yellow_trip_2024`
WHERE DATE(tpep_dropoff_datetime) BETWEEN '2024-03-01' AND '2024-03-15';




  CREATE OR REPLACE EXTERNAL TABLE `dataengineering-449109.zoomcamp_dataset.yellow_trip_2024`
    OPTIONS(
      format = 'PARQUET',
      uris=['gs://my-kestra-storage-bucket-203/*.parquet']
    );
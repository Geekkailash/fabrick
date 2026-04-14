# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "559f74ec-8443-4c7e-b0c1-487b5f824a4f",
# META       "default_lakehouse_name": "incremental_data_lakehouse",
# META       "default_lakehouse_workspace_id": "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a",
# META       "known_lakehouses": [
# META         {
# META           "id": "559f74ec-8443-4c7e-b0c1-487b5f824a4f"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!

df = spark.sql("SELECT * FROM incremental_data_lakehouse.dbo.incremental_raw_parquet LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


df = spark.sql("DESCRIBE incremental_raw_parquet")
df.show(1000,False)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

command = """
CREATE dbo.sales_csv (
    txn_id string,
    store_id string,
    customer_id string,
    txn_date date,
    product_id string,
    quantity int,
    unit_price int,
    total_amount int,
    last_updated timestamp
)
USING CSV
OPTIONS (
    header 'true',
    delimiter ',',
    inferSchema 'false' -- Recommended since you've manually defined the schema
)
LOCATION 'abfss://FabricProject@onelake.dfs.fabric.microsoft.com/incremental_data_lakehouse.Lakehouse/Files/raw'
"""

spark.sql(command)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

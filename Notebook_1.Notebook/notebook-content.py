# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06",
# META       "default_lakehouse_name": "hr_attrition_lakehouse",
# META       "default_lakehouse_workspace_id": "4b58b49f-8f7d-46c9-8a1e-f1e347783e0a",
# META       "known_lakehouses": [
# META         {
# META           "id": "4f2e745f-39c9-44a8-a15e-67e2e7c3ce06"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# MAGIC %%sql
# MAGIC 
# MAGIC CREATE TABLE IF NOT EXISTS employees (
# MAGIC     id INT,
# MAGIC     name STRING
# MAGIC );
# MAGIC 
# MAGIC INSERT INTO employees VALUES (1, 'Fabric User');
# MAGIC 
# MAGIC SELECT * FROM employees;
# MAGIC 
# MAGIC DROP TABLE employees

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

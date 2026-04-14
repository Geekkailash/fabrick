# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {}
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

# METADATA ********************

# META {
# META   "language": "sparksql",
# META   "language_group": "synapse_pyspark"
# META }

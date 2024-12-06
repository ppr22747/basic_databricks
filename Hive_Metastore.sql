-- Databricks notebook source
create schema bronze;

-- COMMAND ----------

-- manage table

create table bronze.emp (
  emp_id int,
  emp_name string,
  dept_code string
)

-- COMMAND ----------

describe extended bronze.emp

-- COMMAND ----------

insert into bronze.emp (emp_id, emp_name, dept_code) values (1001, 'Subham', 'D101');
insert into bronze.emp (emp_id, emp_name, dept_code) values (1002, 'Remesh', 'D101');
insert into bronze.emp (emp_id, emp_name, dept_code) values (1003, 'Suresh', 'D1022');

-- COMMAND ----------

select * from bronze.emp

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC dbutils.fs.ls("dbfs:/user/hive/warehouse/bronze.db/emp")

-- COMMAND ----------

create table bronze.emp_ext
(
emp_id int,
emp_name string,
dept_code string
)
location 'dbfs:/tmp/emp_ext'

-- COMMAND ----------

describe extended bronze.emp_ext

-- COMMAND ----------

insert into bronze.emp_ext (emp_id, emp_name, dept_code) values (1001, 'Subham', 'D101');
insert into bronze.emp_ext (emp_id, emp_name, dept_code) values (1002, 'Remesh', 'D101');
insert into bronze.emp_ext (emp_id, emp_name, dept_code) values (1003, 'Suresh', 'D1022');

-- COMMAND ----------

select * from bronze.emp_ext

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC dbutils.fs.ls('dbfs:/tmp/emp_ext')

-- COMMAND ----------

drop table bronze.emp

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC dbutils.fs.ls('dbfs:/user/hive/warehouse/bronze.db')

-- COMMAND ----------

drop table bronze.emp_ext

-- COMMAND ----------

-- MAGIC %python
-- MAGIC
-- MAGIC dbutils.fs.ls('dbfs:/tmp/emp_ext')

-- COMMAND ----------

select * from bronze.emp_ext

-- COMMAND ----------

create view bronze.emp_vw
as
select * from bronze.emp_ext where dept_code='D101'

-- COMMAND ----------

select * from bronze.emp_vw

-- COMMAND ----------

describe extended bronze.emp_vw

-- COMMAND ----------



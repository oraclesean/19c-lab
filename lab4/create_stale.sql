conn sh/sh@labpdb1
set echo off pause off

prompt
show user
prompt
show con_name

prompt
prompt Create a table and prevent stats gathering:
prompt

set echo on

create table stale as select * from sales where 1 = 2;
  insert /*+ APPEND no_gather_optimizer_statistics */ into stale(prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
  select prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold
    from sales;
commit;

set echo off

@table_info

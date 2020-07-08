prompt
prompt Create a table and prevent stats gathering:
prompt

set echo on pause on

create table stale as select * from sales where 1 = 2;
  insert /*+ APPEND no_gather_optimizer_statistics */ into stale(prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
  select prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold
    from sales;
commit;

set echo off pause off

@/home/oracle/lab4/table_info

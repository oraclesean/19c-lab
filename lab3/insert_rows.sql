set echo off pause off

prompt
prompt Insert records into the table:
prompt

set echo on pause on

  insert into sales(prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
  select prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold * 3, amount_sold * 3
    from sales;
commit;

set echo off pause off

prompt
prompt Plan shows OPTIMIZER STATISTICS GATHERING:
prompt

set echo on pause on

select * from table(dbms_xplan.display_cursor(format => 'TYPICAL'));

set echo off pause off

@/home/oracle/lab3/show_stats

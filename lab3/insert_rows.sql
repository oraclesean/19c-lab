set echo off pause off

prompt
prompt Insert records into the table:
prompt

set echo on

  insert into sales(prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold, amount_sold)
  select prod_id, cust_id, time_id, channel_id, promo_id, quantity_sold * 2, amount_sold * 2
    from sales;
commit;

set echo off

prompt
prompt Plan shows OPTIMIZER STATISTICS GATHERING:
prompt

set echo on

select * from table(dbms_xplan.display_cursor(format => 'TYPICAL'));

set echo off

@show_stats

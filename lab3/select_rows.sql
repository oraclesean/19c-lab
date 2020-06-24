set echo off

prompt
prompt Plan for a query against SALES:
prompt

set echo on

select count(*) from sales where quantity_sold > 2;
select * from table(dbms_xplan.display_cursor(format => 'TYPICAL'));

set echo off

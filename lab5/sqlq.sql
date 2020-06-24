conn demo/demo@labpdb1
set echo off pause off

prompt
show user
prompt
show con_name

prompt
prompt A bad plan:
prompt

set echo on

explain plan for
select a.*, b.* from customers a, customers b;

select * from table(dbms_xplan.display());

set echo off

prompt
prompt Run and ctl-c the following:
prompt select a.*, b.* from customers a, customers b;
prompt

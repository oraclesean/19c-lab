conn demo/demo@labpdb1
prompt
show user
prompt
show con_name

prompt
prompt #####################################################
prompt #            SQL Quarantine demonstraton            #
prompt #####################################################
prompt
prompt Generate a bad plan to be quarantined:
prompt

set echo on

explain plan for
select a.*, b.* from customers a, customers b;

select * from table(dbms_xplan.display());

set echo off

prompt
prompt Oh no! A Cartesian join!
prompt
prompt Run and ctl-c the following:
prompt select a.*, b.* from customers a, customers b;;
prompt
prompt Then create a quarantine. First get the SQL ID of the "bad" SQL:
prompt
prompt select sql_id from v$sql where sql_text = 'select a.*, b.* from customers a, customers b';;
prompt
prompt Create a quarantine, substituting the SQL ID into the following PL/SQL block:
prompt
prompt  declare
prompt          x varchar2(60);;
prompt    begin
prompt          x := dbms_sqlq.create_quarantine_by_sql_id('SQL_ID');;
prompt          dbms_output.put_line(x);;
prompt      end;;
prompt /
prompt
prompt Attempt to run the quarantined SQL:
prompt
prompt select a.*, b.* from customers a, customers b;;
prompt
prompt Try explaining the quarantined SQL:
prompt
prompt explain plan for
prompt select a.*, b.* from customers a, customers b;;
prompt
prompt Now try this:
prompt explain plan for
prompt select b.*, a.* from customers a, customers b;;
prompt select * from table(dbms_xplan.display());;
prompt

set echo off

prompt
prompt Create a quarantine:
prompt

set echo on

select sql_id from v$sql where sql_text = 'select b.*, a.* from customers a, customers b';

  declare
          x varchar2(60);
    begin
          x := dbms_sqlq.create_quarantine_by_sql_id('4dp0brpzjpksa');
          dbms_output.put_line(x);
      end;
/

set echo off

prompt
prompt Attempt to run the quarantined SQL:
prompt

set echo on

select a.*, b.* from customers a, customers b;

set echo off

prompt
prompt Explain plan fails on quarantined SQL:
prompt

set echo on

explain plan for
select a.*, b.* from customers a, customers b;

set echo off

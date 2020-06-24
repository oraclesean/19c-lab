set lines 116 trimspool on tab off pages 30 echo off
col plan_table_output format a116

prompt

set echo on

  select *
    from table(dbms_xplan.display_cursor(format => 'TYPICAL'));

set echo off pause off

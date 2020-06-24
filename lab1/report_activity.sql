conn demo/demo@labpdb2
prompt
show user
prompt
show con_name

col report for a116
set long 1000000 pages 30 verify off

prompt
prompt Report Latest AI Activity:
prompt

set echo on pause on

  select dbms_auto_index.report_activity(
                         activity_start => systimestamp - 1
         ,               activity_end   => systimestamp
         ,               type           => 'TEXT') as report
    from dual;

set echo off pause off

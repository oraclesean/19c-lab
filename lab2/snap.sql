set echo off pause off

prompt
prompt Capture an AWR snapshot:
prompt

set echo on pause off

exec dbms_workload_repository.create_snapshot;

set echo off

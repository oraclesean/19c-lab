conn sys/oracle@labpdb1 as sysdba
set echo off pause off

prompt
show user
prompt
show con_name

prompt
prompt Stop privilege analysis for the DBA and RESOURCE roles
prompt

set echo on pause on

exec dbms_privilege_capture.disable_capture('DBA_ROLE');
exec dbms_privilege_capture.generate_result('DBA_ROLE');

set echo off pause off

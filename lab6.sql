conn / as sysdba
alter session set container=labpdb1;
prompt
show user
prompt
show con_name

set echo off pause off
prompt
prompt #####################################################
prompt #           Privilege Analysis demonstraton         #
prompt #####################################################
prompt
prompt Privilege analysis was started in the database for the DBA role with:
prompt     begin
prompt           dbms_privilege_capture.create_capture (
prompt                           name        => 'DBA_ROLE'
prompt           ,               description => 'Privilege analysis for the DBA role'
prompt           ,               type        => dbms_privilege_capture.g_role
prompt           ,               roles       => role_name_list('DBA', 'RESOURCE'));;
prompt           dbms_privilege_capture.enable_capture ('DBA_ROLE');;
prompt       end;;
prompt /
prompt
prompt Stop privilege analysis for the DBA role:
set echo on
exec dbms_privilege_capture.disable_capture('DBA_ROLE');
set echo off
prompt Generate a report:
set echo on
exec dbms_privilege_capture.generate_result('DBA_ROLE');
set echo off
prompt
prompt Run the following script to report privileges used by the DEMO user:
prompt @lab6/report_privs
prompt

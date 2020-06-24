set echo off

prompt
show user
prompt
show con_name

col parameter_value for a45
col parameter_name for a25

prompt
prompt SQL Plan Managment Parameter Settings:
prompt

set echo on

  select parameter_name
,        parameter_value
    from dba_advisor_parameters
   where task_name = 'SYS_AUTO_SPM_EVOLVE_TASK'
     and parameter_value != 'UNUSED'
order by 1;

set echo off

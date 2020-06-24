set echo off

prompt
prompt Show HFS settings:
prompt

col task_status for a15
col max_run_time for a15
col task_interval for a15

set echo on

  select dbms_stats.get_prefs('AUTO_TASK_STATUS') as task_status
,        dbms_stats.get_prefs('AUTO_TASK_MAX_RUN_TIME') as max_run_time
,        dbms_stats.get_prefs('AUTO_TASK_INTERVAL') as task_interval
    from dual;

set echo off

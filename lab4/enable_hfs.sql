set echo off

prompt
prompt Turn on High-Frequency Statistics Gathering
prompt

set echo on

exec dbms_stats.set_global_prefs('AUTO_TASK_STATUS', 'ON');
exec dbms_stats.set_global_prefs('AUTO_TASK_INTERVAL', '60');

set echo off

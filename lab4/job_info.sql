set echo off

prompt
prompt Report executions for automatic statistics gathering:
prompt

col start_time for a35
col status for a15
col opid for 9999

set echo on

select opid, status, start_time from dba_auto_stat_executions;

set echo off

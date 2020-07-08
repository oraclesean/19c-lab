set pages 30 verify off

col parameter_name for a35
col parameter_value for a20

prompt
prompt Auto-Indexing Configuration:
prompt

set echo on pause on

  select parameter_name
,        parameter_value
    from dba_auto_index_config
order by 1;

set echo off pause off

conn demo/demo@labpdb2
prompt
show user
prompt
show con_name

set pages 30 verify off
col execution_name for a30

prompt
prompt Auto-Indexing Statistics:
prompt

set echo on pause on

  select *
    from dba_auto_index_statistics
order by 1 asc;

set echo off pause off

conn demo/demo@labpdb2
prompt
show user
prompt
show con_name

set pages 30 verify off
col owner for a10
col table_name for a15
col index_name for a25
col column_name for a30

prompt
prompt Auto-Indexing Statistics:
prompt

set echo on pause on

  select object_id
,        attr2 as owner
,        attr1 as table_name
,        attr3 as index_name
,        attr4 as column_name
    from dba_advisor_objects
   where task_name = 'SYS_AUTO_INDEX_TASK'
     and type      = 'INDEX'
order by object_id;

set echo off pause off

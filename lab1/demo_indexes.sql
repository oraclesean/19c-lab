conn demo/demo@labpdb2
prompt
show user
prompt
show con_name
col table_name for a20
col index_name for a20
col index_type for a10
col column_name for a20
col report for a116
col execution_name for a30
set pages 30 verify off

prompt
prompt Report User Indexes:
prompt

break on table_name on table_type on index_name

set echo on pause on

  select i.table_name
,        i.table_type
,        i.index_name
,        i.index_type
,        i.auto
,        c.column_name
    from user_indexes         i
,        user_ind_columns     c
   where i.index_name         = c.index_name
     and i.table_name         = c.table_name
order by i.table_name
,        i.index_name;

set echo off pause off

clear breaks

conn sh/sh@labpdb1

prompt
show user
prompt
show con_name

col column_name for a13
col low_value for a14
col high_value for a14
col notes for a25
col partition_name for a15
col num_rows for 99999999
col blocks for 999999

prompt
prompt Gather statistics on the SALES table:
prompt

set echo on

exec dbms_stats.gather_table_stats('SH', 'SALES', method_opt => 'FOR ALL COLUMNS SIZE 2');

set echo off

@show_stats

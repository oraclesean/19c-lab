set echo off pause off

prompt
prompt Show information for SALES, STALE tables:
prompt

set echo on pause on

select table_name, num_rows, avg_row_len, monitoring from user_tables where table_name in ('SALES', 'STALE');
select table_name, stale_stats from user_tab_statistics where table_name in ('STALE');

set echo off pause off

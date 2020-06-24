prompt
prompt Show column statistics for the SALES table:
prompt

set pages 30
set echo on pause on

  select column_name, low_value, high_value, sample_size, notes
    from user_tab_col_statistics
   where table_name = 'SALES'
order by 1, 5;

set echo off pause off

prompt
prompt Show partition statistics for the SALES table:
prompt

set echo on pause on

  select nvl(partition_name, 'GLOBAL') partition_name, num_rows, blocks, notes
    from user_tab_statistics
   where table_name = 'SALES'
order by 1, 4;

set echo off pause off pages 9999

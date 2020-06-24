set echo off pause off

prompt
prompt Introduce a regression
prompt ======================
prompt
prompt Drop histograms on the tables so the optimizer is no longer
prompt aware of data skew in the tables. The optimizer will now
prompt choose a NESTED LOOP join over the (correct) HASH JOIN.
prompt

set echo on

exec dbms_stats.delete_column_stats(user, 'tab1', 'd', no_invalidate => false, col_stat_type => 'HISTOGRAM');
exec dbms_stats.delete_column_stats(user, 'tab2', 'd', no_invalidate => false, col_stat_type => 'HISTOGRAM');

set echo off

conn demo/demo@labpdb1

conn demo/demo@labpdb1

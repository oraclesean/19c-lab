conn demo/demo@labpdb1
prompt
show user
prompt
show con_name

set echo off pause off
prompt
prompt #####################################################
prompt #    Oracle 19c Performance Tuning Enhnacements     #
prompt #####################################################
prompt
@lab2/report_spm
set echo off pause on
prompt
prompt Collect histograms:
prompt
set echo on
exec dbms_stats.gather_table_stats(user, 'tab1', method_opt => 'for all columns size 254', no_invalidate => false);
exec dbms_stats.gather_table_stats(user, 'tab2', method_opt => 'for all columns size 254', no_invalidate => false);
set echo off
prompt
prompt Drop baselines:
prompt
set echo on pause on
@lab2/drop_baselines
set echo off pause off
prompt
prompt Based on the histograms, the following query should select
prompt a hash join operation:
prompt
@lab2/hash_join
set echo off pause on
prompt
prompt The following query should select a nested loops join:
prompt
@lab2/nl_join
set echo off pause off
prompt
prompt The create_awr script runs the hash join multiple times so the optimizer 
prompt has information about the "good" plan. This allows Oracle to
prompt identify a regression:
prompt @lab2/create_awr
prompt
prompt Create a regression by deleting the histograms:
prompt @lab2/regression
prompt
prompt Note the plan change for the query that should be using the
prompt hash join:
prompt @lab2/hash_join
prompt
prompt Evolve the plan (as the Auto SQL Plan Management would):
prompt @lab2/fix_plan
prompt 
prompt Check the plan for the query that should use a hash join:
prompt @lab2/hash_join
prompt

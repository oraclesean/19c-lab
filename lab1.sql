conn / as sysdba
alter pluggable database labpdb2 open read write;
conn demo/demo@labpdb2
prompt
show user
prompt
show con_name

set echo off pause off
prompt
prompt #####################################################
prompt #             Auto-indexing demonstraton            #
prompt #####################################################
prompt
@lab1/report_config
@lab1/report_activity
@lab1/demo_indexes

set echo off pause off
prompt
prompt Note the system-generated invisible index in the report.
prompt
prompt Run the following script to run 100 random select on the table:
prompt @lab1/low_card
prompt
prompt Then, mark the recommended index visible with:
prompt alter index <index_name> visible;;
prompt
prompt Run the same script again and note the performance:
prompt @lab1/low_card
prompt
prompt The following script shows the auto-index tasks:
prompt @lab1/tasks
prompt

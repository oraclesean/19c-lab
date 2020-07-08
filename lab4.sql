conn sh/sh@labpdb1
prompt
show user
prompt
show con_name

prompt
prompt #####################################################
prompt #      High Frequency Statistics demonstration      #
prompt #####################################################
prompt
@lab4/create_stale
@lab4/hfs_status
@lab4/enable_hfs
prompt
prompt High Frequency Statistics is enabled and will run every minute.
prompt Check the status with:
prompt @lab4/hfs_status
prompt
prompt Run the following query to see when the job has run and finished:
prompt @lab4/job_info
prompt
prompt Once the job has run, check the table information again:
prompt @lab4/table_info
prompt
prompt The STALE table should no longer be marked 'STALE' and its stats
prompt will more closely match the SALES table.
prompt
prompt Disable the High Frequency Statistics job:
prompt @lab4/disable_hfs
prompt

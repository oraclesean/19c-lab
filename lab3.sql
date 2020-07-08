conn sh/sh@labpdb1
prompt
show user
prompt
show con_name

prompt
prompt #####################################################
prompt #        Real-Time Statistics demonstration         #
prompt #####################################################
prompt
@lab3/gather_stats
@lab3/select_rows
@lab3/insert_rows
prompt
prompt Run the query to select from the SALES table again:
prompt @lab3/select_rows
prompt
prompt Check the statistics shown for the SALES table after the insert:
prompt @lab3/show_stats
prompt
prompt Note the added statistics generated in real-time by the insert
prompt and the new high values for the quantity and amount sold columns.
prompt
prompt Generate statistics again:
prompt @lab3/gather_stats
prompt
prompt Observe the statistics have been merged/recreated:
prompt @lab3/show_stats
prompt

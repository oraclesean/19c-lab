conn demo/demo@labpdb2
prompt
show user
prompt
show con_name

set pages 30 verify off

prompt
prompt Turn On Auto-Indexing:
prompt

set echo on

exec dbms_auto_index.configure('AUTO_INDEX_MODE', '&1');

set echo off

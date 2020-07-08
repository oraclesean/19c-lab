set echo off

prompt
prompt Display privilege analysis results
prompt

col username for a4
col sys_priv for a35
col used_role for a20
col path for a72
col obj_priv for a10
col object_owner head OWNER for a8
col object_name for a25
col object_type for a15

prompt
prompt System privileges used by the DEMO user:
prompt

set echo on pages 30 pause on

  select username, sys_priv, used_role, path
    from dba_used_sysprivs_path
   where username = 'DEMO'
order by 1, 2, 3;

set echo off pause off

prompt
prompt Object privileges used by the DEMO user:
prompt

set echo on pause on

  select username, obj_priv, used_role, object_owner, object_name, object_type
    from dba_used_objprivs
   where username = 'DEMO'
order by 1, 2, 3, 4, 5, 6;

set echo off pause off

col username for a15
col sys_priv for a35

prompt
prompt Unused system privileges for the DEMO user:
prompt

set echo on pause on

  select username, sys_priv
    from dba_unused_sysprivs
   where username = 'DEMO'
order by 1, 2;

set echo off pause off

set echo off

var rep clob
set lines 116 pages 30 trimspool on tab off long 1000000 serverout on numw 30
col report for a116
col plan_table_output for 95

exec select '' into :rep from dual;

prompt
prompt Invoke SPM to fix the plan
prompt

set echo on

  declare
          tname               varchar2(1000);
          ename               varchar2(1000);
          n                   number;
          sig                 number;
          sqlid               varchar2(1000);
          phv                 number;
          handle              varchar2(1000);
    begin
            select sql_id
          ,        plan_hash_value
              into sqlid
          ,        phv
              from v$sql
             where (sql_id, child_number) = (
            select sql_id
          ,        max(child_number) child_number
              from v$sql
             where sql_text = 'select /*+ NO_ADAPTIVE_PLAN */ sum(tab1.c), sum(tab2.c) from tab1, tab2 where tab1.a = tab2.a and tab1.d = 10'
          group by sql_id);
  
            select exact_matching_signature
              into sig
              from v$sqlarea 
             where sql_id = sqlid;

          -- Enabled = NO; we assume that this is a bad plan
          n := dbms_spm.load_plans_from_cursor_cache(sql_id => sqlid, plan_hash_value=> phv, enabled => 'no');

            select distinct sql_handle
              into handle
              from dba_sql_plan_baselines
              where signature = sig;

          tname := dbms_spm.create_evolve_task(sql_handle => handle);
          dbms_spm.set_evolve_task_parameter(task_name => tname, parameter => 'ALTERNATE_PLAN_BASELINE', value => 'EXISTING');
          dbms_spm.set_evolve_task_parameter(task_name => tname, parameter => 'ALTERNATE_PLAN_SOURCE',   value => 'CURSOR_CACHE+AUTOMATIC_WORKLOAD_REPOSITORY');
          dbms_spm.set_evolve_task_parameter(task_name => tname, parameter => 'ALTERNATE_PLAN_LIMIT',    value => 'UNLIMITED');
          ename := dbms_spm.execute_evolve_task(tname);

          n := dbms_spm.implement_evolve_task(tname);

            select dbms_spm.report_evolve_task(task_name => tname)
              into :rep
              from dual;
exception
     when no_data_found
     then raise_application_error(-20001, 'The SQL_ID/PHV combination not found in V$SQL');
      end;
/

set echo off pause off
set pages 30 pause on echo on

select :rep report from dual;

set echo off pause off
conn demo/demo@labpdb1
conn demo/demo@labpdb1

prompt
show user
prompt
show con_name

prompt
prompt Drop Existing Baselines:
prompt

set echo on pause on
  declare
          l_plans_dropped  PLS_INTEGER;
    begin
      for rec in (select distinct sql_handle
                    from dba_sql_plan_baselines)
     loop
          l_plans_dropped := dbms_spm.drop_sql_plan_baseline(sql_handle => rec.sql_handle, plan_name => NULL);
 end loop;
      end;
/

set echo off pause off

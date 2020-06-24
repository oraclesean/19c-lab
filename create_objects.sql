conn / as sysdba

set echo on verify off

alter session set container=&1;
  create user demo identified by demo;
   alter user demo default tablespace users;
   alter user demo quota unlimited on users;
   grant create table to demo;
   grant create session to demo;
   grant advisor to demo;
   grant dba to demo;
   grant dba to sh;
   grant select on dba_auto_index_config to demo;
   grant select on dba_auto_index_statistics to demo;
   grant select on dba_advisor_objects to demo;
   grant select on dba_sql_plan_baselines to demo;
   grant select on v_$session to demo;
   grant select on v_$sql_plan to demo;
   grant select on v_$sql_plan_statistics_all to demo;
   grant select on v_$sql to demo;
   grant select on v_$sqlarea to demo;
   grant execute on dbms_auto_index to demo;
   grant execute on dbms_auto_index_internal to demo;
   grant execute on dbms_spm to demo;
   grant execute on dbms_workload_repository to demo;
   grant execute on dbms_stats to sh;
   grant administer sql management object to demo;

conn demo/demo@&1
  create table customers (
         customer_id          number
,        first_name           varchar2(40)
,        last_name            varchar2(40)
,        zip_code             number
,        low_card_val         number
,        high_card_val        number
,        created_date         date
,        updated_date         date)
         tablespace users;

set timing on
  declare
          type customer_row is table of demo.customers%ROWTYPE;
          a_customers         customer_row;
          cursor c_customers is
            select level             as customer_id
          ,        dbms_random.string('L', trunc(dbms_random.value(4, 40))) as first_name
          ,        dbms_random.string('L', trunc(dbms_random.value(4, 40))) as last_name
          ,        trunc(dbms_random.value(1, 99999)) as zip_code
          ,        trunc(dbms_random.value(1, 1000)) as low_card_val
          ,        trunc(dbms_random.value(1, 20000000)) as high_card_val
          ,        trunc(sysdate - dbms_random.value(0, 3660)) as created_date
          ,        trunc(sysdate - dbms_random.value(0, 365)) as updated_date
              from dual
           connect by level <= 1000000;
    begin
     open c_customers;
     loop
    fetch c_customers bulk collect into a_customers limit 10000;
   forall i in 1..a_customers.count
            insert into demo.customers values a_customers(i);
          commit;
     exit when c_customers%NOTFOUND;
 end loop;
    close c_customers;
      end;
/

  create unique index demo.customers_p
      on demo.customers(customer_id)
         tablespace users;

   alter table demo.customers add (
         constraint customers_p
         primary key(customer_id)
         using index demo.customers_p);

  create table execution_log (
         loop_id              number
,        event_time           timestamp
,        test_col             varchar2(128)
,        row_count            number
,        duration             number);

prompt
prompt Create tables with skewed datasets.
prompt

  create table tab1 (
       a number(10)
,      b varchar2(1000)
,      c number(10)
,      d number(10));

  insert /*+ APPEND */ into tab1
  select decode(parity, 0, rn, 1, rn + 1000000)
,        :str
,        1
,        decode(parity, 0, rn, 1, 10)
    from (
  select trunc((rownum + 1) / 2) as rn
,        mod(rownum + 1, 2) as parity
    from (select null from dual connect by level <= 1000)
       , (select null from dual connect by level <= 5000));

commit;

  create table tab2
      as
  select *
    from tab1;

create index tab1i on tab1(a);
create index tab2i on tab2(a);

set echo off

prompt
prompt Gather statistics with histograms
prompt

set echo on

exec dbms_stats.gather_table_stats(user, 'tab1', method_opt => 'for all columns size 254', no_invalidate => false);
exec dbms_stats.gather_table_stats(user, 'tab2', method_opt => 'for all columns size 254', no_invalidate => false);

set echo off

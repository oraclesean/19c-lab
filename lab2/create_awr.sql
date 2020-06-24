set pause off echo off
@snap

prompt
prompt Run the HASH JOIN multiple times:
prompt

set echo on timing on

  declare 
          n1 number(10);
          n2 number(10);
    begin
      for i in 1..100
     loop
          execute immediate 'select /*+ NO_ADAPTIVE_PLAN */ sum(tab1.c), sum(tab2.c) from tab1, tab2 where tab1.a = tab2.a and tab1.d = 10' into n1, n2;
 end loop;
      end;
/

set echo off timing off

@snap

prompt
prompt This query should produce a HASH JOIN on the skewed data.
prompt

set timing on echo on pause off

  select /*+ NO_ADAPTIVE_PLAN */ 
         sum(tab1.c)
,        sum(tab2.c)
    from tab1, tab2
   where tab1.a = tab2.a
     and tab1.d = 10;

set timing off echo off pause off

prompt

@xplan

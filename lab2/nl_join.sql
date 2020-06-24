prompt
prompt Observe the correct NESTED LOOPS JOIN plan for skewed data. 
prompt

set timing on echo on pause off

  select /*+ NO_ADAPTIVE_PLAN */
         sum(tab1.c)
,        sum(tab2.c)
    from tab1, tab2
   where tab1.a = tab2.a
     and tab1.d = 1000;

set timing off echo off

prompt

@xplan

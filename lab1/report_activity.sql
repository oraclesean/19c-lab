col report for a116
set long 1000000 pages 30 verify off

prompt
prompt The DBMS_AUTO_INDEX.REPORT_ACTIVITY procedure shows
prompt auto-indexing activity for a given time period. The
prompt output can be generated as HTML or text. In the 
prompt following report, activity for the last 3 days is
prompt shown.
prompt
prompt Review the report and notice the recommendations,
prompt queries impacted, and the before/after comparisons.
prompt
prompt (Press ENTER to page through the report)

set echo on pause on

  select dbms_auto_index.report_activity(
                         activity_start => systimestamp - 3
         ,               activity_end   => systimestamp
         ,               type           => 'TEXT') as report
    from dual;

set echo off pause off

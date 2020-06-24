conn demo/demo@labpdb2
prompt
show user
prompt
show con_name

set pages 30 verify off

prompt
prompt Generate Activity - LOW_CARD_VAL:
prompt

set echo on timing on

  declare
          val                 number;
    begin

      for i in 1..1000
     loop

             select count(customer_id)
               into val
               from customers
              where low_card_val = trunc(dbms_random.value(1, 1000));


           commit;

 end loop;
      end;
/

set echo off timing off

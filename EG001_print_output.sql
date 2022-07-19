/*
1. How to print output? 
Use dbms_output.put_line()

By default, most tools do not configure a buffer for dbms_output to write to and do not attempt to read from that buffer after code executes.
To enable dbms_output, do the following:

In SQL*Plus, you'd need to use the command set serveroutput on [size N|unlimited]. So you'd do something like

SQL> set serveroutput on size 30000;
SQL> exec print_actor_quotes( <<some value>> );

In SQL Developer, you'd go to View -> DBMS Output to enable the DBMS Output window, then push the green plus icon to enable DBMS Output for a particular session.
Additionally, assuming that you don't want to print the literal "a.firstNamea.lastName" for every row, you probably want

FOR row IN quote_recs
LOOP
  DBMS_OUTPUT.PUT_LINE( row.firstName || ' ' || row.lastName );
END LOOP;

*/

DECLARE   
   -- variable declaration 
   tgt_timestamp  char(8) := to_char(sysdate, 'YYYYMMDD');
BEGIN      
   dbms_output.put_line(tgt_timestamp);
END;

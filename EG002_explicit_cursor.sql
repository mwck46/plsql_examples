DECLARE 
   -- variable declaration 
   curr_time date := sysdate;
   begin_of_day date := TRUNC(sysdate);
   
   o_obstime aws.obstime%type;
   o_data aws.data%type;
   o_qc aws.qc_ind%type;
   
   CURSOR explicit_cursor_aws IS
    SELECT obstime, data, qc_ind INTO o_obstime, o_data, o_qc
    FROM aws
    WHERE eleid = 'D1' AND stnid = 'R1C' AND
    obstime >= begin_of_day
    ORDER BY obstime DESC
    FETCH FIRST 50 ROWS ONLY;
BEGIN
    dbms_output.put_line(begin_of_day);
    
   -- Open the cursor and loop through the records
   OPEN explicit_cursor_aws;
   LOOP
      FETCH explicit_cursor_aws INTO o_obstime, o_data, o_qc;
      EXIT WHEN explicit_cursor_aws%NOTFOUND;
      dbms_output.put_line('obstime=' || to_char(v_rec.obstime, 'YYYY-MM-DD HH24:MI:SS') || ', data=' || o_data || ', qc=' || o_qc);
   END LOOP;
   CLOSE explicit_cursor_aws;
   
   dbms_output.put_line('finished!');
END;

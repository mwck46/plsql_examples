DECLARE 
   -- variable declaration 
   curr_time date := sysdate;
   begin_of_day date := TRUNC(sysdate);
   
BEGIN
    dbms_output.put_line('NOW = ' || to_char(begin_of_day, 'YYYY-MM-DD HH24:MI:SS'));
    
   BEGIN
      -- Open the cursor and loop through the records
      FOR v_rec IN (
         SELECT obstime, data, qc_ind
         FROM aws
         WHERE eleid = 'D1' AND stnid = 'R1C' AND
         obstime >= begin_of_day
         ORDER BY obstime DESC
         FETCH FIRST 50 ROWS ONLY) 
      LOOP
         -- Print the foo and bar values
         dbms_output.put_line('obstime=' || to_char(v_rec.obstime, 'YYYY-MM-DD HH24:MI:SS') || ', data=' || v_rec.data || ', qc=' || v_rec.qc_ind);
      END LOOP;
   END;
   
   dbms_output.put_line('finished!');
END;

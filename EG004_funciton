DECLARE 
   now_timestamp date;
   tgt_timestamp date;

   -- Round time stamp to the nearest 30 minute
   FUNCTION trunc_timestamp (curr_t IN date)
   RETURN date 
   IS
      trunc_timestamp date;
   BEGIN
      trunc_timestamp := round( (curr_t - trunc(curr_t)) * 48 )/ 48 + trunc(curr_t);
      RETURN trunc_timestamp;
   END;

BEGIN 
   now_timestamp := sysdate;

   dbms_output.put_line('now_timestamp = ' || to_char(now_timestamp, 'YYYY-MM-DD HH24:MI:SS'));
   tgt_timestamp := trunc_timestamp(now_timestamp); 
   dbms_output.put_line('tgt_timestamp = ' || to_char(tgt_timestamp, 'YYYY-MM-DD HH24:MI:SS'));
   dbms_output.put_line('finished!');
END; 

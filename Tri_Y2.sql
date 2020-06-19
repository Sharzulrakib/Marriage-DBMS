set serveroutput on



create or replace trigger dob_time before insert or update on brides
 for each row

BEGIN
   :new.p_time := get_time(:new.e_date);
END;
    
show errors procedure q;
/

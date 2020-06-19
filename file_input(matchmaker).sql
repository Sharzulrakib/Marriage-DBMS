DECLARE
    F UTL_FILE.FILE_TYPE;
    V_LINE VARCHAR2 (1000);
    v_id matchmaker.m_id%type;
    v_name matchmaker.name%type;
    v_phone matchmaker.phone_no%type;
    
    BEGIN
        F := UTL_FILE.FOPEN ('RAKIB', 'Matchmaker.CSV', 'R');
        IF UTL_FILE.IS_OPEN(F) THEN
            dbms_output.put_line('file open succesful');
            UTL_FILE.GET_LINE(F, V_LINE, 1000);
       
            LOOP
                BEGIN
                    UTL_FILE.GET_LINE(F, V_LINE, 1000);
                    IF V_LINE IS NULL THEN
                    EXIT;
                    END IF;
                    v_id := REGEXP_SUBSTR(V_LINE, '[^,]+', 1, 1);
                    v_name := REGEXP_SUBSTR(V_LINE, '[^,]+', 1, 2);
                    v_phone := REGEXP_SUBSTR(V_LINE, '[^,]+', 1, 3);
                    insert into matchmaker (m_id, name, phone_no)  values (v_id, v_name, v_phone);
                    COMMIT;
                    EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                    EXIT;
                END;
            END LOOP;

        END IF;

  UTL_FILE.FCLOSE(F);
  END;
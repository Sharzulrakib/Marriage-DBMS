set serveroutput on


create or replace function get_time (DOB date) return number is
begin    
   return floor(months_between(sysdate,DOB)/12);    
end;

/
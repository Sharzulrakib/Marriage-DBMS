
create or replace procedure update_salary(ID_salary in number, inc number)
is

begin
    update brides 
    set salary = salary + (salary*inc)
    where b_id=ID_salary;
    dbms_output.put_line('salary Upodated for '||ID_salary);

end;
/   

set serveroutput on;
exec update_salary(2,0.1);



.............

set serveroutput on;
create or replace function f3(ID_salary in number, inc in number)
return number
is
psalary number;
begin
    update brides 
    set salary = salary + (salary*inc) 
    where b_id=ID_salary;
    select salary into psalary from brides;
    return psalary;
end;
/  
declare
v1 number;
begin
v1 :=f3(2,2);
dbms_output.put_line(v1);
end;
/


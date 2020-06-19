set serveroutput on
declare 
type namearray is varray(5) of brides.name%type;
type salaryarray is varray(5) of brides.salary%type;
m_salary salaryarray:=salaryarray();
m_name namearray:=namearray();
iid number(3):=1;
begin
while iid<=5
loop
m_salary.extend;
m_name.extend;
select name,salary into m_name(iid),m_salary(iid) from brides where b_id=iid;
iid:=iid+1;
end loop;
for iid in 1..5
loop
if(m_salary(iid)>=50000)
  then
   dbms_output.put_line(m_name(iid)||' She is perfect');
  else if(m_salary(iid)=0)
 then 
    dbms_output.put_line(m_name(iid)||' Immature');
 else if (m_salary(iid)<50000)
 then
   dbms_output.put_line(m_name(iid)||' She is less perfect');
 
   end if;
   end if;
   end if;
   end loop;

 
end;
/

set serveroutput on;
declare
cursor bride_info(var_b_id number) is
select name,p_time from brides
where p_time>var_b_id;
begin
for l_idx in bride_info(1)
loop
   dbms_output.put_line(l_idx.name||'--> '||'your validity time is expired.please register our database again,Thank you');
end loop;
end;






set serveroutput on;
declare
cursor bride_info(var_b_id number) is
select profession,home_town from brides
where b_id>var_b_id;
begin
for l_idx in bride_info(2)
loop
dbms_output.put_line(l_idx.profession||' '||l_idx.home_town);
end loop;
end;
/

set serveroutput on;
declare
cursor bride_info(var_b_salary number) is
select b_id,name,profession,home_town,salary from brides
where salary>var_b_salary;
begin
for l_idx in bride_info(50000)
loop
dbms_output.put_line(l_idx.b_id||' '||l_idx.name||' '||l_idx.profession||' '||l_idx.home_town||' '||l_idx.salary);
end loop;
end;
/











set serveroutput on
create or replace trigger increse before insert or update on brides
 for each row
declare 
c_id brides.b_id%type;
cnt integer;
cursor ct is 
 SELECT *  from brides where b_id=:new.b_id;
bride_record ct%rowtype;

begin 
SELECT COUNT(*) into cnt from brides where b_id=:new.b_id;
if cnt>3
then
 open ct;
  loop
  fetch ct into bride_record;
  exit when ct%notfound;
 :new.bride_record.salary:= :old.bride_record.salary*.9;
  end loop;
  close ct;
 end if;
 end;
 show errors procedure q;
 /
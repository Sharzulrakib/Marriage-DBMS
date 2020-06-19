set serveroutput on;
create or replace procedure p1(
pid in number,
pnam out varchar,
psal out number,
pprof out varchar
)
is 
begin select name,salary,profession into
pnam,psal,pprof from brides
where b_id=pid;
end;

declare
type salaryarray is varray(5) of brides.salary%type;
m_salary salaryarray:=salaryarray();
v1 varchar(20);
v2 number;
v3 varchar(20);
iid number(3):=1;

begin
while iid<=5
loop
m_salary.extend;
p1(iid,v1,v2,v3);
m_salary(iid):=v2;
if(m_salary(iid)>50000)
 then
	dbms_output.put_line(v1||'-'||m_salary(iid)||'-'||v3);
end if;
iid:=iid+1;
end loop;
end;






set serveroutput on;
create or replace procedure p1(
pid in number,
pnam out varchar,
psal out number,
pprof out varchar
)
is 
begin select name,salary,profession into
pnam,psal,pprof from brides
where b_id=pid;
end;

declare
v1 varchar(20);
v2 number;
v3 varchar(20);
iid number(3):=1;

begin
while iid<=5
loop
p1(iid,v1,v2,v3);
dbms_output.put_line(v1||'-'||v2||'-'||v3);
iid:=iid+1;
end loop;
end;










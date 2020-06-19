set serveroutput on;
create or replace function f1(
pid in number,
pnam out varchar,
pprof out varchar
)
return number
is 
psal number;
begin select name,salary,profession into
pnam,psal,pprof from brides
where b_id=pid;
return psal;
end;
declare
v1 number;
v2 varchar(20);
v3 varchar(20);
begin
v1:=f1(3,v2,v3);
dbms_output.put_line(v1||'-'||v2||'-'||v3);
end;
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
begin
p1(3,v1,v2,v3);
dbms_output.put_line(v1||'-'||v2||'-'||v3);
end;
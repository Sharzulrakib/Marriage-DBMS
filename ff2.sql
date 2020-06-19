set serveroutput on;
create or replace function f1(
pid in number
)
return varchar
is 
pnam varchar(20);
begin 
select name into
pnam from brides
where b_id=pid;
return pnam;
end;
declare
v2 varchar(20);
begin
v2:=f1(3);
dbms_output.put_line(v2);
end;
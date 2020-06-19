set serveroutput on;
declare
cursor bride_info(var_b_id number) is
select name,p_time from brides
where p_time>var_b_id;
begin
for l_idx in bride_info(2)
loop
if(l_idx.p_time<=3)
  then
   dbms_output.put_line(l_idx.name||'-->'||'please check your validity time');  
  else 
   dbms_output.put_line(l_idx.name||'--> '||'your validity time is expired.please register our database again,Thank you');
    end if;
end loop;
end;
/
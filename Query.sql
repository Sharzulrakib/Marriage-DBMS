 alter table brides add(e_profession varchar(20));
 alter table brides modify name varchar(30);
 alter table brides drop column e_profession;
 alter table brides rename column name to b_name;
 update brides set profession='actor' where name='priya';
 delete from brides;
 delete from brides where name='shitu';
 select distinct name from brides;
 select name from brides where b_id>2;
 select name from brides where b_id between 4 and 6;
 select name from brides where b_id not between 4 and 6;
 select name from brides where b_id in(4);
 select name from brides where b_id not in(4,6);
 select name from brides where name like '%iy%';
 select name from brides order by b_id;
 select name from brides order by b_id desc;
 select sum(b_id) from brides group by religion having sum(b_id)>4;

 update brides set profession='pilot' where profession in(select profession from brides where b_id in(select bride from matching where maker=22));
 select name,profession from brides where b_id in(select bride from matching where maker=22);
select b.name,g.name from brides b join grooms g on b.profession=g.profession;




drop table matching;
drop table matchmaker;
drop table brides;
drop table grooms;

create table brides(
b_id integer,
name varchar(20),
profession varchar(20),
height varchar(20),
salary integer,
phone_no varchar(20),
home_town varchar(20),
religion varchar(20),
e_date date,
p_time integer,
primary key(b_id)
);

set serveroutput on



create or replace trigger dob_time before insert or update on brides
 for each row

BEGIN
   :new.p_time := get_time(:new.e_date);
END;
    
show errors procedure q;
/


insert into brides(b_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(1,'tonu','student','5 Fit 5 Inc',0,'+88015','bogra','muslim','19-dec-2011');
insert into brides(b_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(2,'priya','engineer','5 Fit 3 Inc',70000,'+880152','comilla','muslim','19-mar-2013');
insert into brides(b_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(3,'tuli','singer','5 Fit 4 Inc',51000,'+8801521','norsingdi','hindu','20-feb-2016');
insert into brides(b_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(4,'shitu','doctor','5 Fit 5 Inc',60000,'+8801531','bogra','muslim','29-april-2018');
insert into brides(b_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(5,'ohi','teacher','5 Fit 2 Inc',45000,'+8801541','mymensing','muslim','1-june-2017');
insert into brides(b_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(6,'shruti','model','5 Fit 6 Inc',55000,'+8801565','dhaka','hindu','1-dec-2014');



create table grooms(
g_id integer,
name varchar(20),
profession varchar(20),
height varchar(20),
salary integer,
phone_no varchar(20),
home_town varchar(20),
religion varchar(20),
e_date date,
p_time integer,
primary key(g_id)
);



insert into grooms(g_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(7,'rifat','actor','5 Fit 7 Inc',51000,'+8801573','comilla','muslim','1-dec-2015');
insert into grooms(g_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(8,'anik','engineer','5 Fit 5 Inc',45000,'+8801522','noagoan','hindu','25-mar-2016');
insert into grooms(g_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(9,'kanon','banker','5 Fit 6 Inc',57000,'+8801503','natore','muslim','15-apr-2017');
insert into grooms(g_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(10,'amlan','doctor','5 Fit 6 Inc',71000,'+8801563','rangpur','hindu','11-mar-2018');
insert into grooms(g_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(11,'akash','teacher','5 Fit 10 Inc',35000,'+8801593','sirajgonj','muslim','19-aug-2018');
insert into grooms(g_id,name,profession,height,salary,phone_no,home_town,religion,e_date)values(12,'shahriar','police','5 Fit 6 Inc',25000,'+8801578','natore','muslim','5-sep-2018');



create table matchmaker(
m_id integer,
name varchar(20),
phone_no varchar(20),
primary key(m_id)
);

insert into matchmaker(m_id,name,phone_no)values(22,'fotik','+8801721');
insert into matchmaker(m_id,name,phone_no)values(33,'josim','+8801761');
insert into matchmaker(m_id,name,phone_no)values(44,'kalam','+8801771');


create table matching(
bride integer,
groom integer,
maker integer,
m_date date,
foreign key(bride) references brides(b_id) on delete cascade,
foreign key(groom) references grooms(g_id) on delete cascade,
foreign key(maker) references matchmaker(m_id) on delete cascade,
primary key(bride,groom)
);


insert into matching(bride,groom,maker,m_date)values(1,12,33,'11-mar-2018');
insert into matching(bride,groom,maker,m_date)values(2,11,22,'12-dec-2017');
insert into matching(bride,groom,maker,m_date)values(6,10,22,'24-feb-2016');

commit;










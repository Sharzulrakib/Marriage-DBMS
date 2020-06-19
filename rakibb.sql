drop table borrow;
drop table book;
drop table customer;

create table customer(
   cust_id integer,
   name varchar(20),
   contact_no varchar(20),
   age integer check(age>0 and age<121),
   primary key(cust_id)
);

create table book(    
    book_id integer,
    title varchar(20),
    author varchar(20),
    publisher varchar(20),
    price integer default 100,
    primary key(book_id)
);


create table borrow(
   c_id integer,
   b_id integer,
   ddate varchar(30),
   foreign key(c_id)references customer(cust_id),
   foreign key(b_id)references book(book_id),
   primary key(c_id,b_id)
);


insert into customer(cust_id,name,contact_no,age)values(1,'farid','01757354896',25);
insert into customer(cust_id,name,contact_no,age)values(2,'anik','01757354897',22);
insert into customer(cust_id,name,contact_no,age)values(3,'runa','01757354898',30);
insert into customer(cust_id,name,contact_no,age)values(4,'alok','01757354899',45);

insert into book(book_id,title,author,price)values(1,'e','abraham',210);
insert into book(book_id,title,author,price)values(2,'f','henry',300);
insert into book(book_id,title,author,price)values(3,'g','abraham',500);
insert into book(book_id,title,author,price)values(4,'h','henry',400);

insert into borrow(c_id,b_id,ddate)values(1,1,'01-feb-2018');
insert into borrow(c_id,b_id,ddate)values(2,2,'01-feb-2018');
insert into borrow(c_id,b_id,ddate)values(3,4,'01-mar-2018');
insert into borrow(c_id,b_id,ddate)values(1,3,'04-mar-2018');

alter table book drop column publisher;
alter table borrow rename column ddate to order_date;

select author,sum(price) from book group by author;
select avg(age) from customer where cust_id in(select c_id from borrow where b_id in(select book_id from book where author='henry'));
select title from book where book_id in(select b_id from borrow where c_id in(select cust_id from customer where age<30));
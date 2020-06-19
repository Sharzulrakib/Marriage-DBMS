drop table borrow;
drop table book;
drop table customer;

create table customer(

   cust_id integer,
   name varchar(20),
   contact_no varchar(20),
   age integer check (age>0 and age<121),
   primary key(cust_id)
);

create table book(
    
    book_id integer,
    title varchar(20),
    author varchar(20),
    publisher varchar(20),
    price integer default price=100,
    primary key(book_id)

);


create table borrow(

   c_id integer,
   b_id integer,
   ddate date,
   foreign key(c_id)references customer(cust_id) on delete cascade,
   foreign key(b_id)references book(book_id) on delete cascade,
   primary key(c_id,b_id)
);

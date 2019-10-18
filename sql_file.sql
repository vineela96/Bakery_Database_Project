create database Bakery;
use bakery;

#1
create table employee (emp_id int not null primary key unique,
first_name varchar(50),
last_name varchar(50),
designation varchar(50),
salary float not null default 2500,
emp_phone int(50),
join_date datetime not null);
#datetime not working
#drop table employee;

insert into employee values
(0001,"Benedict","Cumberbatch","Manager",5000,6321,now()),
(0005,"Joe","Thomsan","Executive",4500,5741,now()),
(0007,"Mary","Jackson","Dishwasher",4500,8754,now()),
(0008,"Kate","langford","Executive",4500,7852,now()),
(0002,"Ajay","Singh","Trainee",default,4625,now()),
(0006,"Anshul","Singh","Executive",4500,2345,now()),
(0009,"Joey","Tribbiani","Cashier",4500,6712,now()),
(0004,"Rachel","Greene","Executive",4500,9853,now()),
(0003,"Ross","Geller","Tainee",4800,default,now()),
(00010,"April","Thomsan","Cashier",4500,9043,now());

select *from employee;


#2
create table customer (cust_id int not null primary key auto_increment,
cust_name varchar(50),
cust_address varchar(50),
cust_phone int(50),
cust_email varchar(255));
#drop table customer;

insert into customer values
(null,"abc","124 flora drive",7895,"123@gmail.com"),
(null,"tgh","254 Macowan Rd ",4571,"atk@gmail.com"),
(null,"abc","124 flora drive",7895,"abc@gmail.com"),
(null,"tgh","254 Macowan Rd ",4571,"def@gmail.com"),
(null,"klm","25 Dorcot Avenue",4756,"ghi@gmail.com"),
(null,"drf","71 Lawerence ave",1254,"jkl@gmail.com"),
(null,"ght","421 Ellesmere Rd",9852,"omn@gmail.com"),
(null,"vgt","127 Macowan Rd",0352,"uvw@gmail.com"),
(null,"qwx","127 Brichmount",8426,"abd@gmail.com"),
(null,"omn","54 Baymills Rd",9536,"eop@gmail.com"),
(null,"mbg","140 flora drive",9503,"pqr@gmail.com"),
(null,"ewq","85 kennedy Rd",7547,"stu@gmail.com");

select *from customer;


#3
create table product(prod_id int not null primary key,
prod_name varchar(255),
description varchar(255),
unit_price int(255),
product_category varchar(50)
);
#drop table product;
insert into product values
(712,"freh apple cake","apple cake",8,"Vegan"),
(713,"gourmet cookies","oatmeal cookies",1.69,"Vegan"),
(714,"cheesecake slices","strawberry, bluberry, Mango",4,"Vegan"),
(715,"strawberry torte","filled with strawberry jam ",5,"Vegan"),
(716,"chocolate eclair","small chocolate balls",4,"Vegan"),
(717,"poundcake","dusted with powder sugar, lightly gazed coated with icing sugar",6,"Non-Vegan"),
(718,"lemon bars","cookie bars with luscious creamy filling with a zesty lemon",2,"Vegan"),
(719,"decadent brownies","fudgy chocolate squares ",5,"Vegan"),
(720,"shortbreads","quick breads",1,"Vegan"),
(721,"Cupcakes","20 flavours of cupcakes that no one can resist ",1.50,"Non-Vegan");

select *from product;


#4
create table invoice_table(order_id int not null primary key auto_increment,
date_received datetime not null,
subtotal_amount float not null,
total_amount float not null,
tax float not null,
payment_method varchar(255), 
cust_id int not null,foreign key(cust_id) references customer(cust_id),
emp_id int not null,foreign key(emp_id) references employee(emp_id));
#drop table invoice_table;
insert into invoice_table values
(null,now(),7,8.93,0.13,"visa",1,0001),
(null,now(),9,10.93,0.13,"cash",10,0010),
(null,now(),6,7.93,0.13,"mastercard",12,0002),
(null,now(),8,8.93,0.13,"visa",7,0005),
(null,now(),5,6.93,0.13,"cash",9,0008),
(null,now(),10,11.93,0.13,"cash",5,0010),
(null,now(),7,8.93,0.13,"visa",2,0007),
(null,now(),6,7.93,0.13,"mastercard",3,0006),
(null,now(),5,6.93,0.13,"visa",6,0001),
(null,now(),2,3.93,0.13,"cash",1,0001);

select *from invoice_table;


#5
create table Order_table(cust_id int not null,foreign key(cust_id) references customer(cust_id),
prod_id int not null,foreign key(prod_id) references product(prod_id),
order_id int not null,foreign key(order_id) references invoice_table(order_id),quantity int(255)
);
insert into Order_table values
(1,712,1,2),
(2,713,2,5),
(12,715,10,6),
(1,716,8,1),
(10,714,7,3),
(9,719,5,4),
(8,720,6,6),
(5,721,3,7),
(4,718,2,2),
(3,712,9,1);
select*from Order_table;
#drop table Order_table;


#6
create table suppliers(supp_id int not null primary key,
supplier_name varchar(255) not null,
supplier_phone int(255) not null,
supplier_address varchar (50) not null,
emp_id int not null,foreign key(emp_id) references employee(emp_id),
prod_id int not null,foreign key(prod_id) references product(prod_id),supp_quantity int(255));
#drop table suppliers;
insert into suppliers values
(123,"sysco",4582,"Abcroad",0001,712,10),
(124,"plus",8523,"Acroad",0002,713,30),
(125,"verdana",7845,"bcroad",0003,714,20),
(126,"sysco",4582,"Abroad",0004,715,20),
(127,"verdana",7854,"croad",0005,716,30),
(128,"verdana",7854,"broad",0006,717,20),
(129,"plus",8523,"Aroad",0008,719,50),
(122,"sysco",4582,"Lroad",0009,720,35),
(121,"sysco",4582,"Jroad",0010,721,25),
(120,"plus",8523,"This road",0010,721,22);
 

#7
create table supplier_order(order_confirmation varchar(255),
emp_id int not null,foreign key(emp_id) references employee(emp_id),
supp_id int not null,foreign key(supp_id) references suppliers(supp_id),
order_date datetime not null);
insert into supplier_order values
("y",0001,123,now()),
("n",0001,125,now()),
("y",0001,129,now()),
("y",0001,122,now()),
("n",0001,120,now()),
("y",0001,127,now()),
("y",0001,124,now()),
("n",0001,124,now()),
("y",0001,123,now()),
("n",0001,126,now());
#drop table supplier_order;

#updating name of supplier
delimiter $$
create procedure update_name(in supplier_name varchar(255))
begin
if( supplier_name = 'plus') then
 update suppliers set supplier_name = 'Winners' where supplier_name= 'plus';
end if;
end; $$

call update_name('plus');
#select *from suppliers;
#updating salary
delimiter $$
create procedure update_salary(in designation varchar(50)  )
begin
if(designation ='Manager') then
 update employee set salary = salary * 1.4 where designation = 'Manager';
else
update employee set salary = salary * 1.2 where designation = 'Executive';
end if;
end; $$

call update_salary('Executive');
#select *from employee;


Create database Addressbook_system
use Addressbook_system

create Table Addressbook
(
Firstname varchar(20),
Lastname varchar(20),
Address varchar (100),
City varchar(20),
State varchar(20),
Zip int,
Email varchar(20),
);

..........insert data..........

insert into Addressbook values
('Pooja','Rana','laxmiNagar','Delhi','NewDelhi',12345,'poojarana@gmail.com',987967834);
insert into Addressbook values
('Rahul','Sharma','krolbagh','Delhi','NewDelhi',11034,'rahul@gmail.com',9879679781);
insert into Addressbook values
('Shivm','Gupta','GangaNagar','Kanpur','UP',00113,'shivmgupts@gmail.com',1234567890);


......edit data by using firstname.....

update  Addressbook
set Lastname = 'Mishra'
where Firstname= 'Shivm';
select* from Addressbook
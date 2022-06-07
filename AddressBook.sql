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


......Delete contact using firstname.....
delete from Addressbook
where Firstname='Shivm';

......Retrieve data by using city or state name.....

select* from Addressbook
where City= 'Delhi' or State='New Delhi';

.....find the size of Addressbook using city and state.....

select count(City) from Addressbook
select count(State) from Addressbook

.......retrieve entries sorted alphabetically by Person’s name for a given city.......

select* from Addressbook
where city='Delhi'
order by Firstname Asc;

......Add type column......

ALTER TABLE Addressbook
Add Type varchar(20);
update  Addressbook set Type='Family' where Firstname='Pooja';
update  Addressbook set Type='Friend' where Firstname='Rahul';
update  Addressbook set Type='Profession' where Firstname='Shivm';


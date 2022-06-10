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

.....count by type......

select Count(Type) from AddressBook;

......add person to both Friend and Family....

Insert into AddressBook Values ('Abhi','Rajput','Modipuram','Bhopal','MP',500012,'abhiraj@hmail.com','900000000','Family');
Insert into AddressBook Values  ('Shalu','Bishnoi','Ganga Colony','Meerut','UP',500019,'shalubis@gmail.com','7869054687','Friend');

--------------UC12-Creating entities for ER diagram -------------------

Create table Address_Book1
(AddressBookId Int Identity(1,1) Primary Key,AddressBookName varchar(100));
select *from Address_Book1;


Create table PersonDetail1
(   
    PersonId Int Identity(1,1) Primary Key, AddressBookId Int Foreign Key References Address_Book1(AddressBookId),
	FirstName varchar(50),
	LastName varchar(50),
	Address varchar(100),
	 City varchar(50),
	State varchar(50),
		Zip int,
   PhoneNumber bigint,
   Email_ID varchar(50)
 );
select *from PersonDetail1;

CREATE table PersonTypes1(	 PersonTypeId Int Identity(1,1) Primary Key,PersonType varchar(50) );
select *from PersonTypes1;

CREATE table PersonsDetail_Type1(PersonId Int Foreign Key References PersonDetail1(PersonId),
								PersonTypeId Int Foreign Key References PersonTypes1(PersonTypeId)  );
select *from PersonsDetail_Type1;

CREATE table Employee_Department1(PersonId Int Foreign Key References PersonDetail1(PersonId),EmployeeID Int  ,DepartmentID int,);
select *from Employee_Department1;



-------------Inserting values into tables---------------------------------
INSERT INTO Address_Book1 Values('Home'),('School'),('College'),('Office');

select *from Address_Book1;



Insert INTO PersonDetail1 VALUES(1,'Pooja','Rana','vedpuri','Meerut','UP',520001,1234567890,'puja@gmail.com'),
								(2,'Rahul','Gupta','XYZ Colony','Laxminagar','Delhi',520002,1234567891,'rahul@gmail.com'),
								(3,'Viraj','Jhadhav','ABC Colony','Alwar','UP',520003,1234567892,'viraj@gamil.com'),
								(4,'Shiv','Mishra','','Vijayawada','Andhra Pradeshtra',520007,1234567893,'shiv@gmail.com');
select *from PersonDetail1;


INSERT INTO PersonTypes1 VALUES('Family'),('SchoolFriend'),('Friend'),('Profession');

select *from PersonTypes1;


INSERT INTO PersonsDetail_Type1(PersonId,PersonTypeId) VALUES(1,4),(2,3),(3,1),(4,2);
select *from PersonsDetail_Type1;

INSERT INTO Employee_Department1 VALUES(1,123,818),(2,456,19112),(3,789,4512),(4,244,161815)
select *from Employee_Department1;

-----------UC13-Ensuring All retrieve queries from UC6 to UC10 with new table---------
-----------UC6-Retrieve Person belonging to city Or State-------------- -----------

SELECT a.AddressBookId,a.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.State,p.Zip,
p.PhoneNumber,p.Email_ID,persontype.PersonType,persontype.PersonTypeId FROM 
PersonDetail1  p
INNER JOIN Address_Book1 a
ON a.AddressBookId = p.AddressBookId AND (p.City='Merrut' OR p.State='UP')
INNER JOIN PersonsDetail_Type1  pt 
On p.PersonId = pt.PersonId
INNER JOIN PersonTypes1  persontype 
ON persontype.PersonTypeId = pt.PersonTypeId;

----------UC7-understand Size of AddressBook by city and state---------
Select Count(*) As Count,State from PersonDetail1 Group By State;
Select Count(*) As Count,City from PersonDetail1 Group By City;

select Count(city) from PersonDetail1
select * from PersonDetail1

----------------UC8-Retrieve entries sorted alphabetically by person name---------------
SELECT a.AddressBookId,a.AddressBookName,p.PersonId,p.FirstName,p.LastName,p.Address,p.City,p.State,p.Zip,
p.PhoneNumber,p.Email_Id,pt1.PersonType,pt.PersonTypeId FROM
Address_Book1 a 
INNER JOIN PersonDetail1 p ON a.AddressBookId = p.AddressBookId 
INNER JOIN PersonsDetail_Type1 pt On pt.PersonId = p.PersonId
INNER JOIN PersonTypes1  pt1 ON pt1.PersonTypeId = pt.PersonTypeId Order By FirstName;

---------------UC_9Retreive Number Of Persons Records Based On Person Types---------------
Select Count(a.PersonTypeId) As PersonCount,b.PersonType From 
PersonsDetail_Type1 As a 
INNER JOIN PersonTypes1 AS b ON b.PersonTypeId = a.PersonTypeId
INNER JOIN PersonDetail1 AS c ON c.PersonId = a.PersonId Group By a.PersonTypeId,b.PersonType;

---------------UC_10_Retreive Number Of Persons Records Based On AddressBook Names----------
Select Count(a.AddressBookId) As AddressBookCount,a.AddressBookName From 
Address_Book1 As a 
INNER JOIN PersonDetail1 AS pd ON pd.AddressBookId = a.AddressBookId Group By a.AddressBookName,pd.AddressBookId;
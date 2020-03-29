create database oto;
use thiet_ke_csdl_ve_oto;
create table customers(
customerNumber int not null primary key,
customerName varchar(50) not null,
contactLastName varchar(50) not null,
contactFirstName varchar(50) not null,
phone varchar(50) not null,
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
city varchar(50) not null,
state varchar(50) not null,
postalCode varchar(15) not null,
country varchar(50) not null,
creditLimit double,
salesRepEmployeeNumber int,
officeCode varchar(10)
);

create table orders(
orderNumber int not null primary key,
orderDate date not null,
requiredDate date not null,
shippedDate date,
statusOrder varchar(15) not null,
comments text,
quantityOrdered int not null, 
priceEach double not null,
customerNumber int,
foreign key (customerNumber) references employees(employeeNumber)
);

create table payments (
customerNumber int not null primary key,
checkNumber varchar(50) not null,
paymentDate date not null,
amount double not null,
foreign key (customerNumber) references customers(customerNumber)
);

create table products (
productCode varchar(15) not null primary key,
productName varchar(70) not null,
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock int not null,
buyPrice double not null,
MSRP double not null,
productLine varchar(50),
foreign key (productLine) references productlines(productLine)
);

create table productlines (
productLine varchar(50) not null primary  key,
textDescription text,
image varchar(255)
);

create table employees (
employeeNumber int not null primary key,
lastName varchar(50) not null,
firstName varchar(50) not null, 
email varchar(100) not null,
jobTitle varchar(50) not null,
reportTo int,
constraint pk_self foreign key(reportTo) references employees(employeeNumber)
);

create table offices (
officeCode varchar(10) not null primary key,
city varchar(50) not null,
phone varchar(50) not null, 
addressLine1 varchar(50) not null,
addressLine2 varchar(50),
state varchar(50),
country varchar(50) not null,
postalCode varchar(15) not null
);

create table OrderDetails (
ordernumber int,
productcode varchar(15),
foreign key (ordernumber) references orders(orderNumber),
foreign key (productcode) references products(productCode)
);

alter table customers add foreign key (salesRepEmployeeNumber) references employees(employeeNumber);
alter table customers add foreign key (officeCode) references offices(officeCode);

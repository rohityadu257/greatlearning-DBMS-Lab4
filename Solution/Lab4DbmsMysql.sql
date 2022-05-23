#Lab4 for DBMS Topics(MySQL)

create database if not exists LabDbms; 

use LabDbms;
Create Table supplier (Supp_id int Primary Key,supp_name varchar(50) NOT NULL,supp_city varchar(50) NOT NULL,supp_phone varchar(50) NOT NULL);
create table customer (cus_id int primary key,us_name varchar(20) NOT NULL,cus_phone varchar(10) NOT NULL,cus_city varchar(30) NOT NULL,cus_gender char);
create table category (cat_id int primary key,cat_name varchar(20) NOT NULL);
create table product  (pro_id int Primary Key,pro_name varchar(20) NOT NULL DEFAULT "Dummy",pro_desc varchar (60),foreign key(pro_id) references category(cat_id));
create table supplier_pricing(pricing_id int Primary key,foreign key(pricing_id) references product(pro_id),foreign key(pricing_id) references supplier(supp_id),supp_price int DEFAULT 0) ;
create table Orders (Ord_id int primary key,ord_amount int NOT NULL,ord_date Date NOT NULL,foreign key (ord_id) references customer(cus_id),foreign key (ord_id) references supplier_pricing(pricing_id));
create table rating (rat_id int primary key,foreign key(rat_id) references Orders(ord_id),rat_ratstars int NOT NULL);

--------------------------------------------------------------------------------------------------------------------------------
#Inserting values to Tables
use labdbms;
insert into supplier values(1,'Rajesh Retails','Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.','Mumbai','2856965865');
insert into supplier values(3,'Knome Products','Bangalore','4589658966');
insert into supplier values(4,'Bansal Retails','Kochi','3658965323');
insert into supplier values(5,'Mittal Ltd.','Lucknow','3698521478');
-----------------------------------------------------------------------------------------------
#insert values to Customer Table
insert into customer values(1,'AAKASH','999999999','DELHI','M');
insert into customer values(2,'AMAN','7777777777','Noida','M');
insert into customer values(3,'NEHA','8585858585','Mumbai','F');
insert into customer values(4,'MEGHA','5689568963','KOLKATA','F');
insert into customer values(5,'PULKIT',2589637412,'Lucknow','M');
-------------------------------------------------------------------------------------
#insert values to Category Table
insert into category values(1,'BOOKS');
insert into category values(2,'GAMES');
insert into category values(3,'GROCERIES');
insert into category values(4,'ELECTRONICS');
insert into category values(5,'CLOTHES');
-----------------------------------------------------------------------------------------------
#insert values to Product table
insert into product values(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into product values(2,'TSHIRT','Size-L with Black,Blue and White Variation',5);
insert into product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor 1TB SSD',4);
insert into product values(4,'OATS','Highly Nutritious from Nestle',3);
insert into product values(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK','1L Toned MILK',3);
insert into product values(7,'BOAT Earphones','1.5Meter long Dolby Atmos',4);
insert into product values(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
insert into product values(9,'Project IGI','compatible with windows 7 and above',2);
insert into product values(10,'Hoddie','Black GUCCI for 13 yrs and above',5);
insert into product values(11,'Rich Dad POOR Dad','Written by RObert Kiyosaki',1);
insert into product values(12,'Train your Brain','By Shireen Stephen',1);
----------------------------------------------------------------------------
#inserting values to supplier priing table
insert into supplier_pricing values (1,1,2,1500);
insert into supplier_pricing values (2,3,5,30000);
insert into supplier_pricing values (3,5,1,3000);
insert into supplier_pricing values (4,2,3,2500);
insert into supplier_pricing values (5,4,1,1000);
insert into supplier_pricing values (6,12,2,1500);
insert into supplier_pricing values (7,12,5,789);
insert into supplier_pricing values (8,3,1,31000);
insert into supplier_pricing values (9,1,3,1450);
insert into supplier_pricing values (10,4,1,1000);
insert into supplier_pricing values (11,7,2,1500);
insert into supplier_pricing values (12,7,5,30000);
insert into supplier_pricing values (13,6,1,3000);
insert into supplier_pricing values (14,2,3,99);
insert into supplier_pricing values (15,4,1,1000);
insert into supplier_pricing values (16,4,4,1000);
---------------------------------------------------------------
#inserting values to Orders Table
insert into Orders values(101,1500,'2021-10-06',2,1);
insert into Orders values(102,1000,'2021-10-12',3,5);
insert into Orders values(103,30000,'2021-09-16',5,2);
insert into Orders values(104,1500,'2021-10-05',1,1);
insert into Orders values(105,3000,'2021-08-16',4,3);
insert into Orders values(106,1450,'2021-08-18',1,9);
insert into Orders values(107,789,'2021-09-01',3,7);
insert into Orders values(108,780,'2021-09-07',5,6);
insert into Orders values(109,3000,'2021-01-10',5,3);
insert into Orders values(110,2500,'2021-09-10',2,4);
insert into Orders values(111,1000,'2021-09-15',4,5);
insert into Orders values(112,789,'2021-09-16',4,7);
insert into Orders values(113,31000,'2021-09-16',1,8);
insert into Orders values(114,1000,'2021-09-16',3,5);
insert into Orders values(115,3000,'2021-09-16',5,3);
insert into Orders values(116,99,'2021-09-17',2,14);
-------------------------------------------------------------------------------------------
#inserting Values to rating table

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,5);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,5);
insert into rating values(8,108,2);
insert into rating values(9,109,4);
insert into rating values(10,110,3);
insert into rating values(11,111,5);
insert into rating values(12,112,2);
insert into rating values(13,113,4);
insert into rating values(14,114,3);
insert into rating values(15,115,5);
insert into rating values(16,116,2);

--------------------------------------------------------------------------------------------------------
#Queries 
# question:3
select C.cus_gender,count(cus_name) from customer C
join Orders O on C.cus_id = O.cust_id
where ord_amount >= 3000
Group by C.cus_gender;
---------------------------------------------------------------
# question: 4
Select O.Ord_id,P.pro_name,O.ord_amount,O.cust_id from Orders O
Join supplier_pricing SP on O.price_id =SP.pricing_id
join product P on SP.prod_id = P.pro_id
where O.cust_id = 2;
------------------------------------------------------------------------------
#question 5
Select * from supplier_pricing
where  supply_id in (select supply_id from supplier_pricing group by supply_id having count(supply_id)>1);
------------------------------------------------------------------------------------------------------------
#question 6
Select C.cat_id,C.cat_name,P.pro_name As 'Product Name', P.pro_id,min(SP.supp_price) as 'Minimum Price'
from category C
join product P on C.cat_id = P.category_id
join supplier_pricing SP on P.pro_id = SP.prod_id
Group by cat_name
order by cat_id;
-------------------------------------------------------------------------------------------------
#question 7
Select P.pro_id,P.pro_name from product P
join supplier_pricing SP on SP.prod_id = P.pro_id
join Orders O on SP.pricing_id = O.price_id
where O.ord_date >= '2021-10-05'
order by P.pro_id;
--------------------------------------------------------------------------------------------------
#question 8
Select cus_name,cus_gender from Customer
where cus_name like "A%" or cus_name like "%A";
------------------------------------------------------------------------------------------------------
#question 9
DELIMITER &&
CREATE procedure supplier_rating_display()
BEGIN
Select S.Supp_id, S.supp_name,avg(rat_ratstars),
	case when avg(rat_ratstars) = 5 then "Excellent service"
		when avg(rat_ratstars) >=4 then "Good service"
        when avg(rat_ratstars) >=2 then "Average service"
		else  'Poor Service'
    END as Type_of_Service
    from supplier S
    join supplier_pricing SP on S.Supp_id = SP.supply_id
    join Orders O on SP.pricing_id = O.price_id
    join rating R on O.Ord_id  = R.ord_id
    group by S.Supp_id
    order by S.Supp_id;
    END &&
DELIMITER ;
-----------------------------------------------------------------------------------------------------------------------
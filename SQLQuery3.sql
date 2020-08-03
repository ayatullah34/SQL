select p.ProductName,P.UnitsInStock*p.UnitPrice as total FROM Products p;

select p.ProductName +'-' +p.QuantityPerUnit from products p;

select 'engin demir' as eðitmen

select 9*8 as sonuç

select * from products where UnitsInStock=0 and UnitsOnOrder>0

select * from products where UnitsInStock=0 or UnitsOnOrder=0

select * from Products where not ProductName='Chai' and UnitsInStock=0;

select * from Products order by ProductName

select * from Products order by UnitPrice desc

select * from Products order by UnitPrice asc

select * from Products order by UnitPrice,ProductName

select * from Products order by UnitPrice asc,ProductName desc

select * from Products where ProductName like 'ch%' 

select * from Products where ProductName like '%a' 

select * from Products where ProductName like '%ch%' 

select * from Products where UnitPrice between 10 and 20 order by UnitPrice

select * from Products where CategoryID in(1,2)

select count(*) as ürünsayýsý from Products

select count(productname) from Products  

select count(*) from Customers

select count(Region) from Customers

select min(UnitPrice) from Products 

select max(UnitPrice) from Products 

select sum(UnitPrice) from Products 

select avg(UnitPrice) from Products 

select sum(UnitPrice*Quantity) as kazanç from [Order Details] 

select RAND() 

select left(ProductName,3) from Products 

select right(ProductName,3) from Products 

select len(ProductName) from Products 

select productname,len(ProductName) as karakter from Products 

select lower(ProductName) from Products 

select upper(ProductName) from Products 

select lTRIM('   engin demir   ')

select * from products where ltrim(productname)= 'chai'

select * from products where len(productname)>10

select reverse(productname) from products 

select charindex('n','engin demir',1)

select charindex('n','engin demir',1)

select productname from products where charindex(' ',ProductName,1)>0

select productname from products where charindex('anton',ProductName,1)>0

select replace('engin demir',' ','_') 

select replace(productname,' ','_') from Products

select substring('engin demir',1,5) 

select substring(productname,1,5) from Products

select ascii('A')

select ascii(3)

select char(65)

select distinct country,City from Customers order by country

select country,count(*) from Customers group by country

select country,city,count(*) from Customers group by country,city

select country,city,count(*) from Customers group by country,city having count(*)>1


select country,city,count(*) from Customers group by country,city having count(*)>1 order by country


select country,city,count(*) from Customers where city<> 'London'group by country,city having count(*)>1


select * from products inner join Categories 
on Products.CategoryID=Categories.CategoryID


select * from products inner join Categories 
on Products.CategoryID=Categories.CategoryID 
where Products.UnitPrice>20 
order by Categories.CategoryID


select * from products p inner join [Order Details] od
on p.ProductID=od.ProductID
inner join Orders o
on o.OrderID=od.OrderID


select p.ProductName,o.OrderDate,od.Quantity*od.UnitPrice as total from products p inner join [Order Details] od
on p.ProductID=od.ProductID
inner join Orders o
on o.OrderID=od.OrderID
order by p.ProductName,o.OrderDate


select * from products p left join [Order Details] od
on p.ProductID=od.ProductID
where od.ProductID is null


select * from Customers c inner join Orders o   --830 sonuç
on c.CustomerID=o.CustomerID


select * from Customers c left join Orders o  --832 satýþ yapýlmayanlarda dahil id leri eþit olmayanlarda eklendi
on c.CustomerID=o.CustomerID


select * from Customers c left join Orders o  --satýþ yapýlmayan müþteri
on c.CustomerID=o.CustomerID
where o.CustomerID is null
--soldaki tabloda olup saðdaki tabloda olmayanlarý da getir (left join)



select * from   Orders o right join Customers c  --saðdaki tabloda olup soldaki tabloda olmayanlarý da getir (right join)
on c.CustomerID=o.CustomerID
where o.CustomerID is null


select c.ContactName,c.CustomerID from   Orders o right join Customers c  
on c.CustomerID=o.CustomerID
where o.CustomerID is null


select * from   Orders o full join Customers c  --hem left hem de right join sorgularýnýda getirir bütün veriler dahil eþleþme þartý yok
on c.CustomerID=o.CustomerID


select e.LastName,e.FirstName from Employees e left join Orders o --WORKSHOP 2 satýþ yapamayan eleman var mý varsa kimler?
on e.EmployeeID=o.EmployeeID
where o.EmployeeID is null


select p.ProductName,COUNT(*) as adet from Products p inner join [Order Details] od --WORKSHOP 3 hangi üründen kaç tane satmýþýz?
on p.ProductID=od.ProductID group by ProductName order by p.ProductName


select p.ProductName,COUNT(*) as adet from Products p inner join [Order Details] od --WORKSHOP 3 kampanyalý olarak kaç tane satmýþýz?
on p.ProductID=od.ProductID 
where od.Discount>0
group by ProductName order by p.ProductName


select c.CategoryName,COUNT(*) as adet from Products p inner join Categories c --WORKSHOP 4 hangi kategoriden kaç tane satmýþýz?
on p.CategoryID=c.CategoryID
inner join [Order Details] od
on p.ProductID=od.ProductID
group by c.CategoryName order by c.CategoryName


select e2.FirstName+ ' '+e2.LastName as Personel,e1.FirstName+ ' '+e1.LastName as Üstü from Employees e1 right join Employees e2 --WORKSHOP 5 çalýþanlarýn sorumlu olduklarý(repost to) üstlerini bulunuz
on e1.EmployeeID=e2.ReportsTo


insert into Categories(CategoryName,Description)
values('test category','test category Description')


insert into [Order Details] values(10248,12,12,10,0) --kolon belirtmezsek her kolona deðer vermeliyiz


--update Categories set CategoryName=' ' --tüm kolonu boþluk yapar


update Categories set CategoryName='test category 2' where CategoryID=9


update Categories set CategoryName='test category 2',Description='test category 2 description' where CategoryID=9


delete from Categories where CategoryID=9


select * from CustomersWork


insert into CustomersWork(CustomerID,CompanyName,ContactName) --Customer tablosundan veri çekmeye yarýyo yeni tablomuza
select CustomerID,CompanyName,ContactName from Customers


delete from CustomersWork


insert into CustomersWork(CustomerID,CompanyName,ContactName) 
select CustomerID,CompanyName,ContactName from Customers
where ContactName like'%en%'


update Customers set CompanyName=CustomersWork.CompanyName
from
Customers inner join CustomersWork
on Customers.CustomerID=CustomersWork.CustomerID
where CustomersWork.CompanyName like'%test%'


delete Customers from Customers inner join CustomersWork
on Customers.CustomerID=CustomersWork.CustomerID
where CustomersWork.CompanyName like'%test%'


union --iki tabloyu alt alta getirir
select CustomerID,CompanyName,ContactName from Customers
union -- kolon sayýlarý ayný olmalý ayný varsa bir kere getirir union all dersek hepsi gelir 
select * from CustomersWork
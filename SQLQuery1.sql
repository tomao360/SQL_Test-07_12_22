--Q1
select * from Products 
where UnitPrice between 30 and 40

--Q2
select P.*, C.CategoryName from Products P
inner join Categories C on C.CategoryID = P.CategoryID
where C.CategoryID = 2

--Q3
select P.ProductName from Products P
inner join Categories C on C.CategoryID = P.CategoryID
where C.Description like '%S%'

--Q4
select distinct P.ProductName from Products P
inner join [Order Details] OD on OD.ProductID = P.ProductID
inner join Orders O on O.OrderID = OD.OrderID
inner join Customers C on C.CustomerID = O.CustomerID
where C.CustomerID = 'ALFKI'

--Q5
select OrderID from Orders
where ShipCity = 'London' or ShipCountry = 'Brazil'

--Q6
select C.CustomerID from Customers C
inner join Orders O on O.CustomerID = C.CustomerID
inner join Shippers S on S.ShipperID = O.ShipVia
where S.CompanyName = 'Federal Shipping'

--Q7
create procedure GetProductsByOrderID
	@param1 int
as 
begin
	select P.ProductName from Products P
	inner join [Order Details] OD on OD.ProductID = P.ProductID
	where OD.OrderID = @param1

	select SUM(P.UnitPrice) as SumPrice from Products P
	inner join [Order Details] OD on OD.ProductID = P.ProductID
	where OD.OrderID = @param1
end

exec GetProductsByOrderID @param1 = 10600
drop procedure GetProductsByOrderID

--Q8
select CustomerID, EmployeeID, ShipVia, Freight, ShipName, ShipAddress,
ShipCity, ShipRegion, ShipPostalCode, ShipCountry
from Orders
where CustomerID like 'B%' and (EmployeeID = 2 or EmployeeID = 5) and ShipVia = 1

--Q9
select OD.*, O.OrderDate, O.EmployeeID, O.CustomerID from [Order Details] OD, Orders O
where O.CustomerID = 'VINET' and OD.OrderID = 10248
order by UnitPrice ASC, O.EmployeeID ASC

--Q10
select CustomerID, Region, Country from Customers
where Country = 'France' or Country = 'Canada'


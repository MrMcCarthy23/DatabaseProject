# Running from the shell/**789\9

mysql -h localhost -u root

MariaDB [(none)]> show databases;

SHOW DATABASES;
USE database_name_here;

SHOW TABLES
DESC table_name_here
SELECT * FROM table_name_here


#1. Name clients that own properties in South West regions working with corporate account type.

SELECT distinct ClientName 
FROM clients NATURAL JOIN owns Natural join properties NATURAL JOIN workswith natural join accounts 
WHERE clients.ssn=owns.clientssn and workswith.clientssn=clients.ssn and RegionName = 'South West' AND AccountType= 'Corporate';

#2. List the propertYID, price and state of properties built in the North East Region of the United States of America.

SELECT ID, Price, PropertyState FROM properties WHERE properties.RegionName = 'North East';


#3. List clients who have a principal higher than 700,000.

SELECT DISTINCT ClientName, Principal 
FROM clients NATURAL JOIN loans 
WHERE LoanID > 0 AND Principal > 700000 AND Clients.LoanID = loans.ID;

#4. List Home Types loaned to clients with interest rate equl to 0.174

SELECT distinct HomeType 
FROM clients, loans, properties, owns 
WHERE Rate = 0.174 AND Clients.LoanID = loans.ID AND properties.ID = owns.PropertyID AND owns.ClientSSN = clients.SSN;

#5. Name, ID, and Commission of employees working with clients who own properties in
more than two states.

select distinct id, employeename, commission from workswith w, clients c, employees e where c.SSN=w.clientSSN and w.employeeid=e.id and c.SSN in (SELECT DISTINCT SSN 
FROM clients NATURAL JOIN properties NATURAL JOIN owns
WHERE owns.ClientSSN = clients.SSN AND owns.PropertyID = properties.ID and transactionstatus!='Pending'
GROUP BY SSN
HAVING COUNT(properties.PropertyState) > 2);

#6. List of properties owned by clients and whose status is sold. 
(Modified to include all clients)

SELECT clients.ClientName AS ClientName, ID AS PropertyId, TransactionStatus
FROM properties NATURAL JOIN owns NATURAL JOIN clients
WHERE TransactionStatus = 'closed' AND properties.ID = owns.PropertyID 
                                   AND owns.ClientSSN = clients.SSN;
								   
#7. List the names of managers who also works with clients who own properties

select employeename from employees where id in(select distinct managerid from workswith w, clients c, employees e where c.SSN=w.clientSSN and w.employeeid=e.id and c.SSN in (SELECT DISTINCT SSN 
FROM clients NATURAL JOIN properties NATURAL JOIN owns
WHERE owns.ClientSSN = clients.SSN AND owns.PropertyID = properties.ID and transactionstatus!='Pending'
GROUP BY SSN));

#8. Return climates available where properties have greater than 1000 sqft, build more recently than 1950 and have price lower than $350000

select distinct climate from properties Natural join regions where squarefeet <= 1000 and yearbuilt > 1950 and price < 350000; 


Modifications

#1. Add attribute ManagerClearance to relation Employees

Alter table Employees add ManagerClearance varchar(20);

#2. Delete attribute from the relations

alter table employees drop ManagerClearance;

#3. Populate relations with values

INSERT INTO Properties VALUES (12345678, 'Apartment', 1870, '23 Green Rd. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 179000, 'Coral', 'FL', 33904, 2, 3, 1440.09, 0, 'South East');

#4. Delete a property with property id.

delete from properties where id=12345678;

#5. Update or make corrections on wrong insertions into a relation.

Update Employees set managerid=-999 where managerid=id;

update employees set managerid= id where managerid=-999;

#6. Create and drop a relation

create table profiles(
profileid int primary key,
propertyid int references properties(id),
link varchar(200)
);

Drop table profiles;










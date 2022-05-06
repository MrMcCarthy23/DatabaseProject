/* 
   Property Listing Database Report
   Wichita State University
   Introduction to Database Systems

   TEAM 16
   Malaki Simon Nyambutora, A949P843
   Paulina Castaneda, C886F429
   Mark McCarthy, S395E958
   Mannava Murali Krishna, Q476H786

   PROPERTY LISTINGS DATABASE DESIGN AND IMPLEMENTATION REPORT (Project Phase 2)

   1. We implemented the datababase schema using MySql Database,
      which has a slightly different syntax from Derby.
   2. We populated the database as shown in the attached document.

 */

  # Database Schema in MySql

CREATE TABLE Properties(
    ID INT PRIMARY KEY,
    HomeType VARCHAR(40) NOT NULL,
    YearBuilt INT(4) CHECK
        (YearBuilt > 1800),
        PropertyAddress VARCHAR(60) NOT NULL,
        PropertyDescription VARCHAR(500),
        Price DECIMAL(16, 2) NOT NULL,
        City VARCHAR(30),
        PropertyState VARCHAR(2)
    CHECK
        (
            PropertyState IN(
                "AK",
                "AL",
                "AR",
                "AZ",
                "CA",
                "CO",
                "CT",
                "DE",
                "FL",
                "GA",
                "HI",
                "IA",
                "ID",
                "IL",
                "IN",
                "KS",
                "KY",
                "LA",
                "MA",
                "MD",
                "ME",
                "MI",
                "MN",
                "MO",
                "MS",
                "MT",
                "NC",
                "ND",
                "NE",
                "NH",
                "NJ",
                "NM",
                "NV",
                "NY",
                "OH",
                "OK",
                "OR",
                "PA",
                "RI",
                "SC",
                "SD",
                "TN",
                "TX",
                "UT",
                "VA",
                "VT",
                "WA",
                "WI",
                "WV",
                "WY"
            )
        ),
        Zip INT(5),
        Bed INT,
        Bath INT,
        SquareFeet INT,
        LotSize INT,
        RegionName VARCHAR(20) REFERENCES Regions(RegionName) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Regions(
    RegionName VARCHAR(20) PRIMARY KEY,
    Climate VARCHAR(20),
    Elevation INT CHECK
        (
            (Elevation > 0) AND(Elevation < 20000)
        ));

CREATE TABLE Owns(
        ClientSSN INT(9) REFERENCES CLIENTS(SSN) ON UPDATE CASCADE ON DELETE CASCADE,
        ProrertyID INT REFERENCES Properties(ID) ON UPDATE CASCADE ON DELETE CASCADE,
        TransactionType CHAR NOT NULL CHECK
            (TransactionType IN('B', 'S')),
            TransactionStatus VARCHAR(7) NOT NULL
        CHECK
            (
                TransactionStatus IN('Open', 'Closed', 'Pending')
            ),
            PRIMARY KEY(ClientSSN, ProrertyID)
    );

CREATE TABLE CLIENTS(
    SSN INT(9) PRIMARY KEY,
    ClientName VARCHAR(60) NOT NULL,
    LoanID INT REFERENCES Loans(ID) ON UPDATE CASCADE ON DELETE CASCADE
); 

CREATE TABLE Loans(
    ID INT PRIMARY KEY,
    Principal DECIMAL(16, 2) NOT NULL,
    Rate DECIMAL(4, 3) NOT NULL CHECK
        (Rate < 6.000)
);

CREATE TABLE WorksWith(
    ClientSSN INT(9) REFERENCES CLIENTS(SSN) ON UPDATE CASCADE ON DELETE CASCADE,
    EmployeeID INT REFERENCES Employees(ID) ON UPDATE SET NULL ON DELETE SET NULL,
    AccountNumber INT REFERENCES Accounts(AccountNumber) ON UPDATE SET NULL ON DELETE SET NULL,
    PRIMARY KEY(
        ClientSSN,
        EmployeeID,
        AccountNumber
    )
);

CREATE TABLE Accounts(
    AccountNumber INT PRIMARY KEY,
    AccountType VARCHAR(20) NOT NULL
);

 CREATE TABLE Employees(
    ID INT PRIMARY KEY,
    EmployeeName VARCHAR(60) NOT NULL,
    Commission DECIMAL(4, 3),
    Salary DECIMAL(16, 2) NOT NULL,
    ManagerID INT REFERENCES Employees(ID)
);

    # Populating the database with data
INSERT INTO Properties VALUES (32861341, 'Townhome', 1828, '16 Jennings Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 468000, 'Seattle', 'WA', 98144, 0, 1, 1613.31, 2744.7, 'West');
INSERT INTO Properties VALUES (16225252, 'Apartment', 1811, '83 Roosevelt Lane ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 215000, 'Medina', 'OH', 44256, 0, 2, 1137.58, 0, 'Midwest');
INSERT INTO Properties VALUES (38443341, 'Apartment', 1870, '23 Green Rd. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 179000, 'Coral', 'FL', 33904, 2, 3, 1440.09, 0, 'South East');
INSERT INTO Properties VALUES (36274457, 'House', 1831, '292 Stonybrook Street ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 484000, 'Watertown', 'MA', 2472, 4, 4, 1290.83, 0, 'North East');
INSERT INTO Properties VALUES (74115815, 'Apartment', 1889, '940 Golden Star Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 463000, 'Winder', 'GA', 30680, 3, 3, 1203.27, 3557.24, 'South East');
INSERT INTO Properties VALUES (7828464, 'Townhome', 1858, '37 Lincoln Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 279000, 'Bradenton', 'FL', 34203, 1, 4, 789.83, 0, 'South East');
INSERT INTO Properties VALUES (22885440, 'Commercial', 1828, '495A Virginia St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 492000, 'Andover', 'MA', 1810, 2, 1, 601.25, 0, 'North East');
INSERT INTO Properties VALUES (38366132, 'Apartment', 1914, '850 Marshall Road ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 111000, 'Fairborn', 'OH', 45324, 1, 4, 1552.68, 681.48, 'Midwest');
INSERT INTO Properties VALUES (41775632, 'House', 1878, '41 N. Lakewood Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 107000, 'Elizabethton', 'TN', 37643, 0, 3, 718.87, 0, 'South East');
INSERT INTO Properties VALUES (16126054, 'Apartment', 1964, '5 W. Marsh Circle ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 419000, 'Mokena', 'IL', 60448, 1, 2, 3695.27, 7535.81, 'Midwest');
INSERT INTO Properties VALUES (13737682, 'House', 1833, '86 Studebaker Lane ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 484000, 'Harbor', 'FL', 34683, 3, 3, 865.77, 0, 'South East');
INSERT INTO Properties VALUES (74824436, 'Condo', 1908, '20 Euclid St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 270000, 'Park', 'IL', 60035, 3, 3, 1001.96, 3253.07, 'Midwest');
INSERT INTO Properties VALUES (38811816, 'Condo', 1981, '8 Rosewood Court ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 358000, 'Roswell', 'GA', 30075, 2, 4, 735.18, 0, 'South East');
INSERT INTO Properties VALUES (15504255, 'Apartment', 2006, '9783 West Roberts Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 358000, 'Tewksbury', 'MA', 1876, 2, 3, 1294.7, 0, 'North East');
INSERT INTO Properties VALUES (64238273, 'Townhome', 1875, '196 Bellevue St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 87000, 'City', 'NJ', 7087, 0, 1, 1311.22, 3437.96, 'North East');
INSERT INTO Properties VALUES (42625311, 'Apartment', 1855, '31 Illinois Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 69000, 'Lake', 'MS', 38637, 1, 3, 970.5, 0, 'South East');
INSERT INTO Properties VALUES (17852050, 'Commercial', 1974, '513 Thompson Street ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 139000, 'Onalaska', 'WI', 54650, 1, 3, 1157.89, 0, 'Midwest');
INSERT INTO Properties VALUES (28442847, 'Commercial', 1828, '13 Bellevue Lane East ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 410000, 'Hartford', 'CT', 6118, 3, 2, 705.24, 0, 'North East');
INSERT INTO Properties VALUES (7481404, 'Apartment', 1904, '8624 High Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 468000, 'Libertyville', 'IL', 60048, 4, 4, 1184.81, 0, 'Midwest');
INSERT INTO Properties VALUES (12215517, 'Condo', 1881, '715 Newcastle Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 62000, 'Nazareth', 'PA', 18064, 3, 1, 891.57, 3547.29, 'North East');
INSERT INTO Properties VALUES (62330265, 'Condo', 1853, '9180 Bank Court ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 488000, 'Zion', 'IL', 60099, 2, 3, 625.02, 0, 'Midwest');
INSERT INTO Properties VALUES (28075735, 'Apartment', 1930, '27 Chapel St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 446000, 'Hamtramck', 'MI', 48212, 2, 4, 1005.61, 0, 'Midwest');
INSERT INTO Properties VALUES (33356672, 'Commercial', 1927, '659 Grove Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 129000, 'Kernersville', 'NC', 27284, 4, 2, 923.32, 5989.2, 'South East');
INSERT INTO Properties VALUES (51137616, 'House', 2005, '9084 Bayberry Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 391000, 'Memphis', 'TN', 38106, 4, 2, 3636.31, 4774.78, 'South East');
INSERT INTO Properties VALUES (60530152, 'Condo', 1827, '293 Cactus Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 66000, 'Westminster', 'MD', 21157, 1, 1, 642.07, 0, 'North East');
INSERT INTO Properties VALUES (36323205, 'Townhome', 1982, '13 W. Marconi St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 299000, 'Powell', 'TN', 37849, 3, 1, 985.76, 0, 'South East');
INSERT INTO Properties VALUES (38712605, 'Condo', 1942, '253 South Theatre Dr. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 313000, 'Teaneck', 'NJ', 7666, 4, 2, 561.74, 0, 'North East');
INSERT INTO Properties VALUES (13828643, 'Commercial', 1814, '536 N. Vernon Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 210000, 'Owensboro', 'KY', 42301, 1, 1, 921.54, 0, 'South East');
INSERT INTO Properties VALUES (31865276, 'Condo', 1882, '3 Durham Court ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 124000, 'Littleton', 'CO', 80123, 1, 2, 791.16, 5815.65, 'West');
INSERT INTO Properties VALUES (2502436, 'House', 1823, '7332 Shub Farm Lane ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 102000, 'Macungie', 'PA', 18062, 4, 1, 878.95, 4135.92, 'North East');
INSERT INTO Properties VALUES (45760310, 'House', 1924, '8623 W. Maiden Dr. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 106000, 'Springfield', 'PA', 19064, 0, 4, 1306.92, 0, 'North East');
INSERT INTO Properties VALUES (14887173, 'Commercial', 2003, '14 Sugar Lane ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 358000, 'Diego', 'CA', 92111, 0, 3, 540.26, 0, 'West');
INSERT INTO Properties VALUES (71288821, 'Commercial', 1835, '9778 North St Louis Lane ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 154000, 'Stuart', 'FL', 34997, 0, 2, 900.76, 4101.8, 'South East');
INSERT INTO Properties VALUES (24536477, 'Commercial', 1992, '9727 Alton Street ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 203000, 'Windsor', 'CT', 6095, 2, 4, 540.88, 0, 'North East');
INSERT INTO Properties VALUES (7036238, 'Condo', 1899, '29 Rockville Road ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 359000, 'Ridgefield', 'CT', 6877, 3, 1, 954.72, 0, 'North East');
INSERT INTO Properties VALUES (27513031, 'House', 1870, '235 Elmwood St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 246000, 'Inlet', 'SC', 29576, 4, 4, 3604.11, 6395.49, 'South East');
INSERT INTO Properties VALUES (64540447, 'Condo', 1928, '826 East Union Lane ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 230000, 'Parkersburg', 'WV', 26101, 0, 4, 794.82, 0, 'South East');
INSERT INTO Properties VALUES (37176282, 'House', 2003, '48 Magnolia Court ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 249000, 'Mcallen', 'TX', 78501, 1, 3, 818.03, 896.35, 'South West');
INSERT INTO Properties VALUES (35601457, 'Condo', 1925, '180 Fieldstone Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 283000, 'Merrick', 'NY', 11566, 1, 4, 1318.57, 0, 'North East');
INSERT INTO Properties VALUES (26044172, 'Apartment', 1967, '255 Arlington Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 106000, 'Somerset', 'NJ', 8873, 4, 2, 1331.24, 2968.87, 'North East');
INSERT INTO Properties VALUES (73351301, 'House', 1926, '944 North Lilac Street ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 382000, 'Hill', 'NJ', 8003, 4, 3, 931.57, 0, 'North East');
INSERT INTO Properties VALUES (34834133, 'House', 1902, '5 South Linden Street ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 191000, 'Pere', 'WI', 54115, 2, 1, 1988.11, 5969.5, 'Midwest');
INSERT INTO Properties VALUES (38048254, 'Condo', 1842, '412 Lakeshore Drive ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 300000, 'Honolulu', 'HI', 96815, 4, 4, 1358.13, 8216.03, 'West');
INSERT INTO Properties VALUES (31220301, 'Commercial', 1953, '884 Delaware Street ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 58000, 'Thornton', 'CO', 80241, 4, 4, 2567.6, 5474.09, 'West');
INSERT INTO Properties VALUES (85110233, 'Condo', 2009, '7738 Beacon St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 345000, 'Dorchester', 'MA', 2125, 1, 1, 756.78, 0, 'North East');
INSERT INTO Properties VALUES (33136555, 'House', 1885, '546 South Lake Forest St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 442000, 'Leominster', 'MA', 1453, 3, 1, 832.45, 1374.31, 'North East');
INSERT INTO Properties VALUES (28724332, 'Townhome', 1850, '916 SE. Greenview Ave. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 113000, 'Seymour', 'IN', 47274, 2, 1, 922.86, 0, 'Midwest');
INSERT INTO Properties VALUES (33370781, 'Apartment', 1822, '394 Airport St. West ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 406000, 'Orange', 'NJ', 7052, 3, 4, 1180.28, 0, 'North East');
INSERT INTO Properties VALUES (17658216, 'Commercial', 1986, '43 Ridgeview Dr. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 254000, 'Urbandale', 'IA', 50322, 2, 1, 1395.22, 4344.59, 'Midwest');
INSERT INTO Properties VALUES (87087281, 'Condo', 1883, '33 Meadow St. ', ' arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description -  arbitrary description - ', 236000, 'Camas', 'WA', 98607, 1, 1, 591.94, 0, 'West');

INSERT INTO Regions VALUES ('North East','Moist Subcontinental', 4500);
INSERT INTO Regions VALUES ('Midwest','Moist Subtropical', 1800);
INSERT INTO Regions VALUES ('South East','Tropical', 1250);
INSERT INTO Regions VALUES ('South West','Dry', 1350);
INSERT INTO Regions VALUES ('West','Dry', 2500);

INSERT INTO Owns VALUES (123466360, 32861341, 'B', 'Open');
INSERT INTO Owns VALUES (580081822, 16225252, 'B', 'Pending');
INSERT INTO Owns VALUES (681002264, 38443341, 'B', 'Open');
INSERT INTO Owns VALUES (880063278, 36274457, 'B', 'Closed');
INSERT INTO Owns VALUES (720552057, 74115815, 'S', 'Open');
INSERT INTO Owns VALUES (414238107, 7828464, 'B', 'Closed');
INSERT INTO Owns VALUES (738480462, 22885440, 'S', 'Closed');
INSERT INTO Owns VALUES (580387, 38366132, 'S', 'Pending');
INSERT INTO Owns VALUES (613114788, 41775632, 'S', 'Open');
INSERT INTO Owns VALUES (145487001, 16126054, 'B', 'Open');
INSERT INTO Owns VALUES (542736848, 13737682, 'S', 'Closed');
INSERT INTO Owns VALUES (675453177, 74824436, 'B', 'Closed');
INSERT INTO Owns VALUES (613114788, 38811816, 'B', 'Open');
INSERT INTO Owns VALUES (62215416, 15504255, 'S', 'Pending');
INSERT INTO Owns VALUES (613114788, 64238273, 'S', 'Pending');
INSERT INTO Owns VALUES (627543758, 42625311, 'S', 'Closed');
INSERT INTO Owns VALUES (114131731, 17852050, 'S', 'Pending');
INSERT INTO Owns VALUES (183582381, 28442847, 'B', 'Closed');
INSERT INTO Owns VALUES (414238107, 7481404, 'S', 'Open');
INSERT INTO Owns VALUES (145487001, 12215517, 'B', 'Closed');
INSERT INTO Owns VALUES (580081822, 62330265, 'S', 'Open');
INSERT INTO Owns VALUES (633106355, 28075735, 'S', 'Pending');
INSERT INTO Owns VALUES (627543758, 33356672, 'B', 'Pending');
INSERT INTO Owns VALUES (787343238, 51137616, 'S', 'Closed');
INSERT INTO Owns VALUES (705661487, 60530152, 'S', 'Open');
INSERT INTO Owns VALUES (675453177, 36323205, 'B', 'Pending');
INSERT INTO Owns VALUES (681002264, 38712605, 'S', 'Closed');
INSERT INTO Owns VALUES (576251860, 13828643, 'B', 'Pending');
INSERT INTO Owns VALUES (720552057, 31865276, 'S', 'Pending');
INSERT INTO Owns VALUES (355573434, 2502436, 'B', 'Open');
INSERT INTO Owns VALUES (102006427, 45760310, 'S', 'Pending');
INSERT INTO Owns VALUES (518384462, 14887173, 'B', 'Closed');
INSERT INTO Owns VALUES (602210544, 71288821, 'S', 'Pending');
INSERT INTO Owns VALUES (684011231, 24536477, 'B', 'Closed');
INSERT INTO Owns VALUES (875630270, 7036238, 'S', 'Closed');
INSERT INTO Owns VALUES (343817174, 27513031, 'B', 'Pending');
INSERT INTO Owns VALUES (547021335, 64540447, 'B', 'Pending');
INSERT INTO Owns VALUES (6711881, 37176282, 'B', 'Open');
INSERT INTO Owns VALUES (675453177, 35601457, 'B', 'Closed');
INSERT INTO Owns VALUES (355573434, 26044172, 'S', 'Pending');
INSERT INTO Owns VALUES (705661487, 73351301, 'S', 'Pending');
INSERT INTO Owns VALUES (684011231, 34834133, 'S', 'Pending');
INSERT INTO Owns VALUES (6711881, 38048254, 'B', 'Pending');
INSERT INTO Owns VALUES (220334386, 31220301, 'S', 'Open');
INSERT INTO Owns VALUES (227133400, 85110233, 'S', 'Pending');
INSERT INTO Owns VALUES (633106355, 33136555, 'B', 'Closed');
INSERT INTO Owns VALUES (880063278, 28724332, 'B', 'Open');
INSERT INTO Owns VALUES (738480462, 33370781, 'S', 'Closed');
INSERT INTO Owns VALUES (145487001, 17658216, 'S', 'Open');
INSERT INTO Owns VALUES (227133400, 87087281, 'B', 'Closed');

INSERT INTO Clients VALUES (681002264, 'Sophia Smith', 307152);
INSERT INTO Clients VALUES (271062665, 'Liam Johnson', 780241);
INSERT INTO Clients VALUES (580387, 'Olivia Williams', -1);
INSERT INTO Clients VALUES (613114788, 'Noah Brown', -1);
INSERT INTO Clients VALUES (280048655, 'Riley Jones', -1);
INSERT INTO Clients VALUES (874074825, 'Jackson Garcia', -1);
INSERT INTO Clients VALUES (627543758, 'Emma Miller', -1);
INSERT INTO Clients VALUES (602210544, 'Aiden Davis', 838113);
INSERT INTO Clients VALUES (675453177, 'Ava Rodriguez', -1);
INSERT INTO Clients VALUES (627651630, 'Elijah Martinez', 5602);
INSERT INTO Clients VALUES (518384462, 'Isabella Hernandez', 784128);
INSERT INTO Clients VALUES (550074418, 'Grayson Lopez', -1);
INSERT INTO Clients VALUES (22677386, 'Aria Gonzalez', 574207);
INSERT INTO Clients VALUES (447347430, 'Lucas Wilson', -1);
INSERT INTO Clients VALUES (705661487, 'Aaliyah Anderson', -1);
INSERT INTO Clients VALUES (6711881, 'Oliver Thomas', -1);
INSERT INTO Clients VALUES (227133400, 'Amelia Taylor', -1);
INSERT INTO Clients VALUES (772088108, 'Caden Moore', 838113);
INSERT INTO Clients VALUES (68387567, 'Mia Jackson', 643547);
INSERT INTO Clients VALUES (62215416, 'Mateo Martin', -1);
INSERT INTO Clients VALUES (414142108, 'Layla Lee', -1);
INSERT INTO Clients VALUES (183582381, 'Muhammad Perez', -1);
INSERT INTO Clients VALUES (343817174, 'Zoe Thompson', -1);
INSERT INTO Clients VALUES (781526803, 'Mason White', 484886);
INSERT INTO Clients VALUES (208851554, 'Camilla Harris', -1);
INSERT INTO Clients VALUES (247072076, 'Carter Sanchez', -1);
INSERT INTO Clients VALUES (684011231, 'Charlotte Clark', -1);
INSERT INTO Clients VALUES (658206257, 'Jayden Ramirez', -1);
INSERT INTO Clients VALUES (488441772, 'Eliana Lewis', 784128);
INSERT INTO Clients VALUES (123466360, 'Ethan Robinson', -1);
INSERT INTO Clients VALUES (738480462, 'Mila Walker', -1);
INSERT INTO Clients VALUES (542736848, 'Sebastian Young', 307152);
INSERT INTO Clients VALUES (114131731, 'Everly Allen', 5602);
INSERT INTO Clients VALUES (576251860, 'James King', -1);
INSERT INTO Clients VALUES (145487001, 'Luna Wright', 781854);
INSERT INTO Clients VALUES (580081822, 'Michael Scott', 307152);
INSERT INTO Clients VALUES (102006427, 'Avery Torres', -1);
INSERT INTO Clients VALUES (261100762, 'Benjamin Nguyen', 484886);
INSERT INTO Clients VALUES (633106355, 'Evelyn Hill', 771461);
INSERT INTO Clients VALUES (875630270, 'Logan Flores', 643547);
INSERT INTO Clients VALUES (414238107, 'Harper Green', -1);
INSERT INTO Clients VALUES (787343238, 'Leo Adams', -1);
INSERT INTO Clients VALUES (384133546, 'Lily Nelson', 767165);
INSERT INTO Clients VALUES (220334386, 'Luca Baker', -1);
INSERT INTO Clients VALUES (547021335, 'Ella Hall', -1);
INSERT INTO Clients VALUES (720552057, 'Alexander Rivera', 622238);
INSERT INTO Clients VALUES (650578287, 'Gianna Campbell', -1);
INSERT INTO Clients VALUES (355573434, 'Levi Mitchell', -1);
INSERT INTO Clients VALUES (880063278, 'Chloe Carter', -1);
INSERT INTO Clients VALUES (752021130, 'Daniel Roberts', 767165);

INSERT INTO Loans VALUES (784128, 900000, 1.8376);
INSERT INTO Loans VALUES (484886, 450000, 3.2055);
INSERT INTO Loans VALUES (622238, 200000, 1.1366);
INSERT INTO Loans VALUES (385072, 550000, 3.1559);
INSERT INTO Loans VALUES (771461, 900000, 3.2282);
INSERT INTO Loans VALUES (811488, 400000, 0.3029);
INSERT INTO Loans VALUES (307152, 250000, 3.4898);
INSERT INTO Loans VALUES (780241, 450000, 1.4662);
INSERT INTO Loans VALUES (123226, 950000, 0.2895);
INSERT INTO Loans VALUES (73144, 450000, 4.3032);
INSERT INTO Loans VALUES (643547, 800000, 4.138);
INSERT INTO Loans VALUES (252118, 700000, 0.2628);
INSERT INTO Loans VALUES (337287, 350000, 2.9537);
INSERT INTO Loans VALUES (875012, 450000, 2.8577);
INSERT INTO Loans VALUES (620732, 300000, 3.7676);
INSERT INTO Loans VALUES (362474, 700000, 4.7619);
INSERT INTO Loans VALUES (767165, 950000, 4.0395);
INSERT INTO Loans VALUES (765624, 100000, 2.848);
INSERT INTO Loans VALUES (780568, 250000, 2.3394);
INSERT INTO Loans VALUES (838113, 600000, 0.1741);
INSERT INTO Loans VALUES (105047, 450000, 3.3318);
INSERT INTO Loans VALUES (781854, 850000, 1.6725);
INSERT INTO Loans VALUES (5602, 350000, 3.8399);
INSERT INTO Loans VALUES (574207, 500000, 3.0316);
INSERT INTO Loans VALUES (604745, 100000, 4.6234);

INSERT INTO WorksWith VALUES (681002264, 48604, 61256285);
INSERT INTO WorksWith VALUES (271062665, 44712, 48503182);
INSERT INTO WorksWith VALUES (580387, 62453, 26670862);
INSERT INTO WorksWith VALUES (613114788, 22221, 3141450);
INSERT INTO WorksWith VALUES (280048655, 37061, 80655054);
INSERT INTO WorksWith VALUES (874074825, 60404, 42372225);
INSERT INTO WorksWith VALUES (627543758, 54718, 78314315);
INSERT INTO WorksWith VALUES (602210544, 2871, 4558227);
INSERT INTO WorksWith VALUES (675453177, 37474, 85877782);
INSERT INTO WorksWith VALUES (627651630, 60404, 61256285);
INSERT INTO WorksWith VALUES (518384462, 82102, 50117626);
INSERT INTO WorksWith VALUES (550074418, 78562, 4558227);
INSERT INTO WorksWith VALUES (22677386, 62453, 24257577);
INSERT INTO WorksWith VALUES (447347430, 53446, 26670862);
INSERT INTO WorksWith VALUES (705661487, 53446, 4558227);
INSERT INTO WorksWith VALUES (6711881, 12883, 56768373);
INSERT INTO WorksWith VALUES (227133400, 37061, 61256285);
INSERT INTO WorksWith VALUES (772088108, 41221, 46667474);
INSERT INTO WorksWith VALUES (68387567, 34836, 50117626);
INSERT INTO WorksWith VALUES (62215416, 54718, 73485655);
INSERT INTO WorksWith VALUES (414142108, 45652, 30773717);
INSERT INTO WorksWith VALUES (183582381, 50666, 16034876);
INSERT INTO WorksWith VALUES (343817174, 72680, 36363127);
INSERT INTO WorksWith VALUES (781526803, 37061, 65211557);
INSERT INTO WorksWith VALUES (208851554, 2871, 73485655);
INSERT INTO WorksWith VALUES (247072076, 37061, 7774405);
INSERT INTO WorksWith VALUES (684011231, 12883, 31408173);
INSERT INTO WorksWith VALUES (658206257, 72680, 85877782);
INSERT INTO WorksWith VALUES (488441772, 50666, 56768373);
INSERT INTO WorksWith VALUES (123466360, 44712, 85877782);
INSERT INTO WorksWith VALUES (738480462, 48604, 41514020);
INSERT INTO WorksWith VALUES (542736848, 53446, 80655054);
INSERT INTO WorksWith VALUES (114131731, 60404, 84504082);
INSERT INTO WorksWith VALUES (576251860, 37474, 30773717);
INSERT INTO WorksWith VALUES (145487001, 22221, 38783826);
INSERT INTO WorksWith VALUES (580081822, 82102, 38783826);
INSERT INTO WorksWith VALUES (102006427, 82102, 38783826);
INSERT INTO WorksWith VALUES (261100762, 82102, 7774405);
INSERT INTO WorksWith VALUES (633106355, 22221, 62808431);
INSERT INTO WorksWith VALUES (875630270, 21655, 36363127);
INSERT INTO WorksWith VALUES (414238107, 21655, 7774405);
INSERT INTO WorksWith VALUES (787343238, 44712, 48503182);
INSERT INTO WorksWith VALUES (384133546, 21655, 65211557);
INSERT INTO WorksWith VALUES (220334386, 45652, 78314315);
INSERT INTO WorksWith VALUES (547021335, 53446, 21416807);
INSERT INTO WorksWith VALUES (720552057, 53126, 3434135);
INSERT INTO WorksWith VALUES (650578287, 12883, 36884441);
INSERT INTO WorksWith VALUES (355573434, 81406, 50117626);
INSERT INTO WorksWith VALUES (880063278, 2871, 78314315);
INSERT INTO WorksWith VALUES (752021130, 34836, 7774405);

INSERT INTO Accounts VALUES (36884441, 'Individual');
INSERT INTO Accounts VALUES (87486271, 'Family');
INSERT INTO Accounts VALUES (77674005, 'Family');
INSERT INTO Accounts VALUES (48503182, 'Corporate');
INSERT INTO Accounts VALUES (36363127, 'Individual');
INSERT INTO Accounts VALUES (16034876, 'Corporate');
INSERT INTO Accounts VALUES (21416807, 'Corporate');
INSERT INTO Accounts VALUES (55085514, 'Individual');
INSERT INTO Accounts VALUES (53360401, 'Individual');
INSERT INTO Accounts VALUES (23824113, 'Family');
INSERT INTO Accounts VALUES (42372225, 'Family');
INSERT INTO Accounts VALUES (23147437, 'Individual');
INSERT INTO Accounts VALUES (78314315, 'Corporate');
INSERT INTO Accounts VALUES (31408173, 'Individual');
INSERT INTO Accounts VALUES (13515744, 'Corporate');
INSERT INTO Accounts VALUES (80655054, 'Individual');
INSERT INTO Accounts VALUES (46667474, 'Family');
INSERT INTO Accounts VALUES (44262445, 'Family');
INSERT INTO Accounts VALUES (50117626, 'Individual');
INSERT INTO Accounts VALUES (30773717, 'Individual');
INSERT INTO Accounts VALUES (73485655, 'Corporate');
INSERT INTO Accounts VALUES (41514020, 'Corporate');
INSERT INTO Accounts VALUES (31352446, 'Corporate');
INSERT INTO Accounts VALUES (84504082, 'Individual');
INSERT INTO Accounts VALUES (4558227, 'Corporate');
INSERT INTO Accounts VALUES (61256285, 'Individual');
INSERT INTO Accounts VALUES (56768373, 'Corporate');
INSERT INTO Accounts VALUES (22308335, 'Corporate');
INSERT INTO Accounts VALUES (24257577, 'Family');
INSERT INTO Accounts VALUES (26670862, 'Family');
INSERT INTO Accounts VALUES (38783826, 'Corporate');
INSERT INTO Accounts VALUES (3141450, 'Corporate');
INSERT INTO Accounts VALUES (85877782, 'Family');
INSERT INTO Accounts VALUES (7774405, 'Corporate');
INSERT INTO Accounts VALUES (62808431, 'Individual');
INSERT INTO Accounts VALUES (47684803, 'Corporate');
INSERT INTO Accounts VALUES (26688842, 'Corporate');
INSERT INTO Accounts VALUES (3434135, 'Corporate');
INSERT INTO Accounts VALUES (65211557, 'Individual');
INSERT INTO Accounts VALUES (38427362, 'Corporate');

INSERT INTO Employees VALUES (11804, 'Mateo', 0.0267, 55000, 77170);
INSERT INTO Employees VALUES (12883, 'Lila', 0.0672, 93000, 53126);
INSERT INTO Employees VALUES (72680, 'Adalyn', 0.0054, 88000, 77170);
INSERT INTO Employees VALUES (41221, 'Layla', 0.069, 107000, 21655);
INSERT INTO Employees VALUES (34836, 'Liam', 0.0922, 100000, 77170);
INSERT INTO Employees VALUES (53126, 'Lincoln', 0.0534, 81000, -999);
INSERT INTO Employees VALUES (54718, 'Isaac', 0.0159, 125000, 60404);
INSERT INTO Employees VALUES (82102, 'Sarah', 0.0066, 75000, 77170);
INSERT INTO Employees VALUES (77170, 'Isaiah', 0.0121, 48000, -999);
INSERT INTO Employees VALUES (2871, 'Aubrey', 0.0403, 62000, 53126);
INSERT INTO Employees VALUES (78562, 'Julian', 0.0422, 67000, 60404);
INSERT INTO Employees VALUES (37474, 'Lucas', 0.0304, 57000, 60404);
INSERT INTO Employees VALUES (60404, 'Carson', 0.0818, 71000, -999);
INSERT INTO Employees VALUES (50666, 'Logan', 0.0245, 61000, 53126);
INSERT INTO Employees VALUES (45652, 'Wyatt', 0.0381, 76000, 60404);
INSERT INTO Employees VALUES (53446, 'Madelyn', 0.0843, 117000, 60404);
INSERT INTO Employees VALUES (21655, 'Chloe', 0.0267, 115000, -999);
INSERT INTO Employees VALUES (81406, 'Mila', 0.0521, 64000, 60404);
INSERT INTO Employees VALUES (48604, 'Kinsley', 0.0606, 76000, 60404);
INSERT INTO Employees VALUES (22221, 'Zoe', 0.0788, 75000, 53126);
INSERT INTO Employees VALUES (62453, 'Lucas', 0.0311, 77000, 53126);
INSERT INTO Employees VALUES (78365, 'Gabriel', 0.0384, 61000, 53126);
INSERT INTO Employees VALUES (44712, 'Wyatt', 0.0699, 66000, 60404);
INSERT INTO Employees VALUES (37061, 'Liam', 0.0684, 62000, 53126);
INSERT INTO Employees VALUES (12016, 'Leah', 0.0806, 115000, 77170);

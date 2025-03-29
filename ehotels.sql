--Creation
CREATE TABLE Hotel( ID INTEGER,Chain_Name VarChar(100), Chain_address VARCHAR(100), Num_of_rooms INTEGER, Email VARCHAR(100), Address VARCHAR(100), Phone VARCHAR(20), Rating NUMERIC(2,1) CONSTRAINT chk_Rating CHECK (Rating >= 0 AND Rating <= 5), PRIMARY KEY (ID), FOREIGN KEY(Chain_Name) REFERENCES Hotel_Chain, FOREIGN KEY(Chain_address) REFERENCES Hotel_Chain);

CREATE TABLE Hotel_Chain ( Name VARCHAR(100), Add_central VARCHAR(100), Num_of_hotels INTEGER, Phone VARCHAR(20), Contact_email VARCHAR(100), PRIMARY KEY (Name, Add_central) ); 

CREATE TABLE Employee( SSN INTEGER, First_name VARCHAR(20), Last_name VARCHAR(20), Address VARCHAR(20), PRIMARY KEY (SSN)); 

CREATE TABLE Hotel_room( ID INTEGER, HotelID INTEGER, Price NUMERIC(8,2), Amenities VARCHAR(100), Capacity INTEGER, View VARCHAR(100), Damages VARCHAR(100), Extendable VARCHAR(20), PRIMARY KEY (ID), FOREIGN KEY(HotelID) REFERENCES Hotel); 

CREATE TABLE Customer( ID INTEGER, Date_of_reg DATE, Name VARCHAR(20), Address VARCHAR(20), PRIMARY KEY (ID) ); 

CREATE TABLE Booking( ID INTEGER, CustomerID INTEGER, RoomID INTEGER, Booking_Date DATE, Status VARCHAR(20), PRIMARY KEY (ID), FOREIGN KEY(CustomerID) REFERENCES Customer, FOREIGN KEY(RoomID) REFERENCES Hotel_room); 

CREATE TABLE Renting(  ID INTEGER, CustomerID INTEGER, RoomID INTEGER, CheckIn_Date DATE, Status VARCHAR(20), PRIMARY KEY (ID), FOREIGN KEY(CustomerID) REFERENCES Customer, FOREIGN KEY(RoomID) REFERENCES Hotel_room ); 

CREATE TABLE Archive( Archiving_ID INTEGER, CustomerID INTEGER, RentingID INTEGER,  PRIMARY KEY (Archiving_ID)); 

CREATE TABLE Checks_in( RoomID INTEGER, CustomerID INTEGER, RentingID INTEGER,  FOREIGN KEY (RoomID) REFERENCES Hotel_room, FOREIGN KEY (CustomerID) REFERENCES Customer, FOREIGN KEY (RentingID) REFERENCES Renting ); 

CREATE TABLE Books( RoomID INTEGER, CustomerID INTEGER, BookingID INTEGER,  FOREIGN KEY (RoomID) REFERENCES Hotel_room, FOREIGN KEY (CustomerID) REFERENCES Customer, FOREIGN KEY (BookingID) REFERENCES Booking); 

CREATE TABLE Stored( BookingID INTEGER, RentingID INTEGER, CustomerID INTEGER, RoomID INTEGER, ArchivingID INTEGER, FOREIGN KEY (BookingID) REFERENCES Booking, FOREIGN KEY (RentingID) REFERENCES Renting, FOREIGN KEY (CustomerID) REFERENCES Customer, FOREIGN KEY (RoomID) REFERENCES Hotel_room, FOREIGN KEY (ArchivingID) REFERENCES Archive); 

CREATE TABLE Stays_in( RoomID INTEGER, RentingID INTEGER, CustomerID INTEGER, HotelID INTEGER, FOREIGN KEY (RoomID) REFERENCES Hotel_room, FOREIGN KEY (RentingID) REFERENCES Renting, FOREIGN KEY (CustomerID) REFERENCES Customer, FOREIGN KEY (HotelID) REFERENCES Hotel); 

CREATE TABLE Reserves( RoomID INTEGER, BookingID INTEGER, CustomerID INTEGER, HotelID INTEGER, FOREIGN KEY (RoomID) REFERENCES Hotel_room, FOREIGN KEY (BookingID) REFERENCES Renting, FOREIGN KEY (CustomerID) REFERENCES Customer, FOREIGN KEY (HotelID) REFERENCES Hotel); 

CREATE TABLE Has( CustomerID INTEGER, HotelID INTEGER, FOREIGN KEY (CustomerID) REFERENCES Customer, FOREIGN KEY (HotelID) REFERENCES Hotel); 

CREATE TABLE Part_of( Add_central VARCHAR(20), Hotel_chain_name VARCHAR(20), HotelID INTEGER, FOREIGN KEY (Hotel_chain_name,Add_central) REFERENCES Hotel_chain, FOREIGN KEY (HotelID) REFERENCES Hotel ); 

CREATE TABLE Works_at( HotelID INTEGER, SSN INTEGER, FOREIGN KEY (SSN) REFERENCES Employee, FOREIGN KEY (HotelID) REFERENCES Hotel); 

CREATE TABLE Manages( HotelID INTEGER, SSN INTEGER, FOREIGN KEY (SSN) REFERENCES Employee, FOREIGN KEY (HotelID) REFERENCES Hotel); 

--Values
INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Dracula Hotels','123 Spooky Street, Bran, Transylvania',8,'900-300-2345','johnny@draculahotels.com'); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0001, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',20,'vlad@draculahotels.com','125 Spooky Street, Bran, Transylvania','900-300-6789', 1.1); 

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0101,0001,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable'); 

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0102,0001,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable'); 

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0101,0001,205.50,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable'); 

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0101,0001,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, '','sea view', 'extendable'); 

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0101,0001,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, '','sea view', 'extendable'); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0002, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',100,'blobby@draculahotels.com','23 Spooky Street, Bran, Transylvania','900-300-7890', 2.6); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0003, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',350,'drac@draculahotels.com','1 Hotel Transylvania Blvd., Bran, Transylvania','900-300-1234', 5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0004, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',300,'mavis@draculahotels.com','2 Hotel Transylvania Blvd. , Bran, Transylvania','900-300-1357', 4.2); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0005, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',270,'dennis@draculahotels.com','3 Hotel Transylvania Blvd. , Bran, Transylvania','900-300-2468', 3.8); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0006, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',200,'frank@draculahotels.com','1 Transformania Road, Bran, Transylvania','900-234-3000', 3.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0007, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',180,'griffin@draculahotels.com','2 Transformania Road, Bran, Transylvania','900-345-3000', 2.8); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0008, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',120,'wanda@draculahotels.com','3 Transformania Road, Bran, Transylvania','900-789-3000', 3.7); 

 

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario',10,'416-874-2600','contact@fairmont.com'); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0009, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 267,'thesavoy@fairmont.com',' The Savoy, Strand, WC2R 0EZ London, England','700-123-5000', 3.9); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0010, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 282,'theplaza@fairmont.com','768 Fifth Avenue, Manhattan, New York','212-759-3000', 4.4); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0011, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 950,'thequeenelizabeth@fairmont.com','900, boulevard René-Lévesque Ouest Montreal, Quebec','+1 5148613511', 4.0); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0012, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 75,'royalpavillion@fairmont.com','Porters BB24051, Saint James, Barbados','+1246 4225555', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0013, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 381,'thepalm@fairmont.com',' Fairmont The Palm, Palm Jumeirah, Dubai, United Arab Emirates','+971 44573388', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0014, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 222,'beijing@fairmont.com',' 8 Yong An Dong Li, Beijing, China','+86 01085117777', 4.6); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0015, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 429,'chateaulaurier@fairmont.com','1 Rideau Street, Ottawa, Ontario','613-241-1414', 4.0); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0016, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 412,'theempress@fairmont.com','721 Government Street, Victoria, British Columbia','250-384-8111', 4.3); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0018, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 602,'montecarlo@fairmont.com','12, Avenue des Spélugues 98000 Monte Carlo, Monaco','+377 93506500', 4.5); 

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore',9,'+65 68495888 ', ' contact@banyantree.com'); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0019, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 342,'alula@banyantree.com','Wadi Ashar, AlUla, Saudi Arabia','+966 14 512 0000', 5.0); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0020, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 151,'bangkok@banyantree.com','21/100 South Sathorn Road, Sathorn, Bangkok, Thailand','+66 2679 1200', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0021, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 213,'seoul@banyantree.com','60, Jangchungdan-ro, Jung-gu, Seoul, Korea','+82 2 2250 8000', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0022, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 115,'kyoto@banyantree.com','7 Seikanji Ryozan-Cho, Higashiyama-Ward, Kyoto, Japan','+81 75 531 0500', 4.0); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0023, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 138,'kualalumpur@banyantree.com','2 Jalan Conlay, Kuala Lumpur, Malaysia','+6 03 2113 1888', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0024, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 85,'langco@banyantree.com','Cu Du Village, Loc Vinh Commune, Phu Loc District, Hue City, Vietnam','+84 234 3695 888', 5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0025, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 160,'puebla@banyantree.com','10 Norte #1402, Col. Barrio del Alto, Puebla, México','+52 (222) 122 2300', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0026, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 122,'tamoudabay@banyantree.com','Route Nationale 13 Oued Negro, Fnideq, Morocco','+212 539 669 999', 4.3); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0027, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 175,'suzhou@banyantree.com','No.208 Fenhu Road, Suzhou New District, Jiangsu Province, China','0512-66060606', 3.8); 

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Marriott','7750 Wisconsin Ave. Bethesda, Maryland ',8,'1-301-380-3000','contact@marriott.com'); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0028, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 231,'masasquare@marriott.com','Masa Square, New CBD, Cnr 1st & Western Commercial Avenue Gaborone, Botswana','+2673159954', 3.8); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0029, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 116,'athlone@marriott.com','Gleeson Street, Co. Westmeath Athlone, Ireland','+35 390 6451000', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0030, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 241,'adelaide@marriott.com','141 King William Street Adelaide, Australia','+6 188-451-3300', 4.6); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0031, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 165,'brisbane@marriott.com','515 Queen Street Brisbane, Queensland, Australia','+6 173-303-8000', 4.4); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0032, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 124,'aguascalientes@marriott.com','Boulevard Zacatecas Norte S/N, Aguascalientes, Mexico','+52 449 1394060', 4.3); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0033, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 205,'medellin@marriott.com','Calle 1a Sur #43a-83 Medellin, Colombia','+57 604 4443636', 4.1); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0034, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 203,'stmaarten@marriott.com','144 Oyster Pond Road Dawn Beach, Sint Maarten','+1 721-543-6700', 3.7); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0035, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 196,'guanacaste@marriott.com','Hacienda Pinilla, Guanacaste, Costa Rica','+5 062-681-2000', 4.4); 

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Hyatt','150 N Riverside Plaza, Chicago, Illinois ',8,'1-312-750-1234','contact@hyatt.com'); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0036, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 23,'gaigehouse@hyatt.com','13540 Arnold Dr, Glen Ellen, CA 95442, United States','+17079350237', 4.0); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0037, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 120,'moncton@hyatt.com','Hyatt Place Moncton/Downtown 1000 Main Street, Moncton, NB, Canada','+1 506 857 7000', 4.2); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0038, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 146,'vienna@hyatt.com','Am Hof 2, Vienna, Austria, 1010','+43 1 22740 1234', 4.9); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0039, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 128,'amsterdam@hyatt.com','Sarphatistraat 104, 1018 GV Amsterdam, Netherlands','+31205541234', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0040, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 173,'kompas@hyatt.com','Ul. kardinala Stepinca 21, 20000, Dubrovnik, Croatia','+38520299000', 4.7); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0041, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 36,'vomoisland@hyatt.com','Beachfront Vomo Island, Fiji','+6797767955', 4.8); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0042, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 546,'melbourne@hyatt.com','123 Collins St, Melbourne VIC 3000, Australia','+61396571234', 4.5); 

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0043, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 99,'britomart@hyatt.com','29 Galway Street, Auckland Central, Auckland 1010, New Zealand','+6493009595', 4.5); 

Insert into employee(SSN, First_name , Last_name , Address) Values  

(001,'John','Doe', '123 Street'), 

(002,'Jane','Mike', '843 Road'),  

(003,'Billy','Joel','1 Music Way'),  

(004,'Lily','Spence','12 Place'); 

Insert into Works_at(HotelID, SSN) Values 

(0001,001), (0010,002), (0028,003),(001,004); 

Insert into Customer(ID , Date_of_reg , Name, Address) Values  

(01,'11-12-1030','Frankenstien',34 Monster Way),  

(02,'20-1-2023','Bob Dylan','2 Music Star Road'),  

(03,'13-12-1989','Taylor Swift', '1 Hollywood'),  

(04,'10-9-2021','Jake Smith','23 Busy Town'); 

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES  

(0102,0001,300,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, '','900-300-6789', 1.1), 

(0103,0009,500,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, '','900-300-6789', 1.1), 

(0104,0025,375,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, '','900-300-6789', 1.1), 

(0105,0043,100,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, '','900-300-6789', 1.1); 

Insert into Renting(ID,CustomerID,RoomID,CheckIn_Date,Status) Values 

(1,01,0101,'4-19-2021','Checked-In'), 

(2,04,0105,'9-2-2024','Checked-In'), 

(3,02,0103,'6-5-2020','Checked-In'), 

(4,03,0102,'8-17-2022','Checked-In'); 
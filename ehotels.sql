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

INSERT INTO Hotel(ID, Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0001, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania', 20,'vlad@draculahotels.com','125 Spooky Street, Bran, Transylvania', ' Transylvania', '900-300-6789', 1.1);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0101,0001,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0102,0001,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0103,0001,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0104,0001,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0105,0001,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'stolen ironing board', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0002, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',100,'blobby@draculahotels.com','23 Spooky Street, Bran, Transylvania', ' Transylvania', '900-300-7890', 2.6);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0201,0002,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0202,0002,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0203,0002,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0204,0002,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0205,0002,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'stain on rug', 'extendable');

INSERT INTO Hotel(ID, Chain_name, Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0003, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',350,'drac@draculahotels.com','1 Hotel Transylvania Blvd., Bran, Transylvania', ' Transylvania', '900-300-1234', 5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0301,0003,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0302,0003,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0303,0003,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0304,0003,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0305,0003,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'stain on rug', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0004, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',300,'mavis@draculahotels.com','2 Hotel Transylvania Blvd. , Bran, Transylvania', ' Transylvania', '900-300-1357', 4.2);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0401,0004,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0402,0004,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0403,0004,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0404,0004,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0405,0004,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'stolen coffee maker', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0005, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',270,'dennis@draculahotels.com','3 Hotel Transylvania Blvd. , Bran, Transylvania', ' Transylvania', '900-300-2468', 3.8);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0501,0005,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0502,0005,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0503,0005,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0504,0005,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0505,0005,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'stolen coffee maker', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0006, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',200,'frank@draculahotels.com','1 Transformania Road, Bran, Transylvania', ' Transylvania', '900-234-3000', 3.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0601,0006,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0602,0006,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0603,0006,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0604,0006,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0605,0006,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0007, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',180,'griffin@draculahotels.com','2 Transformania Road, Bran, Transylvania', ' Transylvania', '900-345-3000', 2.8);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0701,0007,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0702,0007,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0703,0007,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0704,0007,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0705,0007,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0008, 'Dracula Hotels','123 Spooky Street, Bran, Transylvania',120,'wanda@draculahotels.com','3 Transformania Road, Bran, Transylvania', ' Transylvania', '900-789-3000', 3.7);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0801,0008,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0802,0008,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0803,0008,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0804,0008,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0805,0008,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario',10,'416-874-2600','contact@fairmont.com');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0009, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 267,'thesavoy@fairmont.com',' The Savoy, Strand, WC2R 0EZ London, England', 'England','700-123-5000', 3.9);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0901,0009,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0902,0009,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0903,0009,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0904,0009,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (0905,0009,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0010, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 282,'theplaza@fairmont.com','768 Fifth Avenue, Manhattan, New York', 'USA','212-759-3000', 4.4);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1001,0010,210.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1002,0010,197.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1003,0010,205.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1004,0010,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1005,0010,270.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0011, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 950,'thequeenelizabeth@fairmont.com','900, boulevard René-Lévesque Ouest Montreal, Quebec', 'Canada','+1 5148613511', 4.0);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1101,0011,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1102,0011,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1103,0011,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1104,0011,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1105,0011,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0012, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 75,'royalpavillion@fairmont.com','Porters BB24051, Saint James, Barbados', 'Barbados','+1246 4225555', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1201,0012,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1202,0012,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1203,0012,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1204,0012,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1205,0012,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0013, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 381,'thepalm@fairmont.com',' Fairmont The Palm, Palm Jumeirah, Dubai, United Arab Emirates', 'UAE','+971 44573388', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1301,0013,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1302,0013,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1303,0013,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1304,0013,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1305,0013,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0014, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 222,'beijing@fairmont.com',' 8 Yong An Dong Li, Beijing, China', 'China','+86 01085117777', 4.6);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1401,0014,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1402,0014,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1403,0014,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1404,0014,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1405,0014,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0015, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 429,'chateaulaurier@fairmont.com','1 Rideau Street, Ottawa, Ontario', 'Canada','613-241-1414', 4.0);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1501,0015,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1502,0015,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1503,0015,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1504,0015,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1505,0015,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0016, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 412,'theempress@fairmont.com','721 Government Street, Victoria, British Columbia', 'Canada','250-384-8111', 4.3);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1601,0016,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1602,0016,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1603,0016,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1604,0016,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1605,0016,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Area,Phone,Rating) VALUES (0018, 'Fairmont Hotels & Resorts','155 Wellington St W Suite 3300, Toronto, Ontario', 602,'montecarlo@fairmont.com','12, Avenue des Spélugues 98000 Monte Carlo, Monaco', 'Monaco','+377 93506500', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1701,0011,215.50,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1702,0011,198.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1703,0011,207.00,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','hole in wall', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1704,0011,311.50,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1705,0011,279.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore',9,'+65 68495888 ', ' contact@banyantree.com');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0019, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 342,'alula@banyantree.com','Wadi Ashar, AlUla, Saudi Arabia','+966 14 512 0000', 5.0);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1901,0019,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1902,0019,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1903,0019,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1904,0019,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (1905,0019,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0020, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 151,'bangkok@banyantree.com','21/100 South Sathorn Road, Sathorn, Bangkok, Thailand','+66 2679 1200', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2001,0020,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2002,0020,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2003,0020,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2004,0020,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2005,0020,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0021, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 213,'seoul@banyantree.com','60, Jangchungdan-ro, Jung-gu, Seoul, Korea','+82 2 2250 8000', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2101,0021,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2102,0021,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2103,0021,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2104,0021,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2105,0021,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0022, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 115,'kyoto@banyantree.com','7 Seikanji Ryozan-Cho, Higashiyama-Ward, Kyoto, Japan','+81 75 531 0500', 4.0);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2201,0022,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2202,0022,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2203,0022,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2204,0022,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2205,0022,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0023, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 138,'kualalumpur@banyantree.com','2 Jalan Conlay, Kuala Lumpur, Malaysia','+6 03 2113 1888', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2301,0023,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2302,0023,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2303,0023,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2304,0023,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2305,0023,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0024, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 85,'langco@banyantree.com','Cu Du Village, Loc Vinh Commune, Phu Loc District, Hue City, Vietnam','+84 234 3695 888', 5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2401,0024,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2402,0024,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2403,0024,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2404,0024,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'stain on rug', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2405,0024,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0025, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 160,'puebla@banyantree.com','10 Norte #1402, Col. Barrio del Alto, Puebla, México','+52 (222) 122 2300', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2501,0025,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2502,0025,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2503,0025,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2504,0025,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'broken shower head', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2505,0025,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0026, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 122,'tamoudabay@banyantree.com','Route Nationale 13 Oued Negro, Fnideq, Morocco','+212 539 669 999', 4.3);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2601,0026,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2602,0026,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2603,0026,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2604,0026,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'broken shower head', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2605,0026,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0027, 'Banyan Tree Hotels','211 Upper Bukit Timah Rd, Singapore, Central Singapore', 175,'suzhou@banyantree.com','No.208 Fenhu Road, Suzhou New District, Jiangsu Province, China','0512-66060606', 3.8);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2701,0027,213.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2702,0027,187.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2703,0027,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view','no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2704,0027,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'broken shower head', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2705,0027,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Marriott','7750 Wisconsin Ave. Bethesda, Maryland ',8,'1-301-380-3000','contact@marriott.com');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0028, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 231,'masasquare@marriott.com','Masa Square, New CBD, Cnr 1st & Western Commercial Avenue Gaborone, Botswana','+2673159954', 3.8);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2801,0028,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2802,0028,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2803,0028,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2804,0028,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2805,0028,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');


INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0029, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 116,'athlone@marriott.com','Gleeson Street, Co. Westmeath Athlone, Ireland','+35 390 6451000', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2901,0029,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2902,0029,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2903,0029,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2904,0029,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (2905,0029,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0030, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 241,'adelaide@marriott.com','141 King William Street Adelaide, Australia','+6 188-451-3300', 4.6);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3001,0030,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3002,0030,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3003,0030,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3004,0030,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3005,0030,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0031, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 165,'brisbane@marriott.com','515 Queen Street Brisbane, Queensland, Australia','+6 173-303-8000', 4.4);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3101,0031,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3102,0031,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3103,0031,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3104,0031,315.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3105,0031,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0032, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 124,'aguascalientes@marriott.com','Boulevard Zacatecas Norte S/N, Aguascalientes, Mexico','+52 449 1394060', 4.3);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3201,0032,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3202,0032,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3203,0032,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3204,0032,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3205,0032,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0033, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 205,'medellin@marriott.com','Calle 1a Sur #43a-83 Medellin, Colombia','+57 604 4443636', 4.1);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3301,0033,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3302,0033,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3303,0033,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3304,0033,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3305,0033,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0034, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 203,'stmaarten@marriott.com','144 Oyster Pond Road Dawn Beach, Sint Maarten','+1 721-543-6700', 3.7);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3401,0034,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3402,0034,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3403,0034,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3404,0034,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3405,0034,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0035, 'Marriott','7750 Wisconsin Ave. Bethesda, Maryland ', 196,'guanacaste@marriott.com','Hacienda Pinilla, Guanacaste, Costa Rica','+5 062-681-2000', 4.4);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3501,0035,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3502,0035,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'ripped curtains', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3503,0035,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3504,0035,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3505,0035,283.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');



INSERT INTO Hotel_chain(Name,Add_central,Num_of_hotels,Phone,Contact_email) VALUES ('Hyatt','150 N Riverside Plaza, Chicago, Illinois ',8,'1-312-750-1234','contact@hyatt.com');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0036, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 23,'gaigehouse@hyatt.com','13540 Arnold Dr, Glen Ellen, CA 95442, United States','+17079350237', 4.0);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3601,0036,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3602,0036,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3603,0036,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', '', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3604,0036,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3605,0036,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0037, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 120,'moncton@hyatt.com','Hyatt Place Moncton/Downtown 1000 Main Street, Moncton, NB, Canada','+1 506 857 7000', 4.2);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3701,0037,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3702,0037,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3703,0037,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3704,0037,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3705,0037,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0038, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 146,'vienna@hyatt.com','Am Hof 2, Vienna, Austria, 1010','+43 1 22740 1234', 4.9);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3801,0038,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3802,0038,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3803,0038,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3804,0038,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3805,0038,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0039, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 128,'amsterdam@hyatt.com','Sarphatistraat 104, 1018 GV Amsterdam, Netherlands','+31205541234', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3901,0039,212.55,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3902,0039,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3903,0039,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3904,0039,314.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (3905,0039,288.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0040, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 173,'kompas@hyatt.com','Ul. kardinala Stepinca 21, 20000, Dubrovnik, Croatia','+38520299000', 4.7);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4001,0040,212.15,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4002,0040,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4003,0040,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4004,0040,324.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4005,0040,289.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0041, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 36,'vomoisland@hyatt.com','Beachfront Vomo Island, Fiji','+6797767955', 4.8);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4101,0041,212.15,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4102,0041,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4103,0041,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4104,0041,324.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4105,0041,289.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0042, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 546,'melbourne@hyatt.com','123 Collins St, Melbourne VIC 3000, Australia','+61396571234', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4201,0042,212.15,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4202,0042,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4203,0042,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', '', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4204,0042,324.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4205,0042,289.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');

INSERT INTO Hotel(ID,Chain_name,Chain_address,Num_of_rooms,Email,Address,Phone,Rating) VALUES (0043, 'Hyatt','150 N Riverside Plaza, Chicago, Illinois ', 99,'britomart@hyatt.com','29 Galway Street, Auckland Central, Auckland 1010, New Zealand','+6493009595', 4.5);

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4301,0043,212.15,'2 twin beds, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4302,0043,189.90,'1 twin bed, 1 bathroom, coffeemaker, TV',1, 'mountain view', 'no damages', 'extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4303,0043,207.99,'1 double bed, 1 bathroom, coffeemaker, minifridge, TV',2, 'mountain view', '', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4304,0043,324.20,'2 double beds, 2 bathrooms, coffeemaker, minifridge, TV',4, 'sea view', 'no damages', 'non-extendable');

INSERT INTO Hotel_room(ID,HotelID,Price,Amenities,Capacity,View,Damages, Extendable) VALUES (4305,0043,289.50,'1 double bed, 1 pull-out couch, 1 bathroom, coffeemaker, minifridge, TV',3, 'sea view', 'no damages', 'extendable');
--Employees--
Insert into employee(SSN, First_name , Last_name , Address) Values
(001,'John','Doe', '123 Street'),
(002,'Jane','Mike', '843 Road'),
(003,'Billy','Joel','1 Music Way'),
(004,'Lily','Spence','12 Place'); 

Insert into Works_at(HotelID, SSN) Values
(0001,001), (0010,002), (0028,003),(001,004); 

--Customers--
Insert into Customer(ID , Date_of_reg , Name, Address) Values
(01,'11-12-1030','Frankenstien',34 Monster Way),
(02,'20-1-2023','Bob Dylan','2 Music Star Road'),
(03,'13-12-1989','Taylor Swift', '1 Hollywood'),
(04,'10-9-2021','Jake Smith','23 Busy Town');

--Rentings--
Insert into Renting(ID,CustomerID,RoomID,CheckIn_Date,Status) Values
 (1,01,0403,'4-19-2021','Checked-In'),
 (2,04,4205,'9-2-2024','Checked-In'),
 (3,02,3202,'6-5-2020','Checked-In'),
 (4,03,2504,'8-17-2022','Checked-In');

--Stays_in (so indexes work)--
Insert into Stays_in(RoomID,RentingID,CustomerID,HotelID) Values
(403,1,1,4),
(4205,2,4,42),
(3202,3,2,32),
(2504,4,3,25);

--Indexes--
Create index customerID_Booking_index on Booking(CustomerID);
Create index customerID_Renting_index on Renting(CustomerID);
Create index customerID_roomID_staysIn_index on Stays_In(CustomerID,RoomID);
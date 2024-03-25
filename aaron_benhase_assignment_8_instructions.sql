DROP DATABASE petboarding;
CREATE DATABASE petboarding;


USE petboarding;


CREATE TABLE petType (
ID int NOT NULL AUTO_INCREMENT,
DESCRIPTION VARCHAR(30) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE client (
ID int NOT NULL AUTO_INCREMENT,
firstName varchar(25) NOT NULL,
LastName varchar(25) NOT NULL,
address varchar(90) NOT NULL,
city varchar(25) NOT NULL,
state varchar(2) NOT NULL,
zipCode char(5) NOT NULL,
phone char(10) NOT NULL UNIQUE,
email varchar(50) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE employee (
ID int NOT NULL AUTO_INCREMENT,
firstname varchar(25) NOT NULL,
lastname varchar (25) NOT NULL,
address varchar(90) NOT NULL,
city varchar(25) NOT NULL,
state varchar(2) NOT NULL,
zipCode char(5) NOT NULL,
phone char(10) NOT NULL UNIQUE,
email varchar(50) NOT NULL UNIQUE,
PRIMARY KEY (ID)
);

CREATE TABLE position (
ID int NOT NULL AUTO_INCREMENT,
description varchar(30) NOT NULL UNIQUE,
hourly DECIMAL(5,2) NOT NULL DEFAULT(15.00),
PRIMARY KEY (ID)
);

CREATE TABLE cityStateZIP (
    city VARCHAR(90) NOT NULL,
    state CHAR(2) NOT NULL,
    zipCode CHAR(5) NOT NULL UNIQUE,
    PRIMARY KEY(zipCode)
);

CREATE TABLE breed    (
    ID int NOT NULL AUTO_INCREMENT,
    DESCRIPTION VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (ID)
);

ALTER TABLE breed AUTO_INCREMENT = 200;

CREATE TABLE pet    (
    ID int NOT NULL AUTO_INCREMENT,
    breedId int NOT NULL,
    petTypeId int NOT NULL,
    name VARCHAR(25) NOT NULL,
    age int NOT NULL,
    weight DECIMAL(3,1),
    color VARCHAR(25) NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY (breedID) REFERENCES breed(ID),
    FOREIGN KEY (petTypeId) REFERENCES petType(ID)
);

ALTER TABLE pet AUTO_INCREMENT = 500;

CREATE TABLE clientPet  (
    clientId int NOT NULL,
    petId int NOT NULL,
    PRIMARY KEY (clientId, petId),
    FOREIGN KEY (clientId) REFERENCES client(ID),
    FOREIGN KEY (petId) REFERENCES pet(ID)
);

ALTER TABLE employee
  ADD FOREIGN KEY (zipCode) REFERENCES cityStateZip(zipCode);


	ALTER TABLE client
  ADD FOREIGN KEY (zipCode) REFERENCES cityStateZip (zipCode);
  

  
CREATE TABLE employeePosition   (
    employeeId int NOT NULL UNIQUE,
    positionId int NOT NULL,
    PRIMARY KEY (employeeId, positionID),
    FOREIGN KEY (employeeId) REFERENCES employee(ID),
    FOREIGN KEY (positionId) REFERENCES position (ID)
);

CREATE TABLE color  (
    ID int NOT NULL AUTO_INCREMENT,
    color VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY(ID)
);

CREATE TABLE timecard	(
	ID int NOT NULL AUTO_INCREMENT,
    employeeId int NOT NULL,
    sun int NOT NULL DEFAULT '0',
	mon int NOT NULL DEFAULT '0',
    tues int NOT NULL DEFAULT '0',
    wed int NOT NULL DEFAULT '0',
    thurs int NOT NULL DEFAULT '0',
    fri int NOT NULL DEFAULT '0',
    sat int NOT NULL DEFAULT '0',
	PRIMARY KEY (ID),
    FOREIGN KEY (employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE
);

ALTER TABLE color AUTO_INCREMENT 100;

CREATE TABLE workschedule	(
	ID int NOT NULL AUTO_INCREMENT,
    employeeId int NOT NULL,
    startDateTime timestamp NOT NULL,
    endDateTime timestamp NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE
    );

INSERT INTO breed (description) VALUES
('French Bulldog'),
('Labrador Retriever'),
('Golden Retriever'),
('German Shepherd'),
('Poodle'),
('Bulldog'),
('Rottweiler'),
('Beagle'),
('Dachshund'),
('German Shorthaired Pointer'),
('Pembroke Welsh Corgi'),
('Australian Shepherd'),
('Yorkshire Terrier'),
('Cavalier King Charles Spaniel'),
('Doberman Pinscher'),
('Boxer'),
('Miniature Schnauzer'),
('Cane Corso'),
('Great Dane'),
('Shih Tzu'),
('Siberian Husky'),
('Pomeranian'),
('Boston Terrier'),
('Havanes'),
('English Springer Spaniel'),
('Shetland Sheepdog'),
('Cocker Spaniel'),
('Border Collie'),
('Domestic Shorthair'),
('Domestic Longhair'),
('Abyssinian'),
('Bengal'),
('Bombay'),
('Burmese'),
('Cornish Rex'),
('Devon Rex'),
('Himalayan'),
('Maine Coon'),
('Manx'),
('Persian'),
('Ragdoll'),
('Russian Blue'),
('Scottish Fold'),
('Siamese'),
('Sphynx'),
('Turkish Angora'),
('Turkish Van'),
('Unknown');


INSERT INTO employeePosition VALUES
(6,7),
(9,10),
(7,5),
(1,4),
(2,1),
(8,1),
(3,9),
(4,2),
(10,6),
(5,8),
(20,8),
(23,10),
(17,6),
(29,4),
(34,5),
(15,5),
(39,2),
(25,10),
(14,2),
(37,10),
(19,8),
(33,8),
(31,10),
(40,7),
(30,10),
(22,10),
(32,5),
(35,6),
(12,1),
(21,6),
(28,2),
(26,6),
(38,5),
(18,8),
(13,4),
(11,9),
(16,10),
(24,9),
(27,1),
(36,7);



INSERT INTO petType (description) VALUES
('Cat'),
('Dog'),
('Horse'),
('Bird'),
('Reptile'),
('Rabbit'),
('Guinea pig'),
('Fish'),
('Ferret'),
('Rat'),
('Mouse'),
('Amphibian'),
('Hamster'),
('Snake'),
('Turtle');


INSERT INTO client (firstName, lastName, address, city, state, zipCode, phone, email) VALUES
('Meera','White','484 Bridge St','Winter Garden','FL','34787','2025550166','mwhite@isp.com'),
('Bradlee','Esparza','7031 Gainsway St','Winter Garden','FL','34787','2025550173','besparza@isp.com'),
('Leilani','Leonard','37 Monroe Street','Winter Garden','FL','34787','2025550175','lleonard@isp.com'),
('Stefanie','Brook','7990 West Surrey St','Winter Garden','FL','34787','2025550179','sbrook@isp.com'),
('Grover','Squires','7618 Madison Court','Winter Garden','FL','34787','2025550180','gsquires@isp.com'),
('Efe','House','97 High Point Street','Pine Castle','FL','32839','2025550196','ehouse@isp.com'),
('Atticus','Atkinson','66 Harrison Dr','Pine Castle','FL','32839','2025550197','aatkinson@isp.com'),
('Michelle','Ramirez','370 Hill Field Ave','Pine Castle','FL','32839','2025550198','mramirez@isp.com'),
('Remy','Hassan','249 Devon Lane','Pine Castle','FL','32839','2225550199','rhassan@isp.com'),
('Jordana','Beck','7911 Carson Lane','Pine Castle','FL','32839','2025550200','jbeck@isp.com'),
('Igor','Prince','12 Creekside St','Tangerine','FL','32777','2025550199','iprince@isp.com'),
('Avaya','Clarke','7771 Border Court','Tangerine','FL','32777','2225550119','aclarke@isp.com'),
('Douglas','Guthrie','9 Wrangler Ave','Tangerine','FL','32777','2225550124','dguthrie@isp.com'),
('Yvonne','Goodman','12 Creekside St','Winter Park','FL','32790','2025550109','ygoodman@isp.com'),
('Dante','Mackenzie','137 Wall St','Winter Park','FL','32790','2025550112','dmackenzie@isp.com'),
('Alysha','Rollins','411 Shirley St','Winter Park','FL','32790','2025550115','arollins@isp.com'),
('Avaya','Gonzalez','7771 Border Court','Winter Park','FL','32790','2025550119','agonzalez@isp.com'),
('Haniya','Kelly','6 South Sulphur Springs Street','Winter Park','FL','32790','2025550121','hkelly@isp.com'),
('Jonathan','Kumar','25 Annadale Court','Jupiter','FL','33458','2025550182','jkumar@isp.com'),
('Angus','Neville','9841 Smith Drive','Jupiter','FL','33458','2025550187','aneville@isp.com'),
('Uzair','Sparrow','7999 Hall Street','Jupiter','FL','33458','2025550188','usparrow@isp.com'),
('Amari','Currie','8411 Pleasant St','Jupiter','FL','33458','2025550194','acurrie@isp.com'),
('Imaani','Wallace','33 Pierce Rd','Jupiter','FL','33458','2025550195','iwallace@isp.com'),
('Nathalie','Chambers','942 New Saddle Drive','Windermere','FL','34786','2025550122','nchambers@isp.com'),
('Dante','Rollins','9 Wrangler Ave','Windermere','FL','34786','2025550124','drollins@isp.com'),
('Beverley','Mckee','7319 S. Greenview Drive','Windermere','FL','34786','2025550125','bmckee@isp.com'),
('Thomas','Waters','411 Shirley St','Lockhart','FL','32810','2225550115','twaters@isp.com'),
('Haniya','Kaiser','6 South Sulphur Springs Street','Belle Isle','FL','32812','2225550121','hkaiser@isp.com'),
('Victor','Newman','942 New Saddle Drive','Belle Isle','FL','32812','2225550122','vnewman@isp.com'),
('Brian','Roberts','7319 S. Greenview Drive','Sand Lake','FL','32819','2225550125','broberts@isp.com'),
('Paris','Solis','763 West Mulberry St','Sand Lake','FL','32819','2025550132','psolis@isp.com'),
('Umaiza','Heath','545 Ohio Ave','Sand Lake','FL','32819','2025550135','uheath@isp.com'),
('Dante','Rennie','137 Wall St','Sand Lake','FL','32819','2225550112','drennie@isp.com'),
('Robin','Solis','8474 Wentworth Street','Sand Lake','FL','32819','2025550164','rsolis@isp.com'),
('Kavita','Heath','796 Hartford St','Sand Lake','FL','32819','2025550165','kheath@isp.com');

INSERT INTO cityStateZip (city, state, zipCode)
(SELECT DISTINCT city, state, zipCode
FROM client
WHERE zipCode NOT IN (SELECT DISTINCT zipCode FROM cityStateZip));


ALTER TABLE client
ADD CONSTRAINT fk_zipCode
FOREIGN KEY (zipCode) 
REFERENCES cityStateZip(zipCode);

ALTER TABLE employee
  ADD FOREIGN KEY (zipCode) REFERENCES cityStateZip(zipCode);
  

ALTER TABLE client
DROP COLUMN city,
DROP COLUMN state;



INSERT INTO position (description , hourly) VALUES
('Manager','60.00'),
('Animal Trainer','50.00'),
('Groom','25.00'),
('Receptionist','20.00'),
('Bather','13.00'),
('Kennel Technician','17.50'),
('Veterinarian','85.00'),
('Pet Exerciser','15.00'),
('Maintenance','32.00'),
('Groomer','18.00');

INSERT INTO employee (firstName, lastName, address, city, state, zipCode, phone, email) VALUES
('Paris','Lindsey','763 West Mulberry St','Apopka','FL','32703','2025550132','plindsey@isp.com'),
('Umaiza','Melia','545 Ohio Ave','Apopka','FL','32703','2025550135','umelia@isp.com'),
('Nico','Prince','20 Middle River Street','Christmas','FL','32709','2025550137','nprince@isp.com'),
('Javan','Rennie','8112 North Country St','Christmas','FL','32709','2025550139','jrennie@isp.com'),
('Ali','Waters','83 Rockland Lane','Christmas','FL','32709','2025550144','awaters@isp.com'),
('JohnPaul','Clarke','1 Riverside Lane','Christmas','FL','32709','2025550153','jpcClarke@isp.com'),
('Dane','Kaiser','694 Wall Road','Christmas','FL','32709','2025550155','kdaiser@isp.com'),
('Hammad','Newman','9970 State Court','Eatonville','FL','32751','2025550157','hnewman@isp.com'),
('Maha','Guthrie','54 Woodsman Drive','Eatonville','FL','32751','2025550161','mguthrie@isp.com'),
('Tulisa','Roberts','7174 Studebaker Street','Eatonville','FL','32751','2025550163','troberts@isp.com');

INSERT INTO cityStateZip (city, state, zipCode)
(SELECT DISTINCT city, state, zipCode
FROM employee
WHERE zipCode NOT IN (SELECT DISTINCT zipCode FROM cityStateZip));


ALTER TABLE client
  ADD FOREIGN KEY (zipCode) REFERENCES cityStateZip(zipCode);
  

ALTER TABLE employee
DROP COLUMN city,
DROP COLUMN state;

INSERT INTO employee (firstName, lastName, address, zipCode, phone, email) VALUES 
('Raheem','Montgomery','71 Paris Hill Rd.','32703','4134849795','rmontgomery@isp.com'),
('Leo','Bird','201 Eagle Dr.','32709','7747829407','lbird@isp.com'),
('Oliwier','Barnett','81 Cedar Swamp St.','32703','2764343958','obarnett@isp.com'),
('Fern','Garner','37 Gartner Court','32709','2256254378','fgarner@isp.com'),
('Dawson','Marquez','90 Mammoth Street','32751','7634882879','dmarquez@isp.com'),
('Raja','Glass','7918 Talbot Ave.','32751','2319969540','rglass@isp.com'),
('Alissa','Ortiz','7756 Fulton Court','32839','2397268929','aortiz@isp.com'),
('Nicholas','Pena','8123 Race Ave.','33458','7815242242','npena@isp.com'),
('Harvey','West','9 Cherry Ave','32839','7326232762','hwest@isp.com'),
('Aamina','Dillon','9 West Boston Lane','33458','2035745299','adillon@isp.com'),
('Louis','Giles','598 North Road','34786','2708583758','lgiles@isp.com'),
('Krystal','Walters','583 North Nichols Street','33458','3232591832','kwalters@isp.com'),
('Alexa','Preston','9227 North Bow Ridge Street','34786','4098496634','apreston@isp.com'),
('Rebekah','Morgan','9437 East 6th Street','32810','6073928343','rmorgan@isp.com'),
('Ethan','Ali','167 NE. Depot Dr.','34786','2245499884','eali@isp.com'),
('Malik','Vincent','312 Colonial Ave.','34787','9149573014','mvincent@isp.com'),
('Sara','Barron','9064 E. Swanson St.','32810','8707743244','sbarron@isp.com'),
('Lyra','Murphy','400 Nut Swamp Drive','34787','3527673126','lmurphy@isp.com'),
('Awais','Carrillo','225 South Manhattan Street','32790','6369577670','acarrillo@isp.com'),
('Kaya','Hodge','9572 William Lane','32709','2125271561','khodge@isp.com'),
('Jemima','Miller','9290 Indian Spring Rd.','32790','6206673264','jmiller@isp.com'),
('Laila','Christensen','15 Rose Avenue','32812','9017396978','lchristensen@isp.com'),
('Honey','Warren','7946 Leeton Ridge Street','32777','5858531050','hwarren@isp.com'),
('Brodie','Gordon','71 Jackson Ave.','32709','9016899813','bgordon@isp.com'),
('Lauren','Morton','7931 Rockaway Street','32790','4476721422','lmorton@isp.com'),
('Ty','Bell','921 Brook St.','32812','2393336881','tbell@isp.com'),
('Floyd','Johns','2 Shore Street','32777','4065842872','fjohns@isp.com'),
('Mathew','Horton','1 Rockland Ave.','32709','7195789907','mhorton@isp.com'),
('Ernest','Higgins','451 Marshall Lane','32777','7637651247','ehiggins@isp.com'),
('Kamil','Lozano','75 N. Golden Star Street','32812','7638554744','klozano@isp.com');

INSERT INTO pet (breedId, petTypeId, name, age, weight, color) VALUES 
(201, 2, 'Buddy', 3, 10.5, 'Brown'),
(202, 2, 'Max', 5, 15.2, 'Black'),
(228, 1, 'Lucy', 3, 8.7, 'White'),
(204, 2, 'Bailey', 4, 12.3, 'Golden'),
(205, 2, 'Charlie', 6, 18.6, 'Brown'),
(230, 1, 'Molly', 3, 6.4, 'Black'),
(231, 1, 'Daisy', 3, 9.9, 'White'),
(208, 2, 'Rocky', 7, 20.1, 'Golden'),
(233, 1, 'Sadie', 3, 7.2, 'Brown'),
(210, 2, 'Luna', 5, 11.8, 'Black'),
(211, 2, 'Cooper', 4, 14.5, 'White'),
(235, 1, 'Bella', 3, 8.3, 'Golden'),
(213, 2, 'Toby', 6, 16.2, 'Brown'),
(236, 1, 'Lola', 3, 9.1, 'Black'),
(215, 2, 'Jack', 4, 12.7, 'White'),
(216, 2, 'Maggie', 7, 19.4, 'Golden'),
(238, 1, 'Duke', 3, 5.8, 'Brown'),
(218, 2, 'Chloe', 5, 13.9, 'Black'),
(239, 1, 'Bear', 3, 9.5, 'White'),
(220, 2, 'Buster', 4, 15.3, 'Golden'),
(221, 2, 'Zoe', 6, 17.8, 'Brown'),
(240, 1, 'Riley', 3, 7.1, 'Black'),
(223, 2, 'Bailey', 5, 12.6, 'White'),
(224, 2, 'Sophie', 3, 10.2, 'Golden'),
(225, 2, 'Lily', 4, 14.7, 'Brown'),
(226, 2, 'Shadow', 7, 18.9, 'Black'),
(241,1, 'Max ', 3, 6.5, 'White'),
(228, 2, 'Coco', 6, 16.3, 'Golden'),
(229,1, 'Milo', 3, 8.9, 'Brown'),
(200,2, 'Rosie', 4, 13.5, 'Black'),
(203, 2, 'Oreo', 5, 11.1, 'White'),
(232,1, 'Sam', 3, 7.8, 'Golden'),
(206, 2, 'Ginger', 7, 19.6, 'Brown'),
(234, 1, 'Penny', 3, 9.3, 'Black'),
(207, 2, 'Rusty', 4, 14.2, 'White'),
(209, 2, 'Jake', 6, 17.7, 'Golden'),
(237, 1, 'Holly', 3, 6.9, 'Brown'),
(212, 2, 'Zeus', 5, 12.5, 'Black'),
(214, 2, 'Sasha', 3, 10.8, 'White'),
(217, 2, 'Sammy', 4, 14.4, 'Golden'),
(219, 2, 'Annie', 7, 19.1, 'Brown'),
(242, 1, 'Ruby', 3, 9.7, 'Black'),
(222, 2, 'Milo', 6, 16.8, 'White'),
(244, 1, 'Leo', 3, 5.5, 'Golden'),
(227, 2, 'Princess', 5, 11.9, 'Brown'),
(246, 1, 'Cody', 3, 9.2, 'Black'),
(220, 2, 'Tucker', 4, 14.8, 'White'),
(210, 2, 'Emma', 7, 18.3, 'Golden'),
(246, 1, 'Lady', 3, 7.6, 'Brown'),
(200, 2, 'Sandy', 5, 13.4, 'Black');

INSERT INTO clientPet VALUES
(7, 519),
(7, 539),
(10, 509),
(10, 537),
(4, 521),
(24, 540),
(24, 519),
(12, 547),
(12, 507),
(22, 523),
(2, 536),
(2, 520),
(17, 503),
(17, 528),
(14, 529),
(13, 512),
(9, 530),
(35, 515),
(32, 535),
(32, 548),
(32, 538),
(6, 518),
(18, 534),
(18, 528),
(19, 506),
(19, 546),
(3, 531),
(15, 501),
(15, 541),
(26, 514),
(26, 524),
(26, 544),
(20, 532),
(29, 549),
(29, 525),
(11, 517),
(8, 502),
(15, 511),
(30, 545),
(30, 505),
(16, 516),
(15, 543),
(15, 533),
(31, 501),
(34, 504),
(21, 527),
(5, 508),
(23, 513),
(27, 510),
(1, 503);

INSERT INTO workschedule (employeeId, startDateTime, endDateTime) VALUES 
(1, '2023-03-01 08:00:00', '2023-03-01 16:00:00'),
(3,'2024-04-01 09:00:00','2024-04-01 17:00:00'),
(4,'2024-04-01 12:00:00','2024-04-01 21:00:00'),
(2,'2024-04-01 16:00:00','2024-04-01 23:00:00'),
(19,'2024-04-02 07:00:00','2024-04-02 14:00:00'),
(21,'2024-04-02 07:00:00','2024-04-02 16:00:00'),
(12,'2024-04-02 07:00:00','2024-04-02 15:00:00'),
(20,'2024-04-02 09:00:00','2024-04-02 17:00:00'),
(11,'2024-04-03 06:00:00','2024-04-03 14:00:00'),
(18,'2024-04-03 07:00:00','2024-04-03 15:00:00'),
(23,'2024-04-03 08:00:00','2024-04-03 16:00:00'),
(22,'2024-04-03 09:00:00','2024-04-03 17:00:00'),
(10,'2024-04-04 06:00:00','2024-04-04 14:00:00'),
(25,'2024-04-04 07:00:00','2024-04-04 16:00:00'),
(24,'2024-04-04 08:00:00','2024-04-04 17:00:00'),
(17, '2024-04-04 09:00:00','2024-04-04 18:00:00'),
(27,'2024-04-05 07:00:00','2024-04-05 16:00:00'),
(9,'2024-04-05 08:00:00','2024-04-05 17:00:00'),
(26,'2024-04-05 09:00:00','2024-04-05 17:00:00'),
(28,'2024-04-05 10:00:00','2024-04-06 18:00:00'),
(29,'2024-04-06 07:00:00','2024-04-06 16:00:00'),
(15,'2024-04-06 08:00:00','2024-04-06 17:00:00'),
(16,'2024-04-06 09:00:00','2024-04-06 18:00:00'),
(33,'2024-04-07 07:00:00','2024-04-07 14:00:00'),
(32,'2024-04-07 07:00:00','2024-04-07 15:00:00'),
(32,'2024-04-07 08:00:00','2024-04-07 17:00:00'),
(30,'2024-04-07 09:00:00','2024-04-07 17:00:00'),
(30,'2024-04-09 07:00:00','2024-04-09 15:00:00'),
(35, '2024-04-09 08:00:00','2024-04-09 16:00:00'),
(34,'2024-04-09 09:00:00','2024-04-09 17:00:00'),
(14,'2024-04-09 10:00:00','2024-04-09 19:00:00'),
(8,'2024-04-09 12:00:00','2024-04-09 20:00:00'),
(37,'2024-04-10 07:00:00','2024-04-10 15:00:00'),
(38,'2024-04-10 08:00:00','2024-04-10 16:00:00'),
(39,'2024-04-10 09:00:00','2024-04-10 17:00:00'),
(40,'2024-04-10 10:00:00','2024-04-10 18:00:00'),
(36,'2024-04-10 13:00:00','2024-04-10 22:00:00'),
(5,'2024-04-11 07:00:00','2024-04-11 16:00:00'),
(6,'2024-04-11 08:00:00','2024-04-11 17:00:00'),
(7,'2024-04-11 09:00:00','2024-04-11 18:00:00');

SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'Employee Name' ,
       e.phone AS 'Employee Phone',
       e.email AS 'Employee Email',
       p.description AS 'Employee Position'
FROM employee AS e
JOIN employeePosition ep ON e.ID = ep.employeeId
JOIN position p ON ep.positionId = p.ID
ORDER BY e.lastName;

SELECT
    p.name AS Name,
    pt.description AS 'Pet Type',
    b.description AS Breed
FROM pet AS p
JOIN breed AS b ON p.breedId = b.ID
JOIN petType AS pt ON p.petTypeId = pt.ID
WHERE pt.description = 'Dog'
ORDER BY p.name;

SELECT
	p.name AS Name,
	pt.description AS 'Pet Type',
    b.description AS Breed
FROM pet AS p
JOIN breed AS b ON p.breedId = b.ID
JOIN petType AS pt ON p.petTypeId = pt.ID
WHERE pt.description = 'Cat'
ORDER BY p.name;

SELECT
    p.name AS 'Pet Name',
    pt.description AS 'Pet Type',
    CONCAT(c.firstName, ' ', c.lastName) AS 'Owner',
    c.phone AS 'Phone Number',
    c.email AS 'Email'
FROM client AS c
JOIN clientPet AS cp ON c.ID = cp.clientId
JOIN pet AS p ON cp.petId = p.ID
JOIN petType AS pt ON p.petTypeId = pt.ID
ORDER BY c.lastName, c.firstName, p.name;      

ALTER TABLE petType RENAME TO pettype;
ALTER TABLE employeePosition RENAME TO employeeposition;
ALTER TABLE clientPet RENAME TO clientpet;
ALTER TABLE cityStateZip RENAME TO citystatezip;

INSERT INTO color (color)
SELECT DISTINCT color FROM pet;

UPDATE pet AS p
JOIN color AS c ON p.color = c.color
SET p.color = c.ID;

ALTER TABLE pet RENAME COLUMN color TO colorId;
ALTER TABLE pet MODIFY COLUMN colorID int NOT NULL;
ALTER TABLE pet ADD FOREIGN KEY (colorID) REFERENCES color (id);

SELECT
    p.name AS 'Name',
    pt.description AS 'Pet Type',
    b.description AS 'Breed',
    c.color AS 'Color'
FROM pet AS p
JOIN breed AS b ON p.breedId = b.ID
JOIN pettype AS pt ON p.petTypeId = pt.ID
JOIN color AS c ON p.colorId = c.ID
WHERE pt.description = 'Dog'
ORDER BY p.name;

SELECT
    p.name AS 'Name',
    pt.description AS 'Pet Type',
    b.description AS 'Breed',
    c.color AS 'Color'
FROM pet AS p
JOIN breed AS b ON p.breedId = b.ID
JOIN pettype AS pt ON p.petTypeId = pt.ID
JOIN color AS c ON p.colorId = c.ID
WHERE pt.description = 'Cat'
ORDER BY p.name;

ALTER TABLE client
DROP FOREIGN KEY client_ibfk_1;

ALTER TABLE client
ADD FOREIGN KEY(zipCode) REFERENCES citystatezip(zipCode) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE clientpet 
DROP FOREIGN KEY clientpet_ibfk_1, 
DROP FOREIGN KEY clientpet_ibfk_2;

ALTER TABLE clientpet
ADD FOREIGN KEY(clientId) REFERENCES client(id) ON UPDATE CASCADE ON DELETE CASCADE, 
ADD FOREIGN KEY(petId) REFERENCES pet(id) ON UPDATE CASCADE ON DELETE CASCADE; 


ALTER TABLE employee
DROP FOREIGN KEY employee_ibfk_1;

ALTER TABLE employee
ADD FOREIGN KEY(zipCode) REFERENCES citystatezip(zipcode) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE employeeposition
DROP FOREIGN KEY employeeposition_ibfk_1, 
DROP FOREIGN KEY employeeposition_ibfk_2;

ALTER TABLE employeeposition
ADD FOREIGN KEY(employeeId) REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE, 
ADD FOREIGN KEY(positionId) REFERENCES position (id) ON UPDATE CASCADE ON DELETE CASCADE;


ALTER TABLE pet
DROP FOREIGN KEY pet_ibfk_1,
DROP FOREIGN KEY pet_ibfk_2,
DROP FOREIGN KEY pet_ibfk_3;


ALTER TABLE pet
ADD FOREIGN KEY(breedId) REFERENCES breed(id) ON UPDATE CASCADE ON DELETE CASCADE, 
ADD FOREIGN KEY(petTypeId) REFERENCES petType(id) ON UPDATE CASCADE ON DELETE CASCADE, 
ADD FOREIGN KEY(colorId) REFERENCES color(id) ON UPDATE CASCADE ON DELETE CASCADE;

DELETE FROM pet WHERE name = 'Bailey' 'Max ' 'Milo';

INSERT INTO timecard(employeeId, sun, mon, tues, wed, thurs, fri, sat) VALUES
(25, 12, 0, 12, 0, 4, 12, 0 ),
(13, 12, 0, 12, 0, 4, 12, 0 ),
(27, 6, 6, 6, 6, 6, 5, 0 ),
(36, 0, 8, 8, 8, 8, 8, 0 ),
(12, 6, 6, 6, 6, 6, 5, 0 ),
(29, 0, 12, 6, 10, 6, 8, 0 ),
(32, 7, 4, 9, 0, 0, 10, 3 ),
(6, 6, 6, 6, 6, 6, 5, 0 ),
(20, 0, 12, 6, 10, 6, 8, 0 ),
(14, 12, 0, 12, 0, 4, 12, 0 ),
(21 , 8, 8, 0, 0, 8, 10, 6 ),
(16 , 10, 8, 0, 0, 8, 10, 10 ),
(34, 0, 8, 8, 8, 8, 8, 0 ),
(9, 10, 8, 0, 0, 8, 10, 10 ),
(39, 10, 8, 0, 0, 8, 10, 10 ),
(30, 8, 8, 0, 0, 8, 10, 6 ),
(38, 12, 0, 12, 0, 4, 12, 0 ),
(37, 0, 12, 6, 10, 6, 8, 0 ),
(7, 0, 12, 6, 10, 6, 8, 0 ),
(1, 7, 4, 9, 0, 0, 10, 3 ),
(40, 0, 12, 6, 10, 6, 8, 0 ),
(15, 8, 8, 0, 0, 8, 10, 6 ),
(2, 8, 8, 0, 0, 8, 10, 6 ),
(31, 6, 6, 6, 6, 6, 5, 0 ),
(11, 12, 0, 12, 0, 4, 12, 0 ),
(24, 12, 0, 12, 0, 4, 12, 0 ),
(35, 10, 8, 0, 0, 8, 10, 10 ),
(28, 0, 8, 8, 8, 8, 8, 0 ),
(8, 7, 4, 9, 0, 0, 10, 3 ),
(17, 6, 6, 6, 6, 6, 5, 0 ),
(18, 10, 8, 0, 0, 8, 10, 10 ),
(23, 0, 8, 8, 8, 8, 8, 0 ),
(3, 7, 4, 9, 0, 0, 10, 3 ),
(4, 6, 6, 6, 6, 6, 5, 0 ),
(10, 0, 12, 6, 10, 6, 8, 0 ),
(26, 0, 8, 8, 8, 8, 8, 0 ),
(22, 0, 8, 8, 8, 8, 8, 0 ),
(23, 10, 8, 0, 0, 8, 10, 10 ),
(5, 8, 8, 0, 0, 8, 10, 6 ),
(19, 0, 8, 8, 8, 8, 8, 0);

SELECT 
    p.name AS 'Pet Name',
    pt.description AS 'Pet Type',
    b.description AS 'Breed',
    CONCAT(c.firstName, ' ', c.lastName) AS 'Owner',
    c.phone AS 'Phone Number',
    c.email AS 'Email'
FROM client AS c
JOIN clientPet AS cp ON c.ID = cp.clientId
JOIN pet AS p ON cp.petId = p.ID
JOIN petType AS pt ON p.petTypeId = pt.ID
LEFT JOIN breed AS b ON p.breedId = b.ID
ORDER BY c.lastName, c.firstName, p.name;

SELECT CONCAT(e.firstName, ' ', e.lastName) As Employee,
	p.description AS Position,
    (t.sun + t.mon + t.tues + t.wed + t.thurs + t.fri + t.sat) AS Hours
FROM employee e, timecard t, position p, employeePosition ep
	WHERE e.id = ep.employeeId
	AND e.id = t.employeeId
    AND p.id = ep.positionId;
    
CREATE VIEW workscheduleview AS SELECT CONCAT(e.firstName, ' ', e.lastName) AS 'Employee Name',
       p.description AS Position,
       w.startDateTime AS Start,
       w.endDateTime AS End
FROM employee e
JOIN workschedule w ON e.id = w.employeeId
JOIN employeeposition ep ON e.id = ep.employeeId
JOIN position p ON p.id = ep.positionId
ORDER BY w.startDateTime, w.endDateTime;

ALTER TABLE pet
MODIFY COLUMN weight DECIMAL(5,1);

SELECT 
	p.name AS 'Pet Name',
    pt.description AS 'Pet Type',
    b.description AS 'Breed',
    p.weight AS 'Weight'
FROM pet AS p
	JOIN breed AS b ON p.breedId = b.ID
	JOIN pettype AS pt ON p.petTypeId = pt.ID
    ORDER BY p.name;
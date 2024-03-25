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
    FOREIGN KEY (positionId) REFERENCES employee(ID)
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

SELECT CONCAT(e.firstName, ' ', e.lastName) AS `Employee Name` ,
       e.phone AS `Employee Phone`,
       e.email AS `Employee Email`,
       p.description AS `Employee Position`
FROM employee AS e
JOIN employeePosition ep ON e.ID = ep.employeeId
JOIN position p ON ep.positionId = p.ID
ORDER BY e.lastName;

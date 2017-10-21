----------------------------------- Users ------------------------------------
CREATE TABLE YelpUser (
    YelpUserID VARCHAR(256) PRIMARY KEY,
    Email VARCHAR(256),
    FirstName VARCHAR(256),
    LastName VARCHAR(256),
    BirthDate VARCHAR(256),
    BirthPlaceCity VARCHAR(256),
    BirthPlaceState VARCHAR(256),
    BirthPlaceZipCode VARCHAR(256),
    Gender VARCHAR(256),
    ProfilePicture BLOB
);

CREATE TABLE YelpFriend (
    YelpFriendID VARCHAR(256) NOT NULL,
    YelpUserID VARCHAR(256),
    Compliment VARCHAR(256), -- Can be NULL
    CanViewRecommendedReviews INTEGER, -- Acts as a boolean
    HasReaction INTEGER, -- Acts as a boolean. Only votes are funny, cool, helpful
    PhotoIDMarkedHelpful INTEGER, -- Acts as a boolean
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID)
);


---------------------------------- Businesses ----------------------------------
CREATE TABLE BusinessCategory (
    BusinessCategoryID VARCHAR(256) PRIMARY KEY,
    Name VARCHAR(256)
);

CREATE TABLE Business (
    BusinessID VARCHAR(256) PRIMARY KEY,
    Name VARCHAR(256),
    Street VARCHAR(256),
    City VARCHAR(256),
    State VARCHAR(256),
    ZipCode VARCHAR(256),
    PhoneNum VARCHAR(256),
    ReviewCount INTEGER,
    BusinessCategoryID VARCHAR(256),
    FOREIGN KEY (BusinessCategoryID) REFERENCES BusinessCategory(BusinessCategoryID)
);

CREATE TABLE Photo (
    PhotoID VARCHAR(256) PRIMARY KEY,
    PhotoDescription VARCHAR (256),
    Location VARCHAR (256),
    BusinessID VARCHAR(256),
    YelpUserID VARCHAR(256),
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID)
);


----------------------------------- Reviews ------------------------------------
CREATE TABLE Review (
    ReviewID VARCHAR(256) PRIMARY KEY,
    Rating INTEGER,
    YelpUserID VARCHAR(256),
    PublishDate VARCHAR(256),
    IsRecommended VARCHAR(256), -- Acts as a boolean
    BusinessID VARCHAR(256),
    NumberOfFunnyReactions INTEGER,
    NumberOfCoolReactions INTEGER,
    NumberOfUsefulReactions INTEGER,
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID),
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID)
);

CREATE TABLE ReviewContent (
    ReviewContentID VARCHAR(256) PRIMARY KEY,
    ContentType VARCHAR(256),
    ContentText VARCHAR(256), -- Will be NULL if content is photo
    ContentPhoto BLOB, -- Will be NULL if content is text
    ReviewID VARCHAR(256),
    FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID)
);


---------------------------- Populate the Tables -------------------------------
INSERT INTO YelpUser VALUES('Y1','john@yahoo.com','John','Smith','33950','LAKE CITY','FL','32056','M',NULL);
INSERT INTO YelpUser VALUES('Y2','juan@gmail.com','Juan','Carlos','32180','Adak','AK','99546','M',NULL);
INSERT INTO YelpUser VALUES('Y3','Jane@gmail.com','Jane','Chapel','29373','VERNON HILLS','IL','60061','F',NULL);
INSERT INTO YelpUser VALUES('Y4','adi@yahoo.com','Aditya','Awasthi','23479','SAN FRANCISCO','CA','94102','M',NULL);
INSERT INTO YelpUser VALUES('Y5','james@hotmail.com','James','Williams','33363','NEW YORK','NY','10010','M',NULL);
INSERT INTO YelpUser VALUES('Y6','mike@yahoo.com','Mike','Brown','32203','CEDAR FALLS','NC','27230','M',NULL);
INSERT INTO YelpUser VALUES('Y7','bob@yahoo.com','Bob','Jones','25618','FISHERS ISLAND','NY','6390','M',NULL);
INSERT INTO YelpUser VALUES('Y8','wei@gmail.com','Wei','Zhang','27471','LAS VEGAS','NV','89030','F',NULL);
INSERT INTO YelpUser VALUES('Y9','mark@gmail.com','Mark','Davis','16743','LOS ANGELES','CA','90007','M',NULL);
INSERT INTO YelpUser VALUES('Y10','daniel@yahoo.com','Daniel ','Garcia','30812','CALDWELL','NJ','7004','M',NULL);
INSERT INTO YelpUser VALUES('Y11','maria@hotmail.com','Maria','Rodriguez','31271','LOS ANGELES','CA','90007','F',NULL);
INSERT INTO YelpUser VALUES('Y12','freya@yahoo.com','Freya','Wilson','33151','CLIFFSIDE PARK','NJ','7010','F',NULL);
INSERT INTO YelpUser VALUES('Y13','kell@gmail.com','Kelley','Abraham','35030','REDONDO BEACH','CA','90278','F',NULL);
INSERT INTO YelpUser VALUES('Y14','xiuying@yahoo.com','Xiuying','Wang','30217','ALLEMAN','IA','50007','F',NULL);
INSERT INTO YelpUser VALUES('Y15','sahil@yahoo.com','Sahil','Gupta','27809','AMHERST','MA','1004','M',NULL);
INSERT INTO YelpUser VALUES('Y16','david@gmail.com','David','Atkinson','33605','SANTA MONICA','CA','90411','M',NULL);
INSERT INTO YelpUser VALUES('Y17','qui@gmail.com','Qui','Liu','28927','CHARLOTTE HALL','MD','20622','F',NULL);
INSERT INTO YelpUser VALUES('Y18','chris@yahoo.com','Chris','Miller','29045','PHOENIX','AZ','85009','M',NULL);
INSERT INTO YelpUser VALUES('Y19','david@yahoo.co.in','David','Johnson','29760','BELLEVUE','NE','68005','M',NULL);
INSERT INTO YelpUser VALUES('Y20','alana@hotmail.com','Alana','Diaz','34227','AMA','LA','70031','F',NULL);
INSERT INTO YelpUser VALUES('Y21','abner@gmail.com','Abner','Harris','33097','SANTA CLARA','CA','95050','M',NULL);
INSERT INTO YelpUser VALUES('Y22','abby@hotmail.com','Abby','Garcia','  14/2/1989','SANTA CLARA','CA','95050','M',NULL);
INSERT INTO YelpUser VALUES('Y23','alana@yahoo.com','Alana','Robinson','30779','Santa Clara','CA','95053','F',NULL);
INSERT INTO YelpUser VALUES('Y24','joanne@yahoo.com','Joanne','Lesniak','30780','Santa Clara','CA','95050','F',NULL);
INSERT INTO YelpUser VALUES('Y25','bethany@gmail.com','Bethany','Hughes','30780','Santa Clara','CA','95051','F',NULL);

INSERT INTO BusinessCategory VALUES('BCT1','Amusement Parks');
INSERT INTO BusinessCategory VALUES('BCT2','Gymnastics');
INSERT INTO BusinessCategory VALUES('BCT3','Architects');
INSERT INTO BusinessCategory VALUES('BCT4','Windshield');
INSERT INTO BusinessCategory VALUES('BCT5','Breakfast and Brunch');
INSERT INTO BusinessCategory VALUES('BCT6','Career Counseling');
INSERT INTO BusinessCategory VALUES('BCT7','Coffee Shops');
INSERT INTO BusinessCategory VALUES('BCT8','Food and More');
INSERT INTO BusinessCategory VALUES('BCT9','Pool Cleaners');
INSERT INTO BusinessCategory VALUES('BCT10','Bars');
INSERT INTO BusinessCategory VALUES('BCT11','Burgers');

INSERT INTO Business VALUES('B1','Big Surf','1500 N McClintock Dr','Tempe','AZ','85281','(520) 622-6400',2,'BCT1');
INSERT INTO Business VALUES('B2','AirBorne COFFEE','1515, Walsh Avenue','Santa Clara','CA','95050','(408) 524-3580',0,'BCT2');
INSERT INTO Business VALUES('B3','Pedley Richard Architect','2231 Schrock Road','Columbus','OH','43229','(419)-244-5200',0,'BCT3');
INSERT INTO Business VALUES('B4','Safelite AutoGlass','2080 West Chandler Blvd.','Chandler','AZ','85224','(520)-465-5225',11,'BCT4');
INSERT INTO Business VALUES('B5','SMITH THOMSON','1595 Spring Hill Road Suite 110','Vienna','VA','22182','(855)-808-1480',1,'BCT5');
INSERT INTO Business VALUES('B6','Bay Area Coffee Shop','1522 W. Sam Rayburn','Bonham','CA','95051','(408)-876 7785',0,'BCT7');
INSERT INTO Business VALUES('B7','China  Coffee Toffee','2570 El Camino Real','Santa Clara','CA','95051','(408)-261-9000',0,'BCT8');
INSERT INTO Business VALUES('B8','Hastings Water Works','10331 Brecksville Rd.','Brecksville','OH','44141','(440)-832-7700',0,'BCT9');
INSERT INTO Business VALUES('B9','Catch Your Big Break','2341 Roosevelt Ct Santa Clara','Santa Clara','CA','95051','(408)-827-8383',0,'BCT6');
INSERT INTO Business VALUES('B10','The Cinebar','2O285 South Western Ave., Suite # 2OO','Torrance','CA','9O5O1','(408)-465-8308',12,'BCT10');
INSERT INTO Business VALUES('B11','Coffee Bar and Bistro','2585 El Camino Real','Santa Clara','CA','95051','(408)-465-8208',1,'BCT10');
INSERT INTO Business VALUES('B12','Renegades','2515, Winceshter Road','Santa Clara','CA','95051','(408)-465-8108',0,'BCT10');
INSERT INTO Business VALUES('B13','Alexs 49er Inn','2232 Schrock Road','Columbus','OH','43229','(419)-465-8018',1,'BCT10');
INSERT INTO Business VALUES('B14','Red Stag Lounge','1031 Brecksville Rd.','Brecksville','OH','44141','(419)-465-8028',1,'BCT10');
INSERT INTO Business VALUES('B15','JJs Blues','331 Brecksville Rd.','Brecksville','OH','44141','(419)-465-8108',0,'BCT10');
INSERT INTO Business VALUES('B16','The Bears Cocktails','15 Spring Hill Road Suite 110','Vienna','VA','22182','(844)-465-8028',1,'BCT10');
INSERT INTO Business VALUES('B17','Trials Pub','95 Spring Hill Road Suite 110','Vienna','VA','22182','(844)-465-8038',0,'BCT10');
INSERT INTO Business VALUES('B18','Santa Cruz Wine Bar','25 Spring Hill Road Suite 110','Vienna','VA','22182','(844)-465-8048',1,'BCT10');
INSERT INTO Business VALUES('B19','Firehouse No 1 Gastropub','1501 N McClintock Dr','Tempe','AZ','85281','(520)-465-8058',1,'BCT10');
INSERT INTO Business VALUES('B20','Original Gravity Public House','1502 N McClintock Dr','Tempe','AZ','85281','(520)-465-8068',0,'BCT10');
INSERT INTO Business VALUES('B21','Hobees','90 Skyport Dr','San Jose','CA','95110','(408)-465-8078',2,'BCT5');
INSERT INTO Business VALUES('B22','Cafe Gourmet','80 N Market St','San Jose','CA','95113','(408)-465-8088',2,'BCT5');
INSERT INTO Business VALUES('B23','The Table','72 S 1st St','San Jose','CA','95113','(408)-465-8908',2,'BCT5');
INSERT INTO Business VALUES('B24','Top Nosh Café','69 N San Pedro St','San Jose','CA','95110','(408)-465-8098',3,'BCT5');
INSERT INTO Business VALUES('B25','Breakfast Place','30 E Santa Clara St','San Jose','CA','95113','(408)-465-8808',2,'BCT5');
INSERT INTO Business VALUES('B26','Cafe Rosalena','87 N San Pedro St','San Jose','CA','95110','(408)-465-8708',2,'BCT5');
INSERT INTO Business VALUES('B27','Southern Kitchen','100 W San Carlos St','San Jose','CA','95113','(408)-465-8608',2,'BCT5');
INSERT INTO Business VALUES('B28','Holders Country Inn','22 N Almaden Ave','San Jose','CA','95110','(408)-465-8508',1,'BCT5');
INSERT INTO Business VALUES('B29','Hobees Restaurant','1110 Willow St','San Jose','CA','95125','(408)-465-8408',1,'BCT5');
INSERT INTO Business VALUES('B30','Cafe San Jose','21 N 2nd St','San Jose','CA','95113','(408)-465-8308',1,'BCT5');
INSERT INTO Business VALUES('B31','Bill of Fare','96 S 1st St','San Jose','CA','95113','(408)-465-8208',1,'BCT5');
INSERT INTO Business VALUES('B32','Bills Cafe','16 S 2nd St','San Jose','CA','95113','(408)-465-8108',1,'BCT5');
INSERT INTO Business VALUES('B33','American Gymnastics Association','5847 San Felipe','Houston','TX','77057','(432)-520-7647',1,'BCT2');
INSERT INTO Business VALUES('B34','Dollamur Sport Surfaces','5850 San Felipe','Houston','TX','77057','(432)-386-3125',1,'BCT2');
INSERT INTO Business VALUES('B35','Connecticut Gymnastics','132 Terry Road','Hartford','CT','6105','(203) 483-5896',1,'BCT2');
INSERT INTO Business VALUES('B36','Sherleys Gymnastics','1132 Terry Road','Hartford','CT','6105','(860) 522-2530',1,'BCT2');
INSERT INTO Business VALUES('B37','In-N-Out Burger','380 South 9th Street','San Jose','CA','95112','(408)-804-8782',1,'BCT11');
INSERT INTO Business VALUES('B38','The Counter Santana Row','350 South 9th Street','San Jose','CA','95112','(408)-804-8783',1,'BCT11');
INSERT INTO Business VALUES('B39','Sliders','320 South 9th Street','San Jose','CA','95112','(408)-804-8784',2,'BCT11');
INSERT INTO Business VALUES('B40','Burger Barn','325 South 8th Street','San Jose','CA','95112','(408)-804-8785',2,'BCT11');
INSERT INTO Business VALUES('B41','The Habit Burger Grill','375 South 9th Street','San Jose','CA','95112','(408)-804-8786',2,'BCT11');
INSERT INTO Business VALUES('B42','Konjoe Burger Bar','355 South 8th Street','San Jose','CA','95112','(408)-804-8787',12,'BCT11');

INSERT INTO Review VALUES('R1',2,'Y1','Oct-02-07 09:11:17 PDT','R','B1',2,2,2);
INSERT INTO Review VALUES('R2',5,'Y4','Oct-02-07 01:31:39 PDT','N','B4',3,2,1);
INSERT INTO Review VALUES('R3',4,'Y2','Oct-02-07 09:10:54 PDT','R','B5',1,2,3);
INSERT INTO Review VALUES('R4',5,'Y3','Oct-02-07 13:05:56 PDT','R','B4',2,3,1);
INSERT INTO Review VALUES('R5',5,'Y6','Sep-29-07 10:38:25 PDT','R','B4',3,1,2);
INSERT INTO Review VALUES('R6',5,'Y12','Sep-29-07 14:30:47 PDT','N','B4',1,4,2);
INSERT INTO Review VALUES('R7',5,'Y5','Sep-29-07 13:52:25 PDT','N','B4',3,2,1);
INSERT INTO Review VALUES('R8',4,'Y2','Sep-28-07 19:46:08 PDT','R','B14',2,3,3);
INSERT INTO Review VALUES('R9',1,'Y1','Sep-29-07 13:45:00 PDT','N','B11',3,1,3);
INSERT INTO Review VALUES('R10',1,'Y2','Sep-30-07 05:12:29 PDT','R','B18',3,1,1);
INSERT INTO Review VALUES('R11',2,'Y1','Sep-29-07 16:06:00 PDT','R','B13',3,3,1);
INSERT INTO Review VALUES('R12',4,'Y1','Oct-02-07 14:28:20 PDT','N','B16',5,2,1);
INSERT INTO Review VALUES('R13',5,'Y2','Sep-27-07 11:00:33 PDT','N','B24',4,5,3);
INSERT INTO Review VALUES('R14',5,'Y14','Oct-02-07 12:45:00 PDT','N','B4',3,3,1);
INSERT INTO Review VALUES('R15',3,'Y1','Sep-29-07 16:08:39 PDT','R','B33',2,2,3);
INSERT INTO Review VALUES('R16',2,'Y1','Sep-29-07 16:45:34 PDT','R','B1',1,2,3);
INSERT INTO Review VALUES('R17',4,'Y2','Sep-25-07 17:18:31 PDT','R','B34',3,1,2);
INSERT INTO Review VALUES('R18',5,'Y3','Sep-25-07 17:15:00 PDT','N','B4',2,1,2);
INSERT INTO Review VALUES('R19',1,'Y1','Oct-01-07 17:15:05 PDT','R','B35',1,2,2);
INSERT INTO Review VALUES('R20',2,'Y2','Sep-30-07 17:15:00 PDT','N','B36',1,1,1);
INSERT INTO Review VALUES('R21',2,'Y2','Oct-25-07 17:15:00 PDT','N','B19',1,1,2);
INSERT INTO Review VALUES('R22',5,'Y4','Sep-26-07 17:15:00 PDT','N','B4',1,1,1);
INSERT INTO Review VALUES('R23',5,'Y6','Sep-26-07 17:15:00 PDT','N','B4',1,1,1);
INSERT INTO Review VALUES('R24',5,'Y7','Sep-27-07 17:15:00 PDT','N','B4',1,1,1);
INSERT INTO Review VALUES('R25',5,'Y4','Sep-28-07 17:15:00 PDT','N','B4',1,1,1);
INSERT INTO Review VALUES('R26',5,'Y12','Oct-29-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R27',5,'Y5','Sep-30-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R28',5,'Y14','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R29',5,'Y6','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R30',5,'Y5','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R31',5,'Y6','Oct-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R32',5,'Y14','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R33',5,'Y6','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R34',5,'Y12','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R35',5,'Y14','Oct-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R36',5,'Y12','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R37',5,'Y12','Sep-25-07 17:15:00 PDT','N','B10',1,1,1);
INSERT INTO Review VALUES('R38',5,'Y13','Oct-25-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R39',5,'Y20','Sep-30-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R40',5,'Y16','Sep-29-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R41',5,'Y3','Sep-28-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R42',5,'Y8','Sep-27-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R43',5,'Y8','Sep-26-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R44',5,'Y10','Sep-25-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R45',5,'Y7','Sep-24-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R46',5,'Y20','Sep-23-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R47',5,'Y17','Sep-22-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R48',5,'Y18','Sep-21-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R49',5,'Y13','Sep-20-07 17:15:00 PDT','N','B21',1,1,1);
INSERT INTO Review VALUES('R50',4,'Y20','Sep-19-07 17:15:00 PDT','N','B22',1,1,1);
INSERT INTO Review VALUES('R51',3,'Y16','Sep-18-07 17:15:00 PDT','N','B23',1,1,1);
INSERT INTO Review VALUES('R52',1,'Y3','Sep-17-07 17:15:00 PDT','N','B24',1,1,1);
INSERT INTO Review VALUES('R53',2,'Y8','Sep-16-07 17:15:00 PDT','N','B25',1,1,1);
INSERT INTO Review VALUES('R54',4,'Y8','Sep-15-07 17:15:00 PDT','N','B26',1,1,1);
INSERT INTO Review VALUES('R55',5,'Y10','Sep-14-07 17:15:00 PDT','N','B27',1,1,1);
INSERT INTO Review VALUES('R56',1,'Y7','Sep-13-07 17:15:00 PDT','N','B28',1,1,1);
INSERT INTO Review VALUES('R57',3,'Y20','Sep-12-07 17:15:00 PDT','N','B29',1,1,1);
INSERT INTO Review VALUES('R58',5,'Y17','Sep-11-07 17:15:00 PDT','N','B30',1,1,1);
INSERT INTO Review VALUES('R59',2,'Y18','Sep-10-07 17:15:00 PDT','N','B31',1,1,1);
INSERT INTO Review VALUES('R60',2,'Y8','Sep-09-07 17:15:00 PDT','N','B32',1,1,1);
INSERT INTO Review VALUES('R61',5,'Y8','Sep-08-07 17:15:00 PDT','N','B21',1,1,1);
INSERT INTO Review VALUES('R62',4,'Y10','Sep-07-07 17:15:00 PDT','N','B22',1,1,1);
INSERT INTO Review VALUES('R63',3,'Y7','Sep-06-07 17:15:00 PDT','N','B23',1,1,1);
INSERT INTO Review VALUES('R64',1,'Y20','Sep-05-07 17:15:00 PDT','N','B24',1,1,1);
INSERT INTO Review VALUES('R65',2,'Y16','Sep-04-07 17:15:00 PDT','N','B25',1,1,1);
INSERT INTO Review VALUES('R66',4,'Y3','Sep-03-07 17:15:00 PDT','N','B26',1,1,1);
INSERT INTO Review VALUES('R67',5,'Y8','Sep-02-07 17:15:00 PDT','N','B27',1,1,1);
INSERT INTO Review VALUES('R68',1,'Y3','Oct-02-07 17:15:00 PDT','N','B37',1,1,1);
INSERT INTO Review VALUES('R69',2,'Y4','Oct-02-07 17:15:00 PDT','N','B38',1,1,1);
INSERT INTO Review VALUES('R70',3,'Y5','Oct-02-07 17:15:00 PDT','N','B39',1,1,1);
INSERT INTO Review VALUES('R71',3,'Y6','May-01-11 17:15:00 PDT','N','B40',1,1,1);
INSERT INTO Review VALUES('R72',4,'Y7','May-02-11 17:15:00 PDT','N','B41',1,1,1);
INSERT INTO Review VALUES('R73',5,'Y8','May-15-07 17:15:00 PDT','N','B42',1,1,1);
INSERT INTO Review VALUES('R74',2,'Y9','Jun-02-11 17:15:00 PDT','N','B39',1,1,1);
INSERT INTO Review VALUES('R75',3,'Y10','Jun-30-11 17:15:00 PDT','N','B40',1,1,1);
INSERT INTO Review VALUES('R76',3,'Y11','Jun-12-11 17:15:00 PDT','N','B41',1,1,1);

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

----------------------------------- Users ------------------------------------
CREATE TABLE YelpUser (
    YelpUserID INTEGER,
    FirstName VARCHAR(256),
    LastName VARCHAR(256),
    BirthDate DATE,
    BirthPlace VARCHAR(256),
    EmailID INTEGER,
    Gender VARCHAR(256),
    ProfilePicture VARBINARY(MAX),

    PRIMARY KEY (YelpUserID),
);

CREATE TABLE YelpFriend (
    YelpFriendID INTEGER NOT NULL,
    YelpUserID INTEGER,
    Compliment VARCHAR(256), -- Can be NULL
    CanViewRecommendedReviews INTEGER, -- Acts as a boolean
    VotedOnReview INTEGER, -- Acts as a boolean. Only votes are funny, cool, helpful
    PhotoIDMarkedHelpful INTEGER, -- Acts as a boolean

    -- Can this Foreign Key stand by itself??
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID)
);


---------------------------------- Businesses ----------------------------------
CREATE TABLE Business (
    BusinessID INTEGER,
    Name VARCHAR(256),
    PhoneNum VARCHAR(256),
    Address VARCHAR(256), -- Split up this address??
    ReviewCount INTEGER,
    BusinessCategoryID INTEGER,

    PRIMARY KEY (BusinessID),
    FOREIGN KEY (BusinessCategoryID) REFERENCES BusinessCategory(BusinessCategoryID),
);

CREATE TABLE Photo (
    PhotoID INTEGER,
    PhotoDescription VARCHAR (256),
    Location VARCHAR (256),
    BusinessID INTEGER,
    YelpUserID INTEGER,

    PRIMARY KEY (PhotoID),
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID), -- don't we need to make sure that the Photo is tied back to the user??
)

CREATE TABLE BusinessCategory (
    BusinessCategoryID INTEGER,
    Name VARCHAR(256),
    Type VARCHAR(256), -- Does this have to be NOT NULL??
    BusinessID INTEGER,

    PRIMARY KEY (BusinessCategoryID),
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID),
);


----------------------------------- Reviews ------------------------------------
CREATE TABLE Review (
    ReviewID INTEGER,
    Rating INTEGER,
    PublishDate DATE,
    IsRecommended INTEGER, -- Acts as a boolean
    YelpUserID INTEGER,
    BusinessID INTEGER,

    PRIMARY KEY (ReviewID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID),
    FOREIGN KEY (BusinessID) REFERENCES Business(BusinessID),
);

-- for ReviewContent ... do we really need to identify the type??
-- Also ... Joey has two ReviewIDs
CREATE TABLE ReviewContent (
    ReviewContentID INTEGER,
    ContentText VARCHAR(256), -- Will be NULL if content is photo
    ContentPhoto VARBINARY(MAX), -- Will be NULL if content is text
    ReviewID INTEGER,

    PRIMARY KEY (ReviewContentID),
    FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID),
);

CREATE TABLE MarkedReview (
    IsRecommendedReview INTEGER, -- Acts as a boolean
    YelpUserID INTEGER,
    ReviewID INTEGER,

    FOREIGN KEY (YelpUserID) REFERENCES YelpUser(YelpUserID),
    FOREIGN KEY (ReviewID) REFERENCES Review(ReviewID),
);

----------------------------------- Queries ------------------------------------

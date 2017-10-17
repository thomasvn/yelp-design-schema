----------------------------------- Users ------------------------------------
CREATE TABLE YelpUser {
    YelpUserID INTEGER,
    FirstName VARCHAR(256),
    LastName VARCHAR(256),
    BirthDate DATE,
    BirthPlace VARCHAR(256),
    EmailID INTEGER,
    Gender VARCHAR(256),

    PRIMARY KEY (YelpUserID),
};

CREATE TABLE YelpFriend {
    YelpFriendID INTEGER,
    YelpUserID INTEGER,
    Compliment VARCHAR(256), -- Can be NULL
    ViewRecommendedReviews INTEGER, -- Acts as a boolean
    VotedReview INTEGER, -- Acts as a boolean
    PhotoIDMarkedHelpful INTEGER, -- Can be NULL
};


---------------------------------- Businesses ----------------------------------
CREATE TABLE Business {
    BusinessID INTEGER,
    Name VARCHAR(256),
    PhoneNum VARCHAR(256),
    Address VARCHAR(256),
    ReviewCount VARCHAR(256),
    BusinessCategoryID INTEGER,
    RecommendedReviewID INTEGER,

    PRIMARY KEY (BusinessID),
    FOREIGN KEY (BusinessCategoryID) REFERENCES BusinessCategory,
    FOREIGN KEY (RecommendedReviewID) REFERENCES RecommendedReview,
};

CREATE TABLE Photo {
    PhotoID INTEGER,
    PhotoDescription VARCHAR (256),
    Location VARCHAR (256),
    BusinessID INTEGER,
    YelpUserID INTEGER,

    PRIMARY KEY (PhotoID),
    FOREIGN KEY (BusinessID) REFERENCES Business,
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser
}

CREATE TABLE BusinessCategory {
    BusinessCategoryID INTEGER,
    Name VARCHAR(256),
    -- How do I inherit all the different types of businesses?
};


----------------------------------- Reviews ------------------------------------
CREATE TABLE RecommendedTextReview {
    ReviewID INTEGER,
    Rating INTEGER,
    PublishDate DATE,
    YelpUserID INTEGER,
    BusinessID INTEGER,
    Content VARCHAR(256),

    PRIMARY KEY (ReviewID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser,
    FOREIGN KEY (BusinessID) REFERENCES Business,
}

CREATE TABLE NotRecommendedTextReview {
    ReviewID INTEGER,
    Rating INTEGER,
    PublishDate DATE,
    YelpUserID INTEGER,
    BusinessID INTEGER,
    Content VARCHAR(256),

    PRIMARY KEY (ReviewID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser,
    FOREIGN KEY (BusinessID) REFERENCES Business,
}

CREATE TABLE RecommendedPhotoReview {
    ReviewID INTEGER,
    Rating INTEGER,
    PublishDate DATE,
    YelpUserID INTEGER,
    BusinessID INTEGER,
    Content VARBINARY(MAX),

    PRIMARY KEY (ReviewID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser,
    FOREIGN KEY (BusinessID) REFERENCES Business,
}

CREATE TABLE NotRecommendedPhotoReview {
    ReviewID INTEGER,
    Rating INTEGER,
    PublishDate DATE,
    YelpUserID INTEGER,
    BusinessID INTEGER,
    Content VARBINARY(MAX),

    PRIMARY KEY (ReviewID),
    FOREIGN KEY (YelpUserID) REFERENCES YelpUser,
    FOREIGN KEY (BusinessID) REFERENCES Business,
}

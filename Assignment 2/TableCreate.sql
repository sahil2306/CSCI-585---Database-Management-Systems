-- See the README.txt file for Table Creation and data insertion.
-- used MySQL for this assignment

-- All Create table Queries
-- use youtube;

CREATE TABLE User (
	id		    INT			NOT NULL	AUTO_INCREMENT,
	name	    VARCHAR(100)		NOT NULL,	
	age		    INT	        NOT NULL,
	email		VARCHAR(100)		NOT NULL,
	address		VARCHAR(255),
	country		VARCHAR(50),

	PRIMARY KEY(ID)
);
ALTER TABLE User AUTO_INCREMENT = 1;

CREATE TABLE Creator (
	user_id		INT		NOT NULL,
	number_of_subscribers	INT,
	
	PRIMARY KEY(user_id),
	FOREIGN KEY(user_id) REFERENCES User(id) 
);

CREATE TABLE Consumer (
	user_id			INT		NOT NULL,
	number_of_subscriptions	INT ,
	
	PRIMARY KEY(user_id),
	FOREIGN KEY(user_id) REFERENCES User(id)
);

CREATE TABLE Channel (
	id		            INT		NOT NULL	AUTO_INCREMENT,
	owner_id		    INT		NOT NULL,
	name		        VARCHAR(100)	NOT NULL,
	creationDate	    DATE,
	creationTime	    TIME,
	number_of_videos	INT ,
	number_of_subscribers INT ,
	
	PRIMARY KEY(ID),
	FOREIGN KEY(owner_id) REFERENCES User(id)
);
ALTER TABLE Channel AUTO_INCREMENT = 1;

CREATE TABLE Subscription(
    subscription_type   VARCHAR(20),
    subscriber_id       INT NOT NULL,
    subscribed_to_id    INT NOT NULL,

	FOREIGN KEY (subscriber_id) REFERENCES User(id),
    FOREIGN KEY (subscribed_to_id) REFERENCES Channel(id),

    PRIMARY KEY (subscriber_id,subscribed_to_id)
);

CREATE TABLE Video (
	id		    INT	    NOT NULL	AUTO_INCREMENT,
	user_id		INT		NOT NULL,
	channel_id	INT		NOT NULL,
	title		VARCHAR(255)	NOT NULL,
	url		    VARCHAR(255)	NOT NULL,
	uploadDate	DATE,
	uploadTime	TIME,
	description	VARCHAR(255),
	duration	INT,
	category	VARCHAR(50),
	
	PRIMARY KEY(id),
	FOREIGN KEY(user_id) REFERENCES User(id),
	FOREIGN KEY(channel_id) REFERENCES channel(id)
);
ALTER TABLE Video AUTO_INCREMENT = 1;

CREATE TABLE Statistics (
	video_id	INT		NOT NULL,
	likes		INT,
	dislikes	INT,
	views		INT,
	
	PRIMARY KEY(video_id),
	FOREIGN KEY(video_id) REFERENCES video(id)
);

CREATE TABLE Sponsor (
	id      INT             NOT NULL	AUTO_INCREMENT,
	name    VARCHAR(100)	NOT NULL,
	phone	VARCHAR(15),
	email	VARCHAR(100),
	address	VARCHAR(255),
	
	PRIMARY KEY(id)
);
ALTER TABLE Sponsor AUTO_INCREMENT = 1;

CREATE TABLE Sponsorship (
	video_id    INT NOT NULL,
	sponsor_id	INT	NOT NULL,
	amount      INT NOT NULL,
	
	PRIMARY KEY(video_id, sponsor_id),
	FOREIGN KEY(video_id) REFERENCES Video(id),
	FOREIGN KEY(sponsor_id) REFERENCES Sponsor(id)
);

CREATE TABLE Comments (
	id		    INT		NOT NULL	AUTO_INCREMENT,
	video_id	INT		NOT NULL,
	user_id		INT		NOT NULL,
	text		LONGTEXT	NOT NULL,
	commentDate DATE,
    commentTime TIME,
    likes		BIGINT UNSIGNED,
	dislikes	BIGINT UNSIGNED,
	sentiment	INT,
	
	PRIMARY KEY(id),
	FOREIGN KEY(video_id) REFERENCES Video(id),
	FOREIGN KEY(user_id) REFERENCES User(id)
);
ALTER TABLE Comments AUTO_INCREMENT = 1;

CREATE TABLE Information (
	video_id	INT		NOT NULL,
	keyword		VARCHAR(100),
	
	PRIMARY KEY(video_id, Keyword),
	FOREIGN KEY(video_id) REFERENCES Video(id)
);

CREATE TABLE Entertainment (
	video_id	INT		NOT NULL,
	tag		    VARCHAR(100),
	
	PRIMARY KEY(video_id, tag),
	FOREIGN KEY(video_id) REFERENCES Video(id)
);

CREATE TABLE VideoViews (
	video_id    INT NOT NULL,
	user_id		INT	NOT NULL,
		
	PRIMARY KEY(video_id, user_id),
	FOREIGN KEY(video_id) REFERENCES Video(id),
	FOREIGN KEY(user_id) REFERENCES User(id)
);
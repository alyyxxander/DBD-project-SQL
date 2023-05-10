
--USERS TABLE--
CREATE TABLE USERS(  
    USER_ID             INT(5),
    USER_LNAME          VARCHAR(15),
    USER_FNAME          VARCHAR(15),
    USER_PHONE          char(11),
    USER_EMAIL          VARCHAR(30),
    USER_GAMERTAG       VARCHAR(25),
    USER_GAMELIST_ID    SMALLINT(5), 
    USER_BLOCKS_ID      INT(5),

    PRIMARY KEY (USER_ID)
);

ALTER TABLE `USERS`
    MODIFY USER_PHONE char(12);

INSERT INTO USERS
    (`USER_ID`, `USER_LNAME`,`USER_FNAME`,`USER_PHONE`,`USER_EMAIL`,`USER_GAMERTAG`, `USER_BLOCKS_ID`,`CHAT_ID`)
VALUES
    (12545, "Smith", "John", "814-555-6969", "smithjohn23@gmail.com", "johnsmith69420",12346,12348),
    (23431, "Johnson", "James","570-555-4200","johnsonjames55@hotmail.com","jamesgames55", 25362,35251),
    (97241, "Williams", "Robert","670-555-1234","williamsrobert99@gmail.com","realrobert500", 63426,25210),
    (78414, "Brown", "David","717-555-0909","browndavid88@gmail.com","dbrown007", 84268,78213),
    (98124, "Jones", "William","814,555-3030","joneswilliam77@hotmail.com","wetwilly11", 64555,81246);





/* TABLE FOR THE USERS FRIENDS */
CREATE OR REPLACE TABLE USER_FRIENDS(
    USER_ID             INT(5),
    USER_FRIENDS_ID     INT(5),

    PRIMARY KEY(USER_FRIENDS_ID),
    FOREIGN KEY(USER_ID) REFERENCES USERS (USER_ID)
);

    INSERT INTO `USER_FRIENDS`(`USER_FRIENDS_ID`,`USER_ID`)
    VALUES
        (12545, 78414),
        (23431, 97241),
        (97241, 98124),
        (78414, 23431),
        (98124, 12545);





/* TABLE FOR THE BLOCKED USERS */
CREATE OR REPLACE TABLE USER_BLOCKS(
    USER_BLOCKS_ID      INT(5),
    USER_ID             INT(5),

    PRIMARY KEY(USER_BLOCKS_ID),
    FOREIGN KEY(USER_ID) REFERENCES USERS (USER_ID)
);

    INSERT INTO `USER_BLOCKS` (`USER_BLOCKS_ID`, `USER_ID`)
    VALUES
        (98124, 23431),
        (97241, 78414),
        (12545, 98124),
        (78414, 23431),
        (23431, 98124);
        




/* TABLE FOR PLATFORM */
CREATE OR REPLACE TABLE PLATFORM(
    PLATFORM_ID             SMALLINT,
    PLATFORM_NAME           char(40),
    USER_ID                 INT,
    PLATFORM_GAMELIST_ID    INT,

    PRIMARY KEY (PLATFORM_ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID)

);
    INSERT INTO `PLATFORM` (`PLATFORM_ID`, `PLATFORM_NAME`, `USER_ID`, `PLATFORM_GAMELIST_ID`)
    VALUES
        (1,"PC",12545,77776),
        (2,"Switch",23431,88811),
        (3,"Xbox Series X",97241,66242),
        (4,"PS5",78414,44432),
        (5,"Switch",98124,33323);





/* TABLE FOR GAME */
CREATE OR REPLACE TABLE GAME(
    GAME_ID         SMALLINT,
    PLATFORM_ID     SMALLINT,
    GAME_TITLE      char(25),
    GAME_GENRE      char(20),
    RELEASE_DATE    DATE,
    AVG_RATING      TINYINT(3),

    PRIMARY KEY (GAME_ID),
    FOREIGN KEY (PLATFORM_ID) REFERENCES PLATFORM (PLATFORM_ID)

);

    INSERT INTO `GAME` (`GAME_ID`,`PLATFORM_ID`,`GAME_TITLE`,`GAME_GENRE`,`RELEASE_DATE`,`AVG_RATING`)
    VALUES
        (1,2,"SUPER MARIO ODYSSEY","PLATFORMER","2017-10-17", 96),
        (2,1,"THE LAST OF US", "ACTION-ADVENTURE","2013-06-14", 70),
        (3,1,"DESTINY 2","FPS","2017-08-28", 80),
        (4,1,"SUBNAUTICA","SURVIVAL","2014-12-16", 40),
        (5,1,"MINECRAFT","SANDBOX","2011-11-18", 100);





/* TABLE FOR USER GAMES LIST */
CREATE OR REPLACE TABLE USER_GAMELIST(
    USER_ID             INT(5),
    GAME_ID             SMALLINT,

    PRIMARY KEY(USER_ID),
    FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID),
    FOREIGN KEY(GAME_ID) REFERENCES GAME(GAME_ID)
);

    INSERT INTO `USER_GAMELIST`(`USER_ID`, `GAME_ID`)
    VALUES
        (12545, 2),
        (23431, 3),
        (97241, 1),
        (78414, 5),
        (98124, 3);





/* TABLE FOR THE USER'S CHAT */
CREATE OR REPLACE TABLE CHAT(
    CHAT_ID         INT,
    MESSAGE_ID      INT,
    USER_ID         INT(5),
    MESSAGE_CONTENT char(255),

    PRIMARY KEY (CHAT_ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID)
);

    INSERT INTO CHAT (CHAT_ID, MESSAGE_ID, USER_ID, MESSAGE_CONTENT)
    VALUES
        (69691, 12223, 12545, "you da goat frfr"),
        (10011, 10012, 23431, "this is the first message ever"),
        (42859, 19042, 97241, "how to i learn to read"),
        (74822, 19984, 78414, "when's dad coming back"),
        (86672, 32819, 98124, "when you get a victory in fortnite"),
        (56432, 20002, 97241, "Dad should have taught you that.");





/* TABLE FOR USER CREATED REVIEWS */
CREATE OR REPLACE TABLE REVIEW(
    REVIEW_ID           SMALLINT,
    USER_ID             INT(5),
    GAME_ID             SMALLINT,
    RATING              TINYINT(3),
    REVIEW_CONTENT      VARCHAR(255),
    DATE_POSTED         DATE,

    PRIMARY KEY (REVIEW_ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID)
);
    INSERT INTO REVIEW(REVIEW_ID, USER_ID, GAME_ID, RATING, REVIEW_CONTENT, DATE_POSTED)
    VALUES
        (10, 12545, 1, 99, "SUPER MARIO ODYSSEY IS A VERY FUN GAME.","2020-06-07"),
        (11, 23431, 5, 85, "This game is fun, but very difficult", "2021-04-04"), 
        (12, 97241, 4, 35, "How do I get my money back for this garbage??", "2015-05-27"),
        (13, 78414, 3, 100, "Most funnest game ever!!!!!", "2010-02-17"),
        (14, 98124, 2, 87, "I love this game, but it's too short", "2019-12-12");






/* TABLE FOR FORUM */
CREATE OR REPLACE TABLE FORUM(
    FORUM_ID            SMALLINT,
    FORUM_NAME          char(50),
    FORUM_DESCRIPTION   char(255),

    PRIMARY KEY (FORUM_ID)
);

    INSERT INTO `FORUM` (`FORUM_ID`,`FORUM_NAME`,`FORUM_DESCRIPTION`)
    VALUES
        (10, "Discussion", "Place to talk with others about anything"),
        (11, "Bug Reporting", "Report on bugs found in certain games"),
        (12, "News", "Keep up to date on the newest game news"),
        (13, "Help", "Seeking help, on game issues"),
        (14, "Social", "Looking for others to play games with");







/* TABLE FOR USER CREATED POSTS */
CREATE OR REPLACE TABLE POST(
    POST_ID    SMALLINT,
    USER_ID         INT(5),
    FORUM_ID        SMALLINT,
    POST_CONTENT    char(255),
    DATE_POSTED     DATE,

    PRIMARY KEY(POST_ID),
    FOREIGN KEY(USER_ID) REFERENCES USERS (USER_ID),
    FOREIGN KEY(FORUM_ID) REFERENCES FORUM(FORUM_ID)
);

    INSERT INTO POST(POST_ID, USER_ID, FORUM_ID, POST_CONTENT, DATE_POSTED)
    VALUES
        (10001, 97241, 10, "I CAN'T BELIEVE THAT A CREEPER BLEW UP MY HOUSE!", "2023-04-05"),
        (10002, 12545, 13, "How do I catch fish in this game?", "2023-05-09"),
        (10003, 98124, 14, "THIS IS A POST THIS IS A POST THIS IS A POST", "2023-01-01"),
        (10004, 78414, 10, "Why do monsters keep breaking into my base?", "2023-12-31"),
        (10005, 23431, 10, "Item duplication glitch found in minecraft", "2022-07-12"),
        (10006, 12545, 12, "The Last of Us Pt1 coming to PC", "2022-07-12");





SELECT * FROM USERS;

SELECT USER_GAMELIST_ID FROM `USER_GAMELIST` WHERE `GAME_ID` = 3;

SELECT USER_ID FROM `PLATFORM` WHERE `PLATFORM_ID` = 4;

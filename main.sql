-- Active: 1679574137028@@151.161.91.21@3306@znb34_GamerDatabase

/* TABLE FOR THE USERS */
CREATE TABLE USERS(  
    USER_ID             INT(5),
    USER_LNAME          VARCHAR(15),
    USER_FNAME          VARCHAR(15),
    USER_PHONE          char(11),
    USER_EMAIL          varchar(30),
    USER_GAMERTAG       varchar(25),
    USER_FRIENDS_ID     INT(5),
    USER_BLOCKS_ID      INT(5),
    CHAT_ID             INT(5),

    PRIMARY KEY (USER_ID)
);

ALTER TABLE `USERS`
    MODIFY USER_PHONE char(12);

INSERT INTO USERS
    (`USER_ID`, `USER_LNAME`,`USER_FNAME`,`USER_PHONE`,`USER_EMAIL`,`USER_GAMERTAG`, `USER_FRIENDS_ID`,`USER_BLOCKS_ID`,`CHAT_ID`)
VALUES
    (12545, "Smith", "John", "814-555-6969", "smithjohn23@gmail.com", "johnsmith69420",12346,12347,12348),
    (23431, "Johnson", "James","570-555-4200","johnsonjames55@hotmail.com","jamesgames55",25362,46475,35251),
    (97241, "Williams", "Robert","670-555-1234","williamsrobert99@gmail.com","realrobert500",63426,13748,25210),
    (78414, "Brown", "David","717-555-0909","browndavid88@gmail.com","dbrown007",84268,30877,78213),
    (98124, "Jones", "William","814,555-3030","joneswilliam77@hotmail.com","wetwilly11",64555,21515,81246);

/* TABLE FOR THE USERS FRIENDS */
CREATE OR REPLACE TABLE USER_FRIENDS(
    USER_FRIENDS_ID     SMALLINT,
    USER_ID             SMALLINT,

    PRIMARY KEY(USER_FRIENDS_ID),
    FOREIGN KEY(USER_FRIENDS_ID) REFERENCES USERS (USER_FRIENDS_ID)
    FOREIGN KEY(USER_ID) REFERENCES USER (USER_ID)
);
    INSERT 
        INTO `USER_FRIENDS` (`USER_FRIENDS_ID`, `USER_ID`)
        VALUES 
            (12346, 12545)
            (23431, 25362)
            (97241, 63426)
            (78414, 84268)
            (98124, 64555)
        ;
/* TABLE FOR USER GAMES LIST */
CREATE OR REPLACE TABLE USER_GAMES(
    USER_GAMES_ID       SMALLINT,
    GAME_ID             SMALLINT,

    PRIMARY KEY(USER_GAMES_ID),
    FOREIGN KEY(GAME_ID) REFERENCES GAME(GAME_ID),

    INSERT
        INTO USER_GAMES (USER_GAMES_ID, GAME_ID)
        VALUES
            (12321,41421)
            (41423,89807)
            (70798,78965)
            (90709,12313)
            (09877,90897)
);

/* TABLE FOR GAME */
CREATE OR REPLACE TABLE GAME(
    GAME_ID         SMALLINT,
    PLATFORM_ID     SMALLINT,
    GAME_TITLE      char(25),
    GAME_GENRE      char(20),
    RELEASE_DATE    DATE,
    AVG_RATING      DECIMAL(2,1),

    PRIMARY KEY (GAME_ID),
    FOREIGN KEY (PLATFORM_ID) REFERENCES PLATFORM (PLATFORM_ID),

    INSERT
        INTO `GAME` (`GAME_ID`,`PLATFORM_ID`,`GAME_TITLE`,`GAME_GENRE`,`RELEASE_DATE`,`AVG_RATING`)
    VALUES
        (1,2,"SUPER MARIO ODYSSEY","PLATFORMER","10272017","96"),
        (2,1,"THE LAST OF US", "ACTION-ADVENTURE","06142013","96"),
        (3,1,"DESTINY 2","FPS","08282017","80"),
        (4,1,"SUBNAUTICA","SURVIVAL","12162014","90"),
        (5,1,"MINECRAFT: JAVA EDITION","SANDBOX","11182011","95")
);

/* TABLE FOR PLATFORM */
CREATE OR REPLACE TABLE PLATFORM(
    PLATFORM_ID             SMALLINT,
    PLATFORM_NAME           char(20),

    PRIMARY KEY (PLATFORM_ID),

    INSERT
        INTO `PLATFORM` (`PLATFORM_ID`, `PLATFORM_NAME`, `USER_ID`, `PLATFORM_GAMELIST_ID`)
    VALUES
        (1,"PC",12346,77776)
        (2,"Switch",23431,88811)
        (3,"Xbox Series X",97241,66242)
        (4,"PS5",78414,44432)
        (2,"Switch",98124,33323)
);

/* TABLE FOR FORUM */
CREATE OR REPLACE TABLE FORUM(
    FORUM_ID        SMALLINT,
    FORUM_NAME      char(50),
    GAME_ID         SMALLINT,
    DATE_POSTED     DATE,

    PRIMARY KEY (FORUM_ID),
    FOREIGN KEY (GAME_ID) REFERENCES GAME (GAME_ID),

    INSERT
        INTO `FORUM` (`FORUM_ID`,`FORUM_NAME`,`USER_ID`,`GAME_ID`,`PLATFORM_ID`,`DATE_POSTED`)
    VALUES
        (34,"I AM STUCK, HELP ME",12346,4646,1,"04052023")
);

/* TABLE FOR THE BLOCKED USERS */
CREATE OR REPLACE TABLE USER_BLOCKS(
    USER_BLOCKS_ID      SMALLINT,
    USER_ID             SMALLINT,

    PRIMARY KEY(USER_BLOCKS_ID),
    FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID)

    INSERT
        INTO USER_BLOCKS (USER_BLOCKS_ID, USER_ID)
        VALUES
            (21312, 12545)
);

/* TABLE FOR THE USER'S CHAT */
CREATE OR REPLACE TABLE CHAT(
    CHAT_ID         SMALLINT,
    MESSAGE_ID      SMALLINT,
    USER_ID         SMALLINT,
    MESSAGE_CONTENT char(255),

    PRIMARY KEY (CHAT_ID),
    FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)

    INSERT
        INTO CHAT (CHAT_ID, MESSAGE_ID, USER_ID, MESSAGE_CONTENT)
        VALUES
            (69691, 90009, 12346, "you da goat frfr")
);

/* TABLE FOR USER CREATED REVIEWS */
CREATE OR REPLACE TABLE REVIEW(
    REVIEW_ID           SMALLINT,
    USER_ID             SMALLINT,
    GAME_ID             SMALLINT,
    RATING              DECIMAL(2,1),
    REVIEW_CONTENT      char(255),
    DATE_POSTED         DATE,

    PRIMARY KEY (REVIEW_ID),
    FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)

    INSERT
        INTO REVIEW(REVIEW_ID, USER_ID, GAME_ID, RATING, REVIEW_CONTENT, DATE_POSTED)
        VALUES
            (1,12346,1,99,"SUPER MARIO ODYSSEY IS A VERY FUN GAME.","2020-06-07")
);

/* TABLE FOR USER CREATED POSTS */
CREATE OR REPLACE TABLE POST(
    USER_POST_ID    SMALLINT,
    USER_ID         SMALLINT,
    POST_CONTENT    char(255),

    PRIMARY KEY(USER_POST_ID),
    FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID),

    INSERT
        INTO POST(USER_POST_ID, USER_ID, POST_CONTENT)
        VALUES
            (1, 12346, "I CAN'T BELIEVE THAT A CREEPER BLEW UP MY HOUSE!")
);

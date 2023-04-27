-- Active: 1679574137028@@151.161.91.21@3306@znb34_GamerDatabase

create or replace Table USER
(
    USER_ID        SMALLINT(5),
    USER_GAMES_ID SMALLINT(5),
    FRIENDLIST_ID   SMALLINT,
    USER_FRIENDS_ID SMALLINT,
    BLOCKLIST_ID    SMALLINT,
    USER_BLOCKS_ID SMALLINT,
    CHAT_ID         SMALLINT,
    USER_LNAME      VARCHAR(15),
    USER_FNAME      VARCHAR(15),
    USER_PHONE      char(8),
    USER_EMAIL      char(25),
    USER_GAMERTAG   char(25),

PRIMARY KEY (USER_ID),
FOREIGN KEY (USER_GAMES_ID) 
        REFERENCES USER (USER_ID)
    
)
;

CREATE OR REPLACE TABLE USER_FRIENDS
(
    USER_FRIENDS_ID     SMALLINT,
    USER_ID             SMALLINT,

    PRIMARY KEY(USER_FRIENDS_ID),
        FOREIGN KEY(USER_ID) REFERENCES USER (USER_ID)
)
;
/* TABLE FOR GAME */
create or replace Table GAME
(
    GAME_ID         SMALLINT,
    PLATFORM_ID     SMALLINT,
    GAME_TITLE      char(25),
    GAME_GENRE      char(20),
    RELEASE_DATE    DATE,
    AVG_RATING      DECIMAL(2,1),

    PRIMARY KEY (GAME_ID),
        FOREIGN KEY (PLATFORM_ID) REFERENCES PLATFORM (PLATFORM_ID)
)
;

/* TABLE FOR PLATFORM */
create or replace TABLE PLATFORM
(
    PLATFORM_ID             SMALLINT,
    USER_ID                 SMALLINT,
    PLATFORM_GAMELIST_ID    SMALLINT,

    PRIMARY KEY (PLATFORM_ID),
    FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)
)
;
/* TABLE FOR FORUM */
create or replace TABLE FORUM
(
    FORUM_ID        SMALLINT,
    USER_ID         SMALLINT,
    GAME_ID         SMALLINT,
    PLATFORM_ID     SMALLINT,
    DATE_POSTED     DATE,

    PRIMARY KEY (FORUM_ID),
    FOREIGN KEY (USER_ID) 
        REFERENCES USER (USER_ID)
    ,
    FOREIGN KEY (GAME_ID) 
        REFERENCES GAME (GAME_ID)
    ,
    FOREIGN KEY (PLATFORM_ID) 
        REFERENCES PLATFORM (PLATFORM_ID)
    
)
;
/* TABLE FOR THE BLOCKED USERS */
CREATE OR REPLACE TABLE USER_BLOCKS
(
    USER_BLOCKS_ID      SMALLINT,
    USER_ID             SMALLINT,

    PRIMARY KEY(USER_BLOCKS_ID),
    FOREIGN KEY(USER_ID) 
        REFERENCES USER(USER_ID)
)
;
CREATE OR REPLACE TABLE CHAT
(
    CHAT_ID SMALLINT,
    MESSAGE_ID SMALLINT,
    USER_ID SMALLINT,
    MESSAGE_CONTENT char(255),

    PRIMARY KEY(CHAT_ID),
    FOREIGN KEY(USER_ID),
        REFERENCES USER(USER_ID)
)
;
CREATE OR REPLACE TABLE REVIEW
(
    REVIEW_ID           SMALLINT,
    USER_ID             SMALLINT,
    GAME_ID             SMALLINT,
    RATING              DECIMAL(2,1),
    REVIEW_CONTENT      char(255),
    DATE_POSTED         DATE,
=======
    PRIMARY KEY (CHAT_ID),
        FOREIGN KEY (USER_ID) REFERENCES USER (USER_ID)

)
;
CREATE OR REPLACE TABLE POST
(
    USER_POST_ID    SMALLINT,
    USER_ID         SMALLINT,
    POST_CONTENT    char(255),

    PRIMARY KEY(USER_POST_ID),
    FOREIGN KEY(USER_ID)
        REFERENCES USER(USER_ID)

)
;
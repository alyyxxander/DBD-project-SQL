/* TABLE FOR USER */
create or replace Table USER
{
    USER_ID             SMALLINT
    USER_GAMES_ID       SMALLINT
    USER_FRIENDS_ID     SMALLINT
    USER_BLOCKS_ID      SMALLINT
    CHAT_ID             SMALLINT
    USER_LNAME          VARCHAR(15)
    USER_FNAME          VARCHAR(15)
    USER_PHONE          char(8)
    USER_EMAIL          char(25)
    USERNAME            char(25)

    PRIMARY KEY (USER_ID)
    FOREIGN KEY (USER_GAMES_ID) REFERENCE USER_GAMES (USER_GAMES_ID)
    FOREIGN KEY (USER_FRIENDS_ID) REFERENCE USER_FRIENDS (USER_FRIENDS_ID)
    FOREIGN KEY (USER_BLOCKS_ID) REFERENCE USER_BLOCKS (USER_BLOCKS_ID)
    FOREIGN KEY (CHAT_ID) REFERENCE CHAT (CHAT_ID)
}

/* TABLE FOR GAME */
create or replace Table GAME
{
    GAME_ID         SMALLINT
    PLATFORM_ID     SMALLINT
    GAME_TITLE      char(25)
    GAME_GENRE      char(20)
    RELEASE_DATE    DATE
    AVG_RATING      DECIMAL(2,1)

    PRIMARY KEY (GAME_ID)
    FOREIGN KEY (PLATFORM_ID) REFERENCE PLATFORM (PLATFORM_ID)
}

/* TABLE FOR PLATFORM */
create or replace TABLE PLATFORM
{
    PLATFORM_ID             SMALLINT
    USER_ID                 SMALLINT
    PLATFORM_GAMELIST_ID    SMALLINT

    PRIMARY KEY (PLATFORM_ID)
    FOREIGN KEY (USER_ID) REFERENCE USER (USER_ID)
}

/* TABLE FOR FORUM */
create or replace TABLE FORUM
{
    FORUM_ID        SMALLINT
    USER_ID         SMALLINT
    GAME_ID         SMALLINT
    PLATFORM_ID     SMALLINT
    DATE_POSTED     DATE

    PRIMARY KEY (FORUM_ID)
    FOREIGN KEY (USER_ID) REFERENCE USER (USER_ID)
    FOREIGN KEY (GAME_ID) REFERENCE GAME (GAME_ID)
    FOREIGN KEY (PLATFORM_ID) REFERENCE PLATFORM (PLATFORM_ID)
}

/* TABLE FOR REVIEW */
create or replace TABLE REVIEW
{
    REVIEW_ID           SMALLINT
    USER_ID             SMALLINT
    GAME_ID             SMALLINT
    PLATFORM_ID         SMALLINT
    RATING              DECIMAL(2,1)
    REVIEW_CONTENT      char(255)
    DATE_POSTED         DATE

    PRIMARY KEY (REVIEW_ID)
    FOREIGN KEY (USER_ID) REFERENCE USER (USER_ID)
    FOREIGN KEY (GAME_ID) REFERENCE GAME (GAME_ID)
    FOREIGN KEY (PLATFORM_ID) REFERENCE PLATFORM (PLATFORM_ID)
}



/* TABLE FOR FRIENDS */
CREATE OR REPLACE TABLE USER_FRIENDS
{
    USER_FRIENDS_ID     SMALLINT
    USER_ID             SMALLINT

    PRIMARY KEY(USER_FRIENDS_ID)
    FOREIGN KEY(USER_ID) REFERENCE USER (USER_ID)
}

/* TABLE FOR THE BLOCKED USERS */
CREATE OR REPLACE TABLE USER_BLOCKS
{
    USER_BLOCKS_ID      SMALLINT
    USER_ID             SMALLINT

    PRIMARY KEY(USER_BLOCKS_ID)
    FOREIGN KEY(USER_ID) REFERENCE USER(USER_ID)
}


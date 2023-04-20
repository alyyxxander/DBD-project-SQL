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


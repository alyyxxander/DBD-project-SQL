create or replace Table USER
{
    USER_ID         SMALLINT
    FRIENDLIST_ID   SMALLINT
    BLOCKLIST_ID    SMALLINT
    CHAT_ID         SMALLINT
    USER_LNAME      VARCHAR(15)
    USER_FNAME      VARCHAR(15)
    USER_PHONE      char(8)
    USER_EMAIL      char(25)
    USER_GAMERTAG   char(25)
}

--CREATES A VIEW BASED ON THE UERS--
CREATE VIEW userView
AS
SELECT USER_ID, USER_FNAME, USER_LNAME FROM USERS;

--CREATES A VIEW BASED ON THE GAMES
CREATE VIEW gameView
AS 
SELECT GAME_TITLE, GAME_GENRE, RELEASE_DATE FROM GAME;

--View that shows us the platform and what game relates to said platform--
CREATE VIEW platformView
AS
SELECT PLATFORM.PLATFORM_NAME, GAME.`GAME_TITLE`
FROM `PLATFORM`
JOIN `GAME` ON PLATFORM.`PLATFORM_ID` = GAME.`PLATFORM_ID`;

--View that shows the game title along with the rating content and the rating--
CREATE VIEW reviewView
AS
SELECT GAME.`GAME_TITLE`, REVIEW.`REVIEW_CONTENT`, REVIEW.`RATING`
FROM `REVIEW`
RIGHT JOIN `GAME` ON REVIEW.`GAME_ID` = GAME.GAME_ID;


CREATE VIEW postView
AS
SELECT FORUM.FORUM_NAME, POST.POST_CONTENT, POST.`DATE_POSTED`
FROM `POST`
JOIN FORUM ON FORUM.`FORUM_ID` = POST.`FORUM_ID`;


CREATE VIEW chatView
AS
SELECT USERS.`USER_FNAME`, USERS.`USER_LNAME`, CHAT.`MESSAGE_CONTENT`
FROM `USERS`
JOIN `CHAT` ON USERS.USER_ID = CHAT.USER_ID;


CREATE VIEW friendVIEW
AS
SELECT USERS.`USER_ID`,USERS.`USER_FNAME`, `USER_FRIENDS`.`USER_FRIENDS_ID`
FROM `USER_FRIENDS`
JOIN `USERS` ON USERS.`USER_ID` = `USER_FRIENDS`.`USER_ID`;


CREATE VIEW blockedView
AS
SELECT USERS.`USER_ID`, USERS.`USER_FNAME`, USER_BLOCKS.`USER_BLOCKS_ID`
FROM `USER_BLOCKS`
JOIN `USERS` on USERS.`USER_ID` = USER_BLOCKS.`USER_ID`;

CREATE TABLE PERSON(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    EMAIL NVARCHAR(100) NOT NULL,
)

CREATE TABLE USER_PASS_HISTORY(
    PASSWORD VARCHAR(1000),
    USER_ID INT ,
    DATE_MODIFIED DATETIME,
    FOREIGN KEY (USER_ID) REFERENCES PERSON(ID)
)



SELECT * from PERSON
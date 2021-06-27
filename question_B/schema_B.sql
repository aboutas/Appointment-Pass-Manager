DROP TABLE USER_PASS_HISTORY
DROP TABLE PERSON

CREATE TABLE PERSON(
    ID INT PRIMARY KEY,
    PASSWORD NVARCHAR(100))
   
CREATE TABLE USER_PASS_HISTORY(
    HISTORY_ID INT,
    USER_ID INT FOREIGN KEY REFERENCES PERSON(ID),
    OLD_PASSWORD NVARCHAR(100) NOT NULL,
    DATE_MODIFIED DATETIME NOT NULL 
)

DROP TRIGGER IF EXISTS new_pass_insert;
GO
CREATE TRIGGER new_pass_insert ON PERSON AFTER UPDATE
AS BEGIN
DECLARE @user_id int  , @old_pass NVARCHAR(100)
    SELECT @user_id = PERSON.ID  , @old_pass = PERSON.PASSWORD FROM PERSON
    INSERT INTO USER_PASS_HISTORY VALUES((SELECT MAX(HISTORY_ID) FROM USER_PASS_HISTORY) +1 , @user_id  , @old_pass, GETDATE());      
END; 

GO
DROP FUNCTION check_length

GO
CREATE FUNCTION check_length (
    @input NVARCHAR(100) 
)
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @out AS VARCHAR(5); 
    SELECT @out =  CASE  
        WHEN LEN(@input) < 8 THEN 'False'
        ELSE 'True'
    END ;
	RETURN @out      
END
GO

GO
CREATE FUNCTION check_low_upper_case(
    @input NVARCHAR(100) 
)
RETURNS VARCHAR(5)
AS
BEGIN
 DECLARE @out AS VARCHAR(5);
    SELECT @out =  CASE  
        WHEN @input  COLLATE Latin1_General_BIN like  '%[0-9]%' 
            and @input COLLATE Latin1_General_BIN like '%[A-Z]%'
            and @input COLLATE Latin1_General_BIN like '%[a-z]%' THEN 'True'
        ELSE 'False'
    END ;
    RETURN @out     
END

GO

DROP FUNCTION check_history_passwords

GO

CREATE FUNCTION check_history_passwords(
    @user_id INT,
    @pass NVARCHAR(100) 
)

RETURNS VARCHAR(5)

AS
BEGIN
    DECLARE @out AS VARCHAR(5);
    DECLARE @cnt AS INT;

    SET @cnt = (
        SELECT COUNT(*) FROM (
            SELECT TOP(6) OLD_PASSWORD FROM USER_PASS_HISTORY 
                WHERE USER_PASS_HISTORY.USER_ID = @user_id
                ORDER BY USER_PASS_HISTORY.DATE_MODIFIED DESC
        )
        as last_six 
        WHERE last_six.OLD_PASSWORD = @pass
    );

    SELECT @out = 
    CASE
        WHEN @cnt > 0 THEN 'False'
        ELSE 'True'
    END;

	RETURN @out  

END
GO
DROP FUNCTION validate_password
GO

CREATE FUNCTION validate_password (
    @user_id INT,
    @pass NVARCHAR(100) 
)
RETURNS INT
AS
BEGIN
   DECLARE @out AS INT; 
        SELECT @out = 
    CASE
        WHEN dbo.check_history_passwords(@user_id, @pass) = 'False' THEN 1
        WHEN dbo.check_length( @pass) = 'False' THEN 2
        WHEN dbo.check_low_upper_case( @pass) = 'False' THEN 3
        ELSE
            0
	END	; 
	RETURN @out;     
END
GO

-- Select dbo.validate_password(1, '!265@AcbdA&')
-- Select dbo.validate_password(1, '265')
-- Select dbo.validate_password(1, '265555555')
-- Select dbo.validate_password(1, 'AA')

-- SELECT * FROM PERSON
-- SELECT * FROM USER_PASS_HISTORY



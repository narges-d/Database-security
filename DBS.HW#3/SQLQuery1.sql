USE DBSShirazu
GO


CREATE TABLE DBSHW3Table
(
 [ID] int,
 [Family] varchar(50),
 [Degree] varchar(50)
)
INSERT INTO DBSHW3Table VALUES (1,'Sarabi','A')
INSERT INTO DBSHW3Table VALUES (2,'Vahdati','A')
INSERT INTO DBSHW3Table VALUES (3,'Kamangar','A')
INSERT INTO DBSHW3Table VALUES (4,'Vakili','B')
INSERT INTO DBSHW3Table VALUES (5,'Ravaghi','B')
INSERT INTO DBSHW3Table VALUES (6,'Bastami','B')
INSERT INTO DBSHW3Table VALUES (7,'Navabi','A')
GO
CREATE USER A WITHOUT LOGIN;
CREATE USER B WITHOUT LOGIN;
CREATE USER DBA WITHOUT LOGIN;
GO
GRANT SELECT ON DBSHW3Table TO DBA;
GRANT SELECT ON DBSHW3Table TO B;
GRANT SELECT ON DBSHW3Table TO A;
GO

CREATE SCHEMA Security;
GO
CREATE FUNCTION Security.tvf_securitypresicate(@UDegree AS nvarchar(50))
    RETURNS TABLE
WITH SCHEMABINDING
AS
    RETURN SELECT 1 AS tvf_securitypresicate_result
   
    WHERE @UDegree = USER_NAME() 
    OR USER_NAME() = 'DBA'; 
GO
CREATE SECURITY POLICY UserFilter
ADD FILTER PREDICATE security.tvf_securitypresicate(Degree)
ON dbo.DBSHW3Table
WITH (STATE = ON);
GO
GRANT SELECT ON Security.tvf_securitypresicate TO DBA;
GRANT SELECT ON Security.tvf_securitypresicate TO B;
GRANT SELECT ON Security.tvf_securitypresicate TO A;
GO
EXECUTE AS USER = 'A';  
SELECT * FROM DBSHW3Table;
REVERT;
EXECUTE AS USER = 'B';  
SELECT * FROM DBSHW3Table;
REVERT;
EXECUTE AS USER = 'DBA';  
SELECT * FROM DBSHW3Table;
REVERT;
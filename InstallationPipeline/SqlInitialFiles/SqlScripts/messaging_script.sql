ALTER DATABASE CURRENT SET COMPATIBILITY_LEVEL = 130;
GO

DROP USER IF EXISTS [PlaceHolderForUser]
GO

CREATE USER [PlaceHolderForUser] WITH PASSWORD = 'PlaceHolderForPassword';
GO

EXEC sp_addrolemember 'db_datareader', [PlaceHolderForUser];
EXEC sp_addrolemember 'db_datawriter', [PlaceHolderForUser];
GO

GRANT EXECUTE TO [PlaceHolderForUser];
GRANT CONNECT TO [PlaceHolderForUser];
GRANT CREATE TABLE TO [PlaceHolderForUser];
GRANT ALTER ON SCHEMA::dbo TO [PlaceHolderForUser];
GO 
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
GO 


GRANT SELECT ON SCHEMA :: __ShardManagement TO [PlaceHolderForUser]
GRANT EXECUTE ON SCHEMA :: __ShardManagement TO [PlaceHolderForUser]
GO



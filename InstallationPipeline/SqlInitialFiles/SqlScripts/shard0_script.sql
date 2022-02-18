ALTER DATABASE CURRENT SET COMPATIBILITY_LEVEL = 130;
GO

ALTER DATABASE CURRENT SET CHANGE_TRACKING = ON;
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


EXEC [xdb_collection].[GrantLeastPrivilege] @UserName = 'PlaceHolderForUser';
GO
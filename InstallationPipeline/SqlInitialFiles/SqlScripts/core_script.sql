ALTER DATABASE CURRENT SET COMPATIBILITY_LEVEL = 130;
GO

DROP USER IF EXISTS [PlaceHolderForUser]
GO

CREATE USER [PlaceHolderForUser] WITH PASSWORD = 'PlaceHolderForPassword';
GO

EXEC sp_addrolemember 'db_datareader', [PlaceHolderForUser];
EXEC sp_addrolemember 'db_datawriter', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Membership_BasicAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Membership_FullAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Membership_ReportingAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Profile_BasicAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Profile_FullAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Profile_ReportingAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Roles_BasicAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Roles_FullAccess', [PlaceHolderForUser];
EXEC sp_addrolemember 'aspnet_Roles_ReportingAccess', [PlaceHolderForUser];
GO

GRANT EXECUTE TO [PlaceHolderForUser];
GRANT CONNECT TO [PlaceHolderForUser];
GO 

DROP USER IF EXISTS [PlaceHolderForSecUser]
GO

CREATE USER [PlaceHolderForSecUser] WITH PASSWORD = 'PlaceHolderForSecPassword';
GO

EXEC sp_addrolemember 'db_datareader', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'db_datawriter', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Membership_BasicAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Membership_FullAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Membership_ReportingAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Profile_BasicAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Profile_FullAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Profile_ReportingAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Roles_BasicAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Roles_FullAccess', [PlaceHolderForSecUser];
EXEC sp_addrolemember 'aspnet_Roles_ReportingAccess', [PlaceHolderForSecUser];
GO

GRANT EXECUTE TO [PlaceHolderForSecUser];
GRANT CONNECT TO [PlaceHolderForSecUser];
GO 
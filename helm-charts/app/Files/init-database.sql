USE master
GO

IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = '$(DatabaseName)'
)
CREATE DATABASE [$(DatabaseName)]
GO

USE [$(DatabaseName)]
GO

CREATE LOGIN [$(OwnerUserName)]
    WITH PASSWORD = '$(OwnerUserPassword)';

CREATE USER [$(OwnerUserName)] FOR LOGIN [$(OwnerUserName)]
    WITH DEFAULT_SCHEMA = [dbo];  
GO

ALTER ROLE db_owner ADD MEMBER [$(OwnerUserName)]
GO

CREATE LOGIN [$(ConnectUserName)] 
    WITH PASSWORD = '$(ConnectUserPassword)';

CREATE USER [$(ConnectUserName)] FOR LOGIN [$(ConnectUserName)]
    WITH DEFAULT_SCHEMA = [dbo]; 
GO

ALTER ROLE db_datawriter ADD MEMBER [$(ConnectUserName)]
GO

ALTER ROLE db_datareader ADD MEMBER [$(ConnectUserName)]
GO
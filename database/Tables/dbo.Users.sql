CREATE TABLE [dbo].[Users]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Username] NVARCHAR(100) NOT NULL, 
    [Email] NVARCHAR(50) NOT NULL, 
    [FirstName] NVARCHAR(100) NULL, 
    [LastName] NVARCHAR(100) NULL, 
    CONSTRAINT [AK_Users_Username] UNIQUE ([Username]), 
    CONSTRAINT [AK_Users_Email] UNIQUE ([Email])
)

GO

CREATE UNIQUE INDEX [IX_Users_Id] ON [dbo].[Users] (Id)
GO

CREATE UNIQUE INDEX [IX_Users_Usersname] ON [dbo].[Users] (Username)
GO

CREATE UNIQUE INDEX [IX_Users_Email] ON [dbo].[Users] (Email)
GO

EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Идентификатор',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Users',
    @level2type = N'COLUMN',
    @level2name = N'Id'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Никнейм',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Users',
    @level2type = N'COLUMN',
    @level2name = N'Username'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Email',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Users',
    @level2type = N'COLUMN',
    @level2name = N'Email'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Имя',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Users',
    @level2type = N'COLUMN',
    @level2name = N'FirstName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'Фамилия',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'Users',
    @level2type = N'COLUMN',
    @level2name = N'LastName'
GO
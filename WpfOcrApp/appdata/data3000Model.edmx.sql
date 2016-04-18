
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 04/18/2016 23:43:34
-- Generated from EDMX file: C:\Users\coskun\Documents\GitHub\WpfOcrApp\WpfOcrApp\appdata\data3000Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [data3000];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Corrections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Corrections];
GO
IF OBJECT_ID(N'[dbo].[Folyo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Folyo];
GO
IF OBJECT_ID(N'[dbo].[Katalog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Katalog];
GO
IF OBJECT_ID(N'[dbo].[Notices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Notices];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Corrections'
CREATE TABLE [dbo].[Corrections] (
    [Id] int  NOT NULL,
    [CorrectionId] int  NULL,
    [MapId] int  NULL,
    [Notices_Id] int  NOT NULL,
    [Folyo_Id] int  NOT NULL
);
GO

-- Creating table 'Folyo'
CREATE TABLE [dbo].[Folyo] (
    [Id] int  NOT NULL,
    [MapNumber] nvarchar(50)  NULL,
    [MapTittle] nvarchar(50)  NULL,
    [CorrId] int  NULL
);
GO

-- Creating table 'Katalog'
CREATE TABLE [dbo].[Katalog] (
    [Id] int  NOT NULL,
    [MapNumber] nvarchar(50)  NULL,
    [MapTittle] nvarchar(255)  NULL,
    [MapScale] nvarchar(50)  NULL,
    [EditionDate] datetime  NULL,
    [MapFolio] nvarchar(10)  NULL,
    [MapDisk] nvarchar(10)  NULL,
    [Comments] nvarchar(max)  NULL
);
GO

-- Creating table 'Notices'
CREATE TABLE [dbo].[Notices] (
    [Id] int  NOT NULL,
    [NoticeNumber] nvarchar(50)  NULL,
    [WeekNo] int  NULL,
    [YearNo] int  NULL,
    [Comment] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Corrections'
ALTER TABLE [dbo].[Corrections]
ADD CONSTRAINT [PK_Corrections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Folyo'
ALTER TABLE [dbo].[Folyo]
ADD CONSTRAINT [PK_Folyo]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Katalog'
ALTER TABLE [dbo].[Katalog]
ADD CONSTRAINT [PK_Katalog]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Notices'
ALTER TABLE [dbo].[Notices]
ADD CONSTRAINT [PK_Notices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Notices_Id] in table 'Corrections'
ALTER TABLE [dbo].[Corrections]
ADD CONSTRAINT [FK_NoticesCorrections]
    FOREIGN KEY ([Notices_Id])
    REFERENCES [dbo].[Notices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NoticesCorrections'
CREATE INDEX [IX_FK_NoticesCorrections]
ON [dbo].[Corrections]
    ([Notices_Id]);
GO

-- Creating foreign key on [Folyo_Id] in table 'Corrections'
ALTER TABLE [dbo].[Corrections]
ADD CONSTRAINT [FK_FolyoCorrections]
    FOREIGN KEY ([Folyo_Id])
    REFERENCES [dbo].[Folyo]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FolyoCorrections'
CREATE INDEX [IX_FK_FolyoCorrections]
ON [dbo].[Corrections]
    ([Folyo_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
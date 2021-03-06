/*
This is the database that is used in the Forms over Data video series samples on MSDN:
http://msdn.microsoft.com/en-us/vbasic/bb466226.aspx
IMPORTANT: 
	Make sure the file locations in the CREATE DATABASE command below are correct before 
	running this script. You will need SQL Server 2005 Express or higher.	
	
	From an elevated command prompt, type: 
	>sqlcmd -S [servername]\[instancename] -i [scriptname]
	
	Where [servername] is the name of the database server, for local server use dot (.)
	Where [instancename] is then name of the SQL server instance that you have admin access to. 
	Where [scriptname] is the path and name of this .sql script
	
	For example, to install on the default SQL Express instance:
	>sqlcmd -S .\SQLExpress -i "C:\MyScripts\CreateDatabaseOMS.sql"
	
	For more information on sqlcmd: http://msdn.microsoft.com/en-us/library/ms170207.aspx
*/
USE [master]
GO

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE OMS
  ON PRIMARY (NAME = N''OMS'', FILENAME = N''' + @device_directory + N'OMS.mdf'')
  LOG ON (NAME = N''OMS_log'',  FILENAME = N''' + @device_directory + N'OMS_log.ldf'')')
go

USE [OMS]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 04/30/2009 11:23:04 ******/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[Modified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Product] ON
INSERT [dbo].[Product] ([ProductID], [Name], [Description]) VALUES (1, N'Red Bull', N'This drink gives you wings.')
INSERT [dbo].[Product] ([ProductID], [Name], [Description]) VALUES (2, N'Orange Juice', N'This drink goes better with Red Bull.')
INSERT [dbo].[Product] ([ProductID], [Name], [Description]) VALUES (3, N'BBQ Chicken', N'Yummy chicken for your tummy.')
INSERT [dbo].[Product] ([ProductID], [Name], [Description]) VALUES (4, N'Oreos', N'Cookie sandwiches with chocolate and cream.')
INSERT [dbo].[Product] ([ProductID], [Name], [Description]) VALUES (5, N'Apples', N'From Washington')
SET IDENTITY_INSERT [dbo].[Product] OFF
/****** Object:  Table [dbo].[Customer]    Script Date: 04/30/2009 11:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](25) NULL,
	[State] [char](2) NULL,
	[ZIP] [varchar](10) NULL,
	[Modified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Customer] ON
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (1, N'Massi', N'Elizabeth', N'123 Main Street', N'Seattle', N'WA', N'98052')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (3, N'Charles', N'Thomson', N'6500 East Grant Road', N'Seattle', N'WA', N'98052')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (4, N'Silver', N'Amanda', N'44 West Elm Street', N'Seattle', N'WA', N'98101')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (5, N'Vick', N'Paul', N'242 Mission Ave', N'Kirkland', N'WA', N'98033')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (6, N'Griver', N'Alan', N'56 NE 167th', N'Bellevue', N'WA', N'98004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (8, N'Ford', N'Sara', N'Blue Ridge Mall', N'Waveland', N'CA', N'98765')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (9, N'Smith', N'Fred', N'123 Main Street', N'Walnut Creek', N'CA', N'94595')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (11, N'Kelley', N'Jeremy', N'123 Main Street', N'Seattle', N'CA', NULL)
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (13, N'Abercrombie', N'Kim111', N'Tanger Factory', N'Branch', N'MI', N'55056')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (15, N'Adams', N'Jay', N'Blue Ridge Mall', N'Kansas City', N'MI', N'64106')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (16, N'Agcaoili', N'Samuel', N'No. 25800-130 King Street West', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (17, N'Ahlering', N'Robert', N'6500 East Grant Road', N'Tucson', N'AR', N'85701')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (18, N'Alan', N'Stanley', N'567 Sw Mcloughlin Blvd', N'Milwaukie', N'OR', N'97222')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (19, N'Alberts', N'Amy', N'252851 Rowan Place', N'Richmond', N'BR', N'V6B 3P7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (20, N'Alcorn', N'Paul', N'White Mountain Mall', N'Rock Springs', N'WY', N'82901')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (22, N'Alderson', N'Gregory', N'26910 Indela Road', N'Montreal', N'QU', N'H1Y 2H5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (23, N'Alexander', N'Mary', N'2345 West Spencer Road', N'Lynnwood', N'WA', N'98036')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (24, N'Alexander', N'Michelle', N'22589 West Craig Road', N'North Las Vegas', N'NE', N'89030')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (25, N'Allen', N'Marvin', N'First Colony Mall', N'Sugar Land', N'TE', N'77478')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (26, N'Allison', N'Cecil', N'254 Colonnade Road', N'Nepean', N'ON', N'K2J 2W5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (27, N'Alpuerto', N'Oscar', N'Rocky Mountain Pines Outlet', N'Loveland', N'CO', N'80537')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (28, N'Amland', N'Maxwell', N'Suite 99320 255 - 510th Avenue S.W.', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (29, N'Antrim', N'Ramona', N'998 Forest Road', N'Saginaw', N'MI', N'48601')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (30, N'Armstrong', N'Thomas', N'Fox Hills', N'Culver City', N'CA', N'90232')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (31, N'Arthur', N'John', N'2345 North Freeway', N'Houston', N'TE', N'77003')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (32, N'Ashton', N'Chris', N'70 N.W. Plaza', N'Saint Ann', N'MI', N'63074')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (34, N'Avalos', N'Robert', N'700 Bureau Road', N'Montreal', N'QU', N'H1Y 2H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (35, N'Ayers', N'Stephen', N'2533 Eureka Rd.', N'Southgate', N'MI', N'48195')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (36, N'Bailey', N'James', N'Southgate Mall', N'Missoula', N'MO', N'59801')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (37, N'Baldwin', N'Douglas', N'Horizon Outlet Center', N'Holland', N'MI', N'49423')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (38, N'Banack', N'Wayne', N'48255 I-10 E. @ Eastpoint Blvd.', N'Baytown', N'TE', N'77520')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (39, N'Barker', N'Robert', N'6789 Warren Road', N'Westland', N'MI', N'48185')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (40, N'Barnhill', N'Josh', N'25 First Canadian Place', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (41, N'Barzdukas', N'Gytis', N'25900-700-9th Ave S.W.', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (42, N'Beasley', N'Shaun', N'2500-622 5th Ave Sw', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (43, N'Beaver', N'John', N'1318 Lasalle Street', N'Bothell', N'WA', N'98011')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (45, N'Beck', N'Christopher', N'93-2501, Blackfriars Road,', N'London', N'EN', N'SE1 8HL')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (46, N'Beebe', N'Ann', N'25537 Hillside Avenue', N'Victoria', N'BR', N'V8V')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (47, N'Benson', N'Edna', N'Po Box 8035996', N'Dallas', N'TE', N'75201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (48, N'Benson', N'Payton', N'997000 Telegraph Rd.', N'Southfield', N'MI', N'48034')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (49, N'Berger', N'Alexander', N'253711 Mayfield Place, Unit 150', N'Richmond', N'BR', N'V6B 3P7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (50, N'Berger', N'John', N'5700 Explorer Drive', N'Mississauga', N'ON', N'L4W 5J3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (51, N'Bernacchi', N'Robert', N'2681 Eagle Peak', N'Bellevue', N'WA', N'98004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (52, N'Bernacchi', N'Robert', N'25915 140th Ave Ne', N'Bellevue', N'WA', N'98004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (53, N'Berndt', N'Matthias', N'Escondido', N'Escondido', N'CA', N'92025')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (54, N'Bischoff', N'Jimmy', N'3065 Santa Margarita Parkway', N'Trabuco Canyon', N'CA', N'92679')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (55, N'Black', N'Mae', N'Redford Plaza', N'Redford', N'MI', N'48239')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (56, N'Blackwell', N'Jackie', N'2575 Bloor Street East', N'Toronto', N'ON', N'M4B 1V6')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (57, N'Blanco', N'Daniel', N'Suite 800 2530 Slater Street', N'Ottawa', N'ON', N'K4B 1T7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (58, N'Blanton', N'Donald', N'Corporate Office', N'El Segundo', N'CA', N'90245')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (59, N'Blythe', N'Michael', N'9903 Highway 6 South', N'Houston', N'TE', N'77003')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (60, N'Bockenkamp', N'Gabriel', N'67 Rainer Ave S', N'Renton', N'WA', N'98055')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (61, N'Bonifaz', N'Luis', N'72502 Eastern Ave.', N'Bell Gardens', N'CA', N'90201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (62, N'Booth', N'Cory', N'Eastern Beltway Center', N'Las Vegas', N'NE', N'89106')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (63, N'Boseman', N'Randall', N'2500 North Stemmons Freeway', N'Dallas', N'TE', N'75201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (64, N'Bowen', N'Eli', N'63 West Beaver Creek', N'Richmond Hill', N'ON', N'L4E 3M5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (65, N'Bowman', N'Lester', N'770 Notre Datme Quest Bureau 800', N'Montreal', N'QU', N'H1Y 2H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (66, N'Brandon', N'Cornelius', N'789 West Alameda', N'Westminster', N'CO', N'80030')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (67, N'Bready', N'Richard', N'4251 First Avenue', N'Seattle', N'WA', N'98104')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (68, N'Bremer', N'Ted', N'Bldg. 9n/99298', N'Redmond', N'WA', N'98052')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (69, N'Brewer', N'Alan', N'4255 East Lies Road', N'Carol Stream', N'IL', N'60188')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (70, N'Brian', N'Walter', N'25136 Jefferson Blvd.', N'Culver City', N'CA', N'90232')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (71, N'Bright', N'Christopher', N'Washington Square', N'Portland', N'OR', N'97205')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (72, N'Brooks', N'John', N'99-3 Forest Works', N'London', N'EN', N'E17 6JF')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (73, N'Brooks', N'Willie', N'Holiday Village Mall', N'Great Falls', N'MO', N'59401')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (74, N'Brown', N'Jo', N'250000 Eight Mile Road', N'Detroit', N'MI', N'48226')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (75, N'Brown', N'Robert', N'250880 Baur Blvd', N'Saint Louis', N'MI', N'63103')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (76, N'Brown', N'Steven', N'5500 Grossmont Center Drive', N'La Mesa', N'CA', N'91941')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (77, N'Browning', N'Mary', N'Noah Lane', N'Chicago', N'IL', N'60610')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (78, N'Brumfield', N'Eric', N'600 Slater Street', N'Ottawa', N'ON', N'K4B 1S2')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (79, N'Brundage', N'Michael', N'22555 Paseo De Las Americas', N'San Diego', N'CA', N'92102')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (80, N'Bruner', N'Shirley', N'4781 Highway 95', N'Sandpoint', N'ID', N'83864')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (81, N'Brunner', N'June', N'678 Eastman Ave.', N'Midland', N'MI', N'48640')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (82, N'Bruno', N'Dirk', N'251 Indell Lane', N'Brampton', N'ON', N'L6W 2T7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (83, N'Bueno', N'Janaina Barreiro Gambaro', N'995 Crescent', N'Richmond Hill', N'ON', N'L4E 3M5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (84, N'Burke', N'Megan', N'Arcadia Crossing', N'Phoenix', N'AR', N'85004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (85, N'Burkhardt', N'Karren', N'2502 Evergreen Ste E', N'Everett', N'WA', N'98201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (86, N'Burnett', N'Linda', N'2505 Gateway Drive', N'North Sioux City', N'SO', N'57049')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (87, N'Burnett', N'Timothy', N'45259 Canada Way', N'Burnaby', N'BR', N'V5G 4S4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (88, N'Bustamante', N'Jared', N'3307 Evergreen Blvd', N'Washougal', N'WA', N'98671')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (89, N'Byham', N'Richard', N'Knaves Beech Ind.', N'High Wycombe', N'EN', N'HP10 9QY')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (90, N'Calafato', N'Ryan', N'254480 River Rd', N'Richmond', N'BR', N'V6B 3P7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (91, N'Caldwell', N'Mari', N'2524 Barlby Road', N'London', N'EN', N'W10 6BL')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (92, N'Calone', N'Barbara', N'25306 Harvey Rd.', N'College Station', N'TE', N'77840')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (93, N'Camacho', N'Lindsey', N'S Sound Ctr Suite 25300', N'Lacey', N'WA', N'98503')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (94, N'Camargo', N'Gustavo', N'Ellesfield Ave', N'Bracknell', N'EN', N'RG12 8TB')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (95, N'Campbell', N'Frank', N'251340 E. South St.', N'Cerritos', N'CA', N'90703')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (96, N'Campbell', N'Joan', N'P.O. Box 44000', N'Winnipeg', N'MA', N'R3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (97, N'Campen', N'Henry', N'2507 Pacific Ave S', N'Tacoma', N'WA', N'98403')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (98, N'Cannon', N'Chris', N'Lakewood Mall', N'Lakewood', N'CA', N'90712')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (99, N'Canuto', N'Suzana De Abreu', N'20225 Lansing Ave', N'Montreal', N'QU', N'H1Y 2H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (100, N'Caprio', N'Johnny', N'22580 Free Street', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (101, N'Carlisle', N'Carlton', N'400-25155 West Pender St', N'Vancouver', N'BR', N'V7L 4J4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (102, N'Carmichael', N'Jane', N'5967 W Las Positas Blvd', N'Pleasanton', N'CA', N'94566')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (103, N'Carmody', N'Jovita', N'253950 N.E. 178th Place', N'Woodinville', N'WA', N'98072')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (104, N'Caron', N'Rob', N'Ward Parkway Center', N'Kansas City', N'MI', N'64106')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (105, N'Carothers', N'Andy', N'566 S. Main', N'Cedar City', N'UT', N'84720')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (106, N'Carreras', N'Donna', N'12345 Sterling Avenue', N'Irving', N'TE', N'75061')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (107, N'Carroll', N'Rosmarie', N'39933 Mission Oaks Blvd', N'Camarillo', N'CA', N'93010')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (108, N'Castellucio', N'Joseph', N'2511 Baker Road', N'Toronto', N'ON', N'M4B 1V7')
GO
print 'Processed 100 total records'
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (109, N'Casts', N'Raul', N'99040 California Avenue', N'Sand City', N'CA', N'93955')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (110, N'Cavallari', N'Matthew', N'North 93270 Newport Highway', N'Spokane', N'WA', N'99202')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (111, N'Cavendish', N'Brigid', N'Banbury', N'Oxon', N'EN', N'OX16 8RS')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (112, N'Cencini', N'Andrew', N'558 S 6th St', N'Klamath Falls', N'OR', N'97601')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (113, N'Cereghino', N'Stacey', N'220 Mercy Drive', N'Garland', N'TE', N'75040')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (114, N'Chambers', N'Pat', N'30025 Wayburne Drive, Suite 275', N'Burnaby', N'BR', N'V5G 4W1')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (115, N'Chandler', N'Forrest', N'The Quad @ WestView', N'Whittier', N'CA', N'90605')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (116, N'Chapla', N'Lee', N'99433 S. Greenbay Rd.', N'Racine', N'WI', N'53182')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (117, N'Cheng', N'Yao-Qiang', N'25 N State St', N'Chicago', N'IL', N'60610')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (118, N'Chesnut', N'Nicky', N'9920 North Telegraph Rd.', N'Pontiac', N'MI', N'48342')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (119, N'Choin', N'Ruth', N'7760 N. Pan Am Expwy', N'San Antonio', N'TE', N'78204')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (120, N'Chor', N'Anthony', N'Riverside', N'Sherman Oaks', N'CA', N'91403')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (121, N'Chow', N'Pei', N'4660 Rodeo Road', N'Santa Fe', N'NE', N'87501')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (122, N'Christie', N'Jill', N'54254 Pacific Ave.', N'Stockton', N'CA', N'95202')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (123, N'Clark', N'Alice', N'42500 W 76th St', N'Chicago', N'IL', N'60610')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (124, N'Clayton', N'Jane', N'Po Box 83270', N'Vancouver', N'BR', N'V7L 4J4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (125, N'Coffman', N'Connie', N'25269 Wood Dale Rd.', N'Wood Dale', N'IL', N'60191')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (126, N'Coleman', N'Pat', N'25245 Rue Sherbrooke Ouest', N'Montreal', N'QU', N'H1Y 2H5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (127, N'Colon', N'John', N'77 Beale Street', N'San Francisco', N'CA', N'94109')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (128, N'Colvin', N'Scott', N'25550 Executive Dr', N'Elgin', N'IL', N'60120')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (129, N'Conner', N'William', N'2560 Bay Street', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (130, N'Contreras', N'Dorothy', N'Suite 25800 3401 - 10810th Avenue', N'Surrey', N'BR', N'V3T 4W3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (131, N'Cooper', N'Scott', N'Pavillion @ Redlands', N'Redlands', N'CA', N'92373')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (132, N'Corets', N'Eva', N'2540 Dell Range Blvd', N'Cheyenne', N'WY', N'82001')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (133, N'Coriell', N'Marlin', N'99800 Tittabawasee Rd.', N'Saginaw', N'MI', N'48601')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (134, N'Creasey', N'Jack', N'Factory Merchants', N'Barstow', N'CA', N'92311')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (135, N'Culbertson', N'Grant', N'399700 John R. Rd.', N'Madison Heights', N'MI', N'48071')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (136, N'Culp', N'Scott', N'750 Lakeway Dr', N'Bellingham', N'WA', N'98225')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (137, N'Cunningham', N'Conor', N'Sports Store At Park City', N'Park City', N'UT', N'84098')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (138, N'Davis', N'Megan', N'48995 Evergreen Wy.', N'Everett', N'WA', N'98201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (139, N'De Matos Miranda Filho', N'Alvaro', N'Mountain Square', N'Upland', N'CA', N'91786')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (140, N'Dean', N'Jacob', N'#9900 2700 Production Way', N'Burnaby', N'BR', N'V5A 4X1')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (141, N'Deborde', N'Alexander', N'6777 Kingsway', N'Burnaby', N'BR', N'V5H 3Z7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (142, N'Delaney', N'Aidan', N'Corporate Office', N'Garland', N'TE', N'75040')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (143, N'Delmarco', N'Stefan', N'Incom Sports Center', N'Ontario', N'CA', N'91764')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (144, N'Demott Jr', N'Della', N'25575 The Queensway', N'Etobicoke', N'ON', N'M9W 3P3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (145, N'Desai', N'Prashanth', N'Sapp Road West', N'Round Rock', N'TE', N'78664')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (146, N'Desalvo', N'Bev', N'7009 Sw Hall Blvd.', N'Tigard', N'OR', N'97223')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (147, N'D''Hers', N'Thierry', N'Box 99354 300 Union Street', N'Saint John', N'BR', N'E2P 1E3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (148, N'Diaz', N'Brenda', N'2560 E. Newlands Dr', N'Fernley', N'NE', N'89408')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (149, N'Dickmann', N'Gabriele', N'250551 Shellbridge Way', N'Richmond', N'BR', N'V6B 3P7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (150, N'Dievendorff', N'Dick', N'Bradford', N'W. York', N'EN', N'BD1 4SJ')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (151, N'Dillon', N'Rudolph', N'595 Burning Street', N'Vancouver', N'BR', N'V7L 4J4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (152, N'Dockter', N'Blaine', N'99000 S. Avalon Blvd. Suite 750', N'Carson', N'CA', N'90746')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (153, N'Dodd', N'Cindy', N'994 Sw Cherry Park Rd', N'Troutdale', N'OR', N'97060')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (154, N'Doyle', N'Patricia', N'225 South 314th Street', N'Federal Way', N'WA', N'98003')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (155, N'Drury', N'Gerald', N'4635 S. Harrison Blvd.', N'Ogden', N'UT', N'84401')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (156, N'D''sa', N'Reuben', N'9950 Ferrand Drive, 9th Floor', N'Toronto', N'ON', N'M4B 1V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (157, N'Duncan', N'Bart', N'99295 S.e. Tualatin Valley_hwy.', N'Hillsboro', N'OR', N'97123')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (158, N'Dusza', N'Maciej', N'2564 S. Redwood Rd.', N'Riverton', N'UT', N'84065')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (159, N'Ecoffey', N'Linda', N'67255 - 8th Street N.E., Suite 350', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (160, N'Elliott', N'Carol', N'25220 Airline Road', N'Corpus Christi', N'TE', N'78404')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (161, N'Elliott', N'Shannon', N'Factory Stores/tucson', N'Tucson', N'AR', N'85701')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (162, N'Elson', N'Jauna', N'2573 Dufferin Street', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (163, N'Eminhizer', N'Terry', N'Warrington Ldc Unit 25/2', N'Woolston', N'EN', N'WA1 4SY')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (164, N'Emory', N'John', N'Medford', N'Medford', N'OR', N'97504')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (165, N'Erickson', N'Gail', N'44025 W. Empire', N'Denby', N'SO', N'57716')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (166, N'Erickson', N'Mark', N'Factory Stores Of America', N'Mesa', N'AR', N'85201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (167, N'Espinoza', N'Martha', N'6700 Boul Taschereau', N'Brossard', N'QU', N'J4Z 1C5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (168, N'Esteves', N'Janeth', N'6 The Farm, Liberty Road', N'Maidenhead', N'EN', N'SL67RJ')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (169, N'Evans', N'Ann', N'Ring Plaza', N'Norridge', N'IL', N'60706')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (170, N'Evans', N'John', N'7709 West Virginia Avenue', N'Phoenix', N'AR', N'85004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (171, N'Evans', N'Twanna', N'Lewis County Mall', N'Chehalis', N'WA', N'98532')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (172, N'Farino', N'Carolyn', N'3250 South Meridian', N'Puyallup', N'WA', N'98371')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (173, N'Farrell', N'Geri', N'49925 Crestview Drive N.E.', N'Rio Rancho', N'NE', N'87124')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (174, N'Ferrier', N'François', N'Eastridge Mall', N'Casper', N'WY', N'82601')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (175, N'Finley', N'Rhoda', N'6030 Conroy Road', N'Ottawa', N'ON', N'K4B 1S3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (176, N'Flood', N'Kathie', N'705 SE Mall Parkway', N'Everett', N'WA', N'98201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (177, N'Focht', N'Kelly', N'5990 Avebury Road', N'Mississauga', N'ON', N'L5B 3V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (178, N'Ford', N'John', N'23025 S.W. Military Rd.', N'San Antonio', N'TE', N'78204')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (179, N'Fort', N'Garth', N'3250 Baldwin Park Blvd', N'Baldwin Park', N'CA', N'91706')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (180, N'Fox', N'Dorothy', N'Lakeline Mall', N'Cedar Park', N'TE', N'78613')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (181, N'French', N'Susan', N'69251 Creditview Road', N'Mississauga', N'ON', N'L5B 3V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (182, N'Frintu', N'Mihail', N'Bayshore Mall', N'Eureka', N'CA', N'95501')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (183, N'Fulton', N'Paul', N'Horizon Outlet Center', N'Monroe', N'MI', N'98272')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (184, N'Gage', N'Bob', N'43251 Viking Way, Unit 130', N'Richmond', N'BR', N'V6B 3P7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (185, N'Galos', N'Michael', N'West Park Plaza', N'Irvine', N'CA', N'92614')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (186, N'Ganio', N'Jon', N'3900 S. 997th St.', N'Milwaukee', N'WI', N'53202')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (187, N'Garza', N'Kathleen', N'6388 Lake City Way', N'Burnaby', N'BR', N'V5A 3A6')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (188, N'Gash', N'Dominic', N'5420 West 22500 South', N'Salt Lake City', N'UT', N'84101')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (189, N'Gates', N'Janet', N'165 North Main', N'Austin', N'TE', N'78701')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (190, N'Gates', N'Janet', N'800 Interchange Blvd.', N'Austin', N'TE', N'78701')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (191, N'Gee', N'Orlando', N'2251 Elliot Avenue', N'Seattle', N'WA', N'98104')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (192, N'Gehring', N'Darren', N'509 Nafta Boulevard', N'Laredo', N'TE', N'78040')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (193, N'Geist', N'Jim', N'35525-9th Street Sw', N'Puyallup', N'WA', N'98371')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (194, N'German', N'Barbara', N'Science Park South, Birchwood', N'Warrington', N'EN', N'WA3 7BH')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (195, N'Giakoumakis', N'Leo', N'Elmhurst Road, Goring', N'Reading', N'EN', N'RG7 5H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (196, N'Giglio', N'Frances', N'9979 Bayview Drive', N'Barrie', N'ON', N'L4N')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (197, N'Gilbert', N'Guy', N'Vista Marketplace', N'Alhambra', N'CA', N'91801')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (198, N'Gilliat', N'Janet', N'9995 West Central Entrance', N'Duluth', N'MI', N'55802')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (199, N'Gimmi', N'Mary', N'5525 South Hover Road', N'Longmont', N'CO', N'80501')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (200, N'Glenn', N'Jeanie', N'9909 W. Ventura Boulevard', N'Camarillo', N'CA', N'93010')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (201, N'Glimp', N'Diane', N'4400 March Road', N'Kanata', N'ON', N'K2L 1H5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (202, N'Gode', N'Scott', N'2583 Se 272nd St', N'Kent', N'WA', N'98031')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (203, N'Goktepe', N'Mete', N'Hanford Mall', N'Hanford', N'CA', N'93230')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (204, N'Goldstein', N'Brian', N'965 De La Gauchetiere West', N'Montreal', N'QU', N'H1Y 2H8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (205, N'Gonzalez', N'Abigail', N'99450 Highway 59 North', N'Humble', N'TE', N'77338')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (206, N'Graff', N'Michael', N'9700 Sisk Road', N'Modesto', N'CA', N'95354')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (207, N'Graham', N'Derek', N'655-4th Ave S.W.', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (208, N'Grande', N'Jon', N'Galashiels', N'Liverpool', N'EN', N'L4 4HB')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (209, N'Greer', N'Jane', N'2550 Signet Drive', N'Weston', N'ON', N'M9V 4W3')
GO
print 'Processed 200 total records'
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (210, N'Groncki', N'Douglas', N'70259 West Sunnyview Ave', N'Visalia', N'CA', N'93291')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (211, N'Groth', N'Brian', N'Gateway', N'Portland', N'OR', N'97205')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (212, N'Haemon', N'Hattie', N'55 Lakeshore Blvd East', N'Toronto', N'ON', N'M4B 1V6')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (213, N'Hagens', N'Erin', N'25001 Montague Expressway', N'Milpitas', N'CA', N'95035')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (214, N'Haines', N'Betty', N'640 South 994th St. W.', N'Billings', N'MO', N'59101')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (215, N'Hamilton', N'Bryan', N'Station E', N'Chalk Riber', N'ON', N'K0J 1J0')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (216, N'Handley', N'Jean', N'259826 Russell Rd. South', N'Kent', N'WA', N'98031')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (217, N'Hanif', N'Kerim', N'60025 Bollinger Canyon Road', N'San Ramon', N'CA', N'94583')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (218, N'Hanson', N'John', N'825 W 500 S', N'Bountiful', N'UT', N'84010')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (219, N'Harding', N'Katherine', N'52560 Free Street', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (220, N'Harrington', N'Lucy', N'482505 Warm Springs Blvd.', N'Fremont', N'CA', N'94536')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (221, N'Harris', N'Keith', N'7943 Walnut Ave', N'Renton', N'WA', N'98055')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (222, N'Harris', N'Keith', N'3207 S Grady Way', N'Renton', N'WA', N'98055')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (223, N'Harui', N'Roger', N'9927 N. Main St.', N'Tooele', N'UT', N'84074')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (224, N'Hass', N'Ann', N'Medford Outlet Center', N'Medford', N'MI', N'55049')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (225, N'Haugh', N'James', N'660 Saint-Jacques, Bureau 400', N'Montreal', N'QU', N'H1Y 2H8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (226, N'Heaney', N'Brenda', N'990th Floor 700 De La GauchetiSre Ou', N'Montreal', N'QU', N'H1Y 2H3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (227, N'Hendricks', N'Valerie', N'Kansas City Factory Outlet', N'Odessa', N'MI', N'64076')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (228, N'Hensien', N'Kari', N'253131 Lake Frasier Drive, Office No. 2', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (229, N'Hernandez', N'Irene', N'25730, boul. St-Régis', N'Dorval', N'QU', N'H9P 1H1')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (230, N'Hernandez', N'Jésus', N'32605 West 252 Mile Road, Suite 250', N'Aurora', N'ON', N'L4G 7N6')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (231, N'Herring', N'Cheryl', N'Corp Ofc Accts Payable', N'El Segundo', N'CA', N'90245')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (232, N'Heymsfield', N'Ronald', N'250775 SW Hillsdale Hwy', N'Beaverton', N'OR', N'97005')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (233, N'Hill', N'Andrew', N'7000 Victoria Park Avenue', N'Toronto', N'ON', N'M4B 1V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (234, N'Hines', N'Mike', N'25250 N 90th St', N'Scottsdale', N'AR', N'85257')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (235, N'Hink', N'Matthew', N'No. 60 Bellis Fair Parkway', N'Bellingham', N'WA', N'98225')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (236, N'Hodges', N'Bob', N'Ohms Road', N'Houston', N'TE', N'77003')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (237, N'Hodgson', N'David', N'99700 Bell Road', N'Auburn', N'CA', N'95603')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (238, N'Hoeing', N'Helge', N'Cedar Creek Stores', N'Mosinee', N'WI', N'54455')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (239, N'Holloway', N'Jean', N'Unit 99a Battery Retail Pk', N'Birmingham', N'EN', N'B29 6SL')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (240, N'Holman', N'Juanita', N'Lake Elisnor Place', N'Lake Elsinore', N'CA', N'92530')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (241, N'Holmes', N'Eddie', N'Bureau 9900 825, Avenue Querbes', N'Outremont', N'QU', N'H1Y 2G5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (242, N'Houston', N'Peter', N'1200 First Ave.', N'Joliet', N'IL', N'60433')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (243, N'Howard', N'Curtis', N'6th Floor, 25st Canadian Place', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (244, N'Hows', N'Janice', N'399 Clearing Green', N'London', N'EN', N'EC1R 0DU')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (245, N'Huckaby', N'George', N'3390 South 23rd St.', N'Tacoma', N'WA', N'98403')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (246, N'Huff', N'Arlene', N'2574 Milton Park', N'Oxford', N'EN', N'OX14 4SE')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (247, N'Huff', N'Joshua', N'Management Mall', N'San Antonio', N'TE', N'78204')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (248, N'Huntsman', N'Phyllis', N'City Center', N'Minneapolis', N'MI', N'55402')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (250, N'Hurkett', N'Lawrence', N'6753 Howard Hughes Parkway', N'Las Vegas', N'NE', N'89106')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (251, N'Iallo', N'Lucio', N'Simi @ The Plaza', N'Simi Valley', N'CA', N'93065')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (252, N'Ihrig', N'Ryan', N'250333 Southport Road, S.W.', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (253, N'Inghram', N'Beth', N'9259 - 1110th Avenue Sw', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (254, N'Irwin', N'Richard', N'99828 Routh Street, Suite 825', N'Dallas', N'TE', N'75201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (255, N'Ismert', N'Erik', N'4927 S Meridian Ave Ste D', N'Puyallup', N'WA', N'98371')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (256, N'Ison', N'Denean', N'586 Fulham Road,', N'London', N'EN', N'SW6 SBY')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (257, N'Jacobs', N'Bronson', N'2510 Crew Court', N'Montreal', N'QU', N'H1Y 2H8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (258, N'Jacobsen', N'Eric', N'Topanga Plaza', N'Canoga Park', N'CA', N'91303')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (259, N'Jacobson', N'Jodan', N'6030 Robinson Road', N'Jefferson City', N'MI', N'65101')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (260, N'Jacobson', N'Sean', N'2551 East Warner Road', N'Gilbert', N'AR', N'85233')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (261, N'Jaffe', N'David', N'Wade Road', N'Basingstoke Hants', N'EN', N'RG24 8PL')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (262, N'Jarvis', N'Joyce', N'955 E. County Line Rd.', N'Englewood', N'CO', N'80110')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (263, N'Jiang', N'Stephen', N'9900 Ronson Drive', N'Etobicoke', N'ON', N'M9W 3P3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (264, N'Johns', N'Vance', N'65 Gamelin Street', N'Hull', N'QU', N'8Y')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (265, N'Johnson', N'Barry', N'2530 South Colorado Blvd.', N'Denver', N'CO', N'80203')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (267, N'Johnson', N'Brian', N'625 W Jackson Blvd. Unit 2502', N'Chicago', N'IL', N'60610')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (268, N'Johnson', N'Danielle', N'955 Green Valley Crescent', N'Ottawa', N'ON', N'K4B 1S1')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (269, N'Johnson', N'David', N'7990 Ocean Beach Hwy.', N'Longview', N'WA', N'98632')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (270, N'Johnston', N'Tom', N'Belz Factory Outlet', N'Las Vegas', N'NE', N'89106')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (271, N'Jordan', N'Jean', N'440 West Huntington Dr.', N'Monrovia', N'CA', N'91016')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (272, N'Justice', N'Peggy', N'15 East Main', N'Port Orchard', N'WA', N'98366')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (273, N'Kaliyath', N'Sandeep', N'630 N. Capitol Ave.', N'San Jose', N'CA', N'95112')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (274, N'Kane', N'Lori', N'9693 Louis H Lafontaine', N'Ville De''anjou', N'QU', N'J1G 2R3')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (275, N'Katyal', N'Sandeep', N'765 Delridge Way Sw', N'Seattle', N'WA', N'98104')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (276, N'Kelley', N'Victor', N'2900 - 25055 Dunning Street', N'Vancouver', N'BR', N'V7L 4J4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (277, N'Kelly', N'John', N'Pacific West Outlet', N'Gilroy', N'CA', N'95020')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (278, N'Kelly', N'Robert', N'6425 Nw Loop 410', N'San Antonio', N'TE', N'78204')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (279, N'Kennedy', N'Kevin', N'2550 Ne Sandy Blvd', N'Portland', N'OR', N'97205')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (280, N'Kennedy', N'Mitch', N'C/O Starpak, Inc.', N'Greeley', N'CO', N'80631')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (281, N'Kesslep', N'Mary', N'Wharfdale Road', N'Berkshire', N'EN', N'RG11 5TP')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (282, N'Keyser', N'Elizabeth', N'6400, 888 - 3rd Avenue', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (283, N'Khan', N'Imtiaz', N'25095 W. Florissant', N'Ferguson', N'MI', N'63135')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (284, N'Khanna', N'Karan', N'755 W Washington Ave Ste D', N'Sequim', N'WA', N'98382')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (285, N'Kim', N'Joe', N'308-3250 Casting Road', N'York', N'EN', N'Y024 1GF')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (286, N'Kim', N'Shane', N'No. 25400 10665 Jasper Avenue', N'Edmonton', N'AL', N'T5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (287, N'Kim', N'Tim', N'25 Danger Street West', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (288, N'King', N'Kirk', N'2521 McPherson Street', N'Markham', N'ON', N'L3S 3K2')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (289, N'Kirilov', N'Anton', N'2575 Rocky Mountain Ave.', N'Loveland', N'CO', N'80537')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (290, N'Kitt', N'Sandra', N'258 King Street East', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (291, N'Kleinerman', N'Christian', N'25150 El Camino Real', N'San Bruno', N'CA', N'94066')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (292, N'Kobylinski', N'Andrew', N'2526a Tri-Lake Blvd Ne', N'Kirkland', N'WA', N'98033')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (293, N'Kogan', N'Eugene', N'6756 Mowry', N'Newark', N'CA', N'94560')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (294, N'Konersmann', N'Scott', N'52500 Liberty Way', N'Fort Worth', N'TE', N'76102')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (295, N'Koski', N'Joy', N'258101 Nw Evergreen Parkway', N'Beaverton', N'OR', N'97005')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (296, N'Kotc', N'Pamala', N'Garamonde Drive, Wymbush', N'Milton Keynes', N'EN', N'MK8 8ZD')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (297, N'Krane', N'Diane', N'46460 West Oaks Drive', N'Novi', N'MI', N'48375')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (298, N'Krane', N'Kay', N'9228 Via Del Sol', N'Phoenix', N'AR', N'85004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (299, N'Krane', N'Kay', N'Prime Outlets', N'Phoenix', N'AR', N'85004')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (300, N'Krupka', N'Margaret', N'Great Northwestern', N'North Bend', N'WA', N'98045')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (301, N'Kumar', N'Deepak', N'255 Irving Street', N'London', N'EN', N'C2H 7AU')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (302, N'Kuppa', N'Vamsi', N'3255 Front Street West', N'Toronto', N'ON', N'M4B 1V6')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (303, N'Kurniawan', N'Peter', N'63 W Monroe', N'Chicago', N'IL', N'60610')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (304, N'Kurtz', N'Jeffrey', N'Receiving', N'Fullerton', N'CA', N'92831')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (305, N'Lang', N'Eric', N'25300 Biddle Road', N'Medford', N'OR', N'97504')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (306, N'Laszlo', N'Rebecca', N'Phoenix Way, Cirencester', N'Gloucestershire', N'EN', N'GL7 1RY')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (307, N'Lawrence', N'David', N'2512-4th Ave Sw', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (308, N'Leavitt', N'Elsa', N'2575 West 2700 South', N'Salt Lake City', N'UT', N'84101')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (309, N'Lee', N'Marjorie', N'2509 W. Frankford', N'Carrollton', N'TE', N'75006')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (310, N'Lee', N'Mark', N'2512-410th Avenue S.W.', N'Calgary', N'AL', N'T2P 2G8')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (311, N'Lee', N'Michael', N'25718 Se Sunnyside Rd', N'Clackamas', N'OR', N'97015-6403')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (312, N'Lenehan', N'Jolie', N'Garamonde Drive, Wymbush', N'Milton Keynes', N'EN', N'MK8 8ZD')
GO
print 'Processed 300 total records'
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (313, N'Lengel', N'Roger', N'490 Ne 4th St', N'Renton', N'WA', N'98055')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (314, N'Leonetti', N'A.', N'5700 Legacy Dr', N'Plano', N'TE', N'75074')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (315, N'Lepro', N'Bonnie', N'25600 E St Andrews Pl', N'Santa Ana', N'CA', N'92701')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (316, N'Leste', N'Linda', N'630 University Avenue', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (317, N'Lewin', N'Elsie', N'P.O. Box 6256916', N'Dallas', N'TE', N'75201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (318, N'Li', N'George', N'910 Main Street.', N'Sparks', N'NE', N'89431')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (319, N'Li', N'Yale', N'992 St Clair Ave East', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (320, N'Li', N'Yuhong', N'Bradford', N'W. York', N'EN', N'BD1 4SJ')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (321, N'Lique', N'Joseph', N'257700 Ne 76th Street', N'Redmond', N'WA', N'98052')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (322, N'Lisboa', N'Paulo', N'9178 Jumping St.', N'Dallas', N'TE', N'75201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (323, N'Lisboa', N'Paulo', N'Po Box 8259024', N'Dallas', N'TE', N'75201')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (324, N'Liu', N'David', N'855 East Main Avenue', N'Zeeland', N'MI', N'49464')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (325, N'Liu', N'Jinghao', N'90025 Sterling St', N'Irving', N'TE', N'75061')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (326, N'Liu', N'Kevin', N'9992 Whipple Rd', N'Union City', N'CA', N'94587')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (327, N'Logan', N'Todd', N'575 Rue St Amable', N'Quebec', N'QU', N'G1R')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (328, N'Looney', N'Sharon', N'74400 France Avenue South', N'Edina', N'MI', N'55436')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (329, N'Lucerne', N'Anita', N'6333 Cote Vertu', N'Montreal', N'QU', N'H1Y 2H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (330, N'Lundahl', N'Judy', N'25149 Howard Dr', N'West Chicago', N'IL', N'60185')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (331, N'Lyeba', N'Robert', N'63 Free St.', N'Toronto', N'ON', N'M4B 1V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (332, N'Lyon', N'Robert', N'609 Evans Avenue', N'Toronto', N'ON', N'M4B 1V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (333, N'Maccietto', N'Denise', N'Port Huron', N'Port Huron', N'MI', N'48060')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (334, N'MacDonald', N'Scott', N'St. Louis Marketplace', N'Saint Louis', N'MI', N'63103')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (335, N'Manchepalli', N'Ajay', N'25 Hartfield Road, Wimbledon', N'London', N'EN', N'SW19 3RU')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (336, N'Manzanares', N'Tomas', N'99 Dean Street, Soho', N'London', N'EN', N'W1V 5RN')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (337, N'Marcovecchio', N'Kathy', N'9905 Three Rivers Drive', N'Kelso', N'WA', N'98626')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (338, N'Marple', N'Melissa', N'603 Gellert Blvd', N'Daly City', N'CA', N'94015')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (339, N'Marshall', N'Cecelia', N'9984 Wellington Street', N'Ottawa', N'ON', N'K4B 1S2')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (340, N'Mart¡nez', N'Frank', N'870 N. 54th Ave.', N'Chandler', N'AR', N'85225')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (341, N'Martin', N'Linda', N'Park House-4th Floor, 2516 Park St.', N'London', N'EN', N'W1Y 3RA')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (342, N'Masters', N'Steve', N'2545 King Street West', N'Toronto', N'ON', N'M4B 1V7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (343, N'Maxham', N'Jennifer', N'Butterfield Hse, 7-251 Chapel St', N'Lancaster', N'EN', N'LA1 1LN')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (344, N'Maxwell', N'Chris', N'3025 E Waterway Blvd', N'Shelton', N'WA', N'98584')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (345, N'Maynard', N'Sandra', N'9952 E. Lohman Ave.', N'Las Cruces', N'NE', N'88001')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (346, N'Mays', N'Walter', N'Po Box 252525', N'Santa Ana', N'CA', N'92701')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (347, N'McCarthy', N'Lola', N'1050 Oak Street', N'Seattle', N'WA', N'98104')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (348, N'McCarty', N'Jane', N'409 Santa Monica Blvd.', N'Santa Monica', N'CA', N'90401')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (349, N'McCoy', N'James', N'9900-6400 Boul, Taschereau', N'Brossard', N'QU', N'J4Z 1R4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (350, N'McGuigan', N'Robin', N'2500 University Avenue', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (351, N'McKay', N'Yvonne', N'Horizon Outlet', N'Woodbury', N'MI', N'55125')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (352, N'McLin', N'Nkenge', N'Frontier Mall', N'Cheyenne', N'WY', N'82001')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (353, N'McPhearson', N'Nancy', N'46-44 Albemarle Street', N'London', N'EN', N'W1X3SE')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (354, N'Mello', N'Raquel', N'No. 2000-25080 Beaver Hall Hill', N'Quebec', N'QU', N'G1R')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (355, N'Mendoza', N'R. Morgan', N'Johnson Creek', N'Johnson Creek', N'WI', N'53038')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (356, N'Mew', N'Stephen', N'250 Kingsbridge Garden Circle', N'Mississauga', N'ON', N'L5B 3V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (357, N'Meyer', N'Helen', N'7505 Laguna Boulevard', N'Elk Grove', N'CA', N'95624')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (358, N'Michaels', N'Thomas', N'5th Floor, 79 Place D''armes', N'Kingston', N'ON', N'7L')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (359, N'Miller', N'Ben', N'Suite 500 995 W. 11th Avenue', N'Mississauga', N'ON', N'L5A 1H6')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (360, N'Miller', N'Dylan', N'Parkway Plaza', N'El Cajon', N'CA', N'92020')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (361, N'Miller', N'Frank', N'123 W. Lake Ave.', N'Peoria', N'IL', N'61606')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (362, N'Miller', N'Matthew', N'Wymbush', N'Milton Keynes', N'EN', N'MK8 8DF')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (363, N'Miller', N'Virginia', N'25111 228th St Sw', N'Bothell', N'WA', N'98011')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (364, N'Miller', N'Virginia', N'8713 Yosemite Ct.', N'Bothell', N'WA', N'98011')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (365, N'Mitchell', N'Linda', N'New Millhouse, 2583 Milton Park', N'Abingdon', N'EN', N'OX14 4SE')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (366, N'Mitchell', N'Neva', N'2528 Meridian E', N'Puyallup', N'WA', N'98371')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (367, N'Mitzner', N'Joseph', N'123 Camelia Avenue', N'Oxnard', N'CA', N'93030')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (368, N'Smith', N'Margaret', N'Lewiston Mall', N'Lewiston', N'ID', N'83501')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (369, N'Steele', N'Laura', N'253731 West Bell Road', N'Surprise', N'AR', N'85374')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (370, N'Steelman', N'Shanay', N'5 place Ville-Marie', N'Montreal', N'QU', N'H1Y 2H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (371, N'Stefani', N'Stefano', N'997b Tradescant Road', N'London', N'EN', N'SW8 1XD')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (372, N'Steiner', N'Alan', N'2255 254th Avenue Se', N'Albany', N'OR', N'97321')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (373, N'Steiner', N'Alice', N'Lone Star Factory', N'La Marque', N'TE', N'77568')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (374, N'Stenerson', N'Derik', N'Factory Merchants', N'Branson', N'MI', N'65616')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (375, N'Stern', N'Vassar', N'25130 South State Street', N'Sandy', N'UT', N'84070')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (376, N'Steuber', N'Wathalee', N'700 Se Sunnyside Road', N'Clackamas', N'OR', N'97015')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (377, N'Stevens', N'Liza Marie', N'7750 E Marching Rd', N'Scottsdale', N'AR', N'85257')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (378, N'Stewart', N'Jim', N'999 West Georgia St.', N'Vancouver', N'ON', N'V5T 1Y9')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (379, N'Stotka', N'Robert', N'Sports Stores @ Tuscola', N'Tuscola', N'IL', N'61953')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (380, N'Stotler', N'Kayla', N'9980 S Alma School Road', N'Chandler', N'AR', N'85225')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (381, N'Styles', N'Ruby Sue', N'46990 Viking Way', N'Richmond', N'BR', N'V6B 3P7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (382, N'Suess', N'Gary', N'725a The Arches', N'Berks', N'EN', N'SL4 1RH')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (383, N'Suffin', N'Ruth', N'Lancaster Mall', N'Salem', N'OR', N'97301')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (384, N'Sullivan', N'Elizabeth', N'Town East Center', N'Mesquite', N'TE', N'75149')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (385, N'Sullivan', N'Michael', N'5867 Sunrise Boulevard', N'Citrus Heights', N'CA', N'95610')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (386, N'Sultan', N'Marcia', N'251420a 170th Street', N'Edmonton', N'AL', N'T5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (387, N'Sunkammurali', N'Krishna', N'Paramount House', N'London', N'EN', N'W1N 9FA')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (388, N'Sutton', N'Brad', N'Three Rivers Mall', N'Kelso', N'WA', N'98626')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (389, N'Swan', N'Katherine', N'975 Princess Street', N'Kingston', N'ON', N'7L')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (390, N'Swearengin', N'Abraham', N'9920 Bridgepointe Parkway', N'San Mateo', N'CA', N'94404')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (391, N'Taft-Rider', N'Julie', N'6996 South Lindbergh', N'Saint Louis', N'MI', N'63103')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (392, N'Tatman', N'Clarence', N'San Diego Factory', N'San Ysidro', N'CA', N'92173')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (393, N'Taylor', N'Mike', N'750 Philip Street', N'Waterloo', N'ON', N'N2V')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (394, N'Tedford', N'Chad', N'9500b E. Central Texas Expressway', N'Killeen', N'TE', N'76541')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (395, N'Tench', N'Vanessa', N'2500 N Serene Blvd', N'El Segundo', N'CA', N'90245')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (396, N'Thames', N'Judy', N'25102 Springwater', N'Wenatchee', N'WA', N'98801')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (397, N'Thomas', N'Phyllis', N'99, Rue Saint-pierre', N'Pnot-Rouge', N'QU', N'J1E 2T7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (398, N'Thompson', N'Daniel', N'755 Nw Grandstand', N'Issaquah', N'WA', N'98027')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (399, N'Thompson', N'Donald', N'25472 Marlay Ave', N'Fontana', N'CA', N'92335')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (400, N'Thompson', N'Kendra', N'22571 South 2500 East', N'Idaho Falls', N'ID', N'83402')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (401, N'Thomsen', N'Andrea', N'251 The Metro Center', N'Wokingham', N'EN', N'RG41 1QW')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (402, N'Tian', N'Yuping', N'Depot 80', N'Sillery', N'QU', N'G1T')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (403, N'Tibbott', N'Diane', N'8525 South Parker Road', N'Parker', N'CO', N'80138')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (404, N'Toone', N'Delia', N'755 Columbia Ctr Blvd', N'Kennewick', N'WA', N'99337')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (405, N'Track', N'Glenn', N'55 Standish Court', N'Mississauga', N'ON', N'L5B 3V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (406, N'Trent', N'Billy', N'99954 Boul. Laurier, Local 060, Place', N'Sainte-Foy', N'QU', N'G1W')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (408, N'Trujillo', N'Christie', N'One Dancing, Rr No. 25', N'Round Rock', N'TE', N'78664')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (409, N'Tuffield', N'Phyllis', N'9960 King Street E.', N'Toronto', N'ON', N'M4B 1V5')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (410, N'Uddin', N'Sairaj', N'Natomas Marketplace', N'Sacramento', N'CA', N'95814')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (411, N'Uppal', N'Sunil', N'25500 Old Spanish Trail', N'Houston', N'TE', N'77003')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (412, N'Valerio', N'Jessie', N'Mall Of Orange', N'Orange', N'CA', N'92867')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (413, N'Valle', N'Esther', N'600 Boul. Rene-levesque Ouest', N'Montreal', N'QU', N'H1Y 2H7')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (414, N'Van Houten', N'Roger', N'Internet House, 3399 Science Park', N'Cambridge', N'EN', N'CB4 4BZ')
GO
print 'Processed 400 total records'
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (415, N'Vandenouer', N'Rose', N'7 Garden House Cloisters, 8 Batters', N'London', N'EN', N'SW8 4BG')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (416, N'Vanderbout', N'Gregory', N'950 Gateway Street', N'Springfield', N'OR', N'97477')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (417, N'Vanderhyde', N'Michael', N'Lincoln Square', N'Arlington', N'TE', N'76010')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (418, N'Vanderkamp', N'Margaret', N'62500 Neil Road', N'Reno', N'NE', N'89502')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (419, N'Vanderlinden', N'Kara', N'2520 Flanders Road', N'Toronto', N'ON', N'M4B 1V4')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (420, N'Vargas', N'Gary', N'Stevens Creek Shopping Center', N'San Jose', N'CA', N'95112')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (421, N'Vargas', N'Nieves', N'Kensington Valley Shops', N'Howell', N'MI', N'48843')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (422, N'Varkey Chudukatil', N'Ranjit', N'455 256th St.', N'Moline', N'IL', N'61265')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (423, N'Vasquez', N'Patricia', N'409 S. Main Ste. 25', N'Ellensburg', N'WA', N'98926')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (424, N'Venugopal', N'Raja', N'Burgess Hill', N'West Sussex', N'EN', N'RH15 9UD')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (425, N'Verdad', N'Dora', N'Suite 2502 410 Albert Street', N'Waterloo', N'ON', N'N2V')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (427, N'Vessa', N'Robert', N'72540 Blanco Rd.', N'San Antonio', N'TE', N'78204')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (428, N'Vicknair', N'Caroline', N'660 Lindbergh', N'Saint Louis', N'MI', N'63103')
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (430, N'Tony ', N'Massui', NULL, NULL, N'CA', NULL)
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (431, N'Abel', N'Cathrine', NULL, NULL, N'CA', NULL)
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (433, N'Adams', N'Frances', NULL, NULL, N'CA', NULL)
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (434, N'Massi', N'Anthony', NULL, N'Danville', N'CA', NULL)
INSERT [dbo].[Customer] ([CustomerID], [LastName], [FirstName], [Address], [City], [State], [ZIP]) VALUES (445, N'Griver', N'Tony', NULL, N'Seattle', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateProduct]
(
	
	@Name varchar(50), 
	@Description varchar(100), 
	@ProductID int,
	@Modified timestamp OUTPUT
	
)
AS
 SET NOCOUNT ON;
 
 UPDATE Product SET  
	Name = @Name, 
	Description = @Description
WHERE (ProductID = @ProductID) AND (Modified = @Modified) ;

 IF @@ROWCOUNT>0 AND @@ERROR=0
 -- Selects the updated timestamp which is put back into the result set
   SELECT @Modified = Modified 
   FROM Product 
   WHERE (ProductID = @ProductID);
 ELSE 
 -- Report an update conflict if there was one
   RAISERROR 50000 ''Concurrency violation on table Product.''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateCustomer]
(
	
	@LastName varchar(50), 
	@FirstName varchar(50), 
	@Address varchar(50), 
	@City varchar(50), 
	@State char(2), 
	@ZIP varchar(10),
	@CustomerID int, 
	@Modified timestamp OUTPUT
)
AS
 SET NOCOUNT ON;
 
 UPDATE Customer SET  
	LastName = @LastName,
	FirstName = @FirstName,  
	Address = @Address,  
	City = @City,  
	State = @State,  
	ZIP = @ZIP
 WHERE (CustomerID = @CustomerID) AND (Modified = @Modified) ;

 IF @@ROWCOUNT>0 AND @@ERROR=0
 -- Selects the updated timestamp which is put back into the dataset
   SELECT @Modified = Modified 
   FROM Customer 
   WHERE (CustomerID = @CustomerID);
 ELSE 
 -- Report an update conflict if there was one
   RAISERROR 50000 ''Concurrency violation on table Customer.''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertProduct]
(	
	@Name varchar(50), 
	@Description varchar(100),  
	@ProductID int OUTPUT,
	@Modified timestamp OUTPUT
)
AS
 SET NOCOUNT ON;
 
 -- Inserts a Product row
 INSERT INTO Product 
	( Name, Description ) 
 VALUES 
	( @Name, @Description ) ;
 
 IF @@ROWCOUNT>0 AND @@ERROR=0 -- Checks if the last statement produced an error
	-- Selects the primay key value and the generated timestamp which is put back into the result set
   SELECT @ProductID = ProductID, 
		  @Modified = Modified 
   FROM Product
   WHERE (ProductID = SCOPE_IDENTITY());' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteCustomer] 
(
	@CustomerID int
)
AS
 SET NOCOUNT ON;

DELETE FROM Customer WHERE (CustomerID = @CustomerID);' 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertCustomer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertCustomer]
(
	
	@LastName varchar(50), 
	@FirstName varchar(50), 
	@Address varchar(50), 
	@City varchar(50), 
	@State char(2), 
	@ZIP varchar(10),
	@CustomerID int OUTPUT,
	@Modified timestamp OUTPUT
)
AS
 SET NOCOUNT ON;
 
 -- Inserts a Customer row
 INSERT INTO Customer 
	( LastName, FirstName, Address, City, State, ZIP ) 
 VALUES 
	( @LastName, @FirstName, @Address, @City, @State, @ZIP ) ;
 
 IF @@ROWCOUNT>0 AND @@ERROR=0 -- Checks if the last statement produced an error
	-- Selects the primay key value and the generated timestamp which is put back into the dataset
   SELECT @CustomerID = CustomerID, 
		  @Modified = Modified 
   FROM Customer 
   WHERE (CustomerID = SCOPE_IDENTITY());' 
END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByLastName]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GetCustomerByLastName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[GetCustomerByLastName] 
(
@LastName varchar(50)
)
AS

SELECT 
CustomerID,
LastName,
FirstName,
Address,
City,
State,
ZIP,
Modified
FROM Customer
WHERE LastName LIKE @LastName + ''%''' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteProduct]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteProduct] 
(
	@ProductID int
)
AS
 SET NOCOUNT ON;

DELETE FROM Product WHERE (ProductID = @ProductID);' 
END
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04/30/2009 11:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[Modified] [timestamp] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[Orders] ON
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (11, 6, CAST(0x0000995C00E555C4 AS DateTime), CAST(0x0000995C00C2BA64 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (12, 8, CAST(0x0000996000E555C4 AS DateTime), CAST(0x0000997000C2BA64 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (14, 5, CAST(0x0000995E00E555C4 AS DateTime), CAST(0x00009AEB00000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (15, 9, CAST(0x0000996100E555C4 AS DateTime), CAST(0x0000996300C2BA64 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (23, 1, CAST(0x0000995500E555C4 AS DateTime), CAST(0x00009ACC00000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (26, 6, CAST(0x00009A1600000000 AS DateTime), CAST(0x00009B8500000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (27, 8, CAST(0x00009A1600000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (31, 8, CAST(0x00009A1600000000 AS DateTime), CAST(0x00009A1700000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (33, 431, CAST(0x00009A1600000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (35, 6, CAST(0x00009A1600000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (39, 5, CAST(0x00009B8400000000 AS DateTime), CAST(0x00009B8400000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (40, 9, CAST(0x00009B8400000000 AS DateTime), CAST(0x00009B8500000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (41, 5, CAST(0x00009B8400000000 AS DateTime), CAST(0x00009BC200000000 AS DateTime))
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (42, 6, CAST(0x000095CF00000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (44, 6, CAST(0x00009B8500000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate]) VALUES (46, 8, CAST(0x00009B8500000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 04/30/2009 11:23:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NULL,
	[Modified] [timestamp] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (22, 11, 1, 1, 4.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (23, 11, 3, 1, 5.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (24, 11, 2, 1, 6.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (25, 12, 3, 1, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (26, 12, 2, 1, 5.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (29, 14, 1, 2, 7.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (30, 14, 3, 1, 9.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (31, 15, 4, 10, 200.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (44, 23, 1, 2, 2.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (45, 23, 3, 5, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (46, 15, 1, 11, 300.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (53, 26, 3, 1, 1.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (55, 27, 3, 1, 44.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (60, 31, 2, 1, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (63, 23, 5, 2, 4.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (66, 33, 5, 1, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (67, 33, 2, 1, 1.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (69, 35, 3, 1, 2.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (70, 35, 4, 2, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (71, 26, 3, 3, 4.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (76, 40, 2, 2, 2.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (78, 41, 5, 42, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (79, 41, 2, 5, 4.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (80, 39, 4, 5, 12.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (81, 42, 5, 2, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (82, 42, 3, 1, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (83, 40, 4, 3, 4.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (85, 44, 3, 2, 3.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (86, 41, 4, 3, 33.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (87, 11, 3, 4, 2.0000)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Price]) VALUES (88, 46, 4, 3, 11.0000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateOrder]
(
	
	@CustomerID int, 
	@OrderDate datetime, 
	@ShipDate datetime,  
	@OrderID int,
	@Modified timestamp OUTPUT
	
)
AS
 SET NOCOUNT ON;
 
 UPDATE Orders SET  
	CustomerID = @CustomerID,  
	OrderDate = @OrderDate, 
	ShipDate = @ShipDate	
WHERE (OrderID = @OrderID) AND (Modified = @Modified) ;

 IF @@ROWCOUNT>0 AND @@ERROR=0
 -- Selects the updated timestamp which is put back into the dataset
   SELECT @Modified = Modified 
   FROM Orders 
   WHERE (OrderID = @OrderID);
 ELSE 
 -- Report an update conflict if there was one
   RAISERROR 50000 ''Concurrency violation on table Order.''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteOrder] 
(
	@OrderID int
)
AS
 SET NOCOUNT ON;

DELETE FROM Orders WHERE (OrderID = @OrderID);' 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrder]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertOrder]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertOrder]
(
	
	@CustomerID int, 
	@OrderDate datetime, 
	@ShipDate datetime,  
	@OrderID int OUTPUT,
	@Modified timestamp OUTPUT
)
AS
 SET NOCOUNT ON;
 
 -- Inserts a Order row
 INSERT INTO Orders 
	( CustomerID, OrderDate, ShipDate ) 
 VALUES 
	( @CustomerID, @OrderDate, @ShipDate ) ;
 
 IF @@ROWCOUNT>0 AND @@ERROR=0 -- Checks if the last statement produced an error
	-- Selects the primay key value and the generated timestamp which is put back into the dataset
   SELECT @OrderID = OrderID, 
		  @Modified = Modified 
   FROM Orders
   WHERE (OrderID = SCOPE_IDENTITY());' 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrderDetail]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UpdateOrderDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[UpdateOrderDetail]
(
	
	@OrderID int, 
	@ProductID int, 
	@Quantity int, 
	@Price money,  
	@OrderDetailID int,
	@Modified timestamp OUTPUT
	
)
AS
 SET NOCOUNT ON;
 
 UPDATE OrderDetail SET  
	OrderID = @OrderID, 
	ProductID = @ProductID, 
	Quantity = @Quantity, 
	Price = @Price 
WHERE (OrderDetailID = @OrderDetailID) AND (Modified = @Modified) ;

 IF @@ROWCOUNT>0 AND @@ERROR=0
 -- Selects the updated timestamp which is put back into the result set
   SELECT @Modified = Modified 
   FROM OrderDetail 
   WHERE (OrderDetailID = @OrderDetailID);
 ELSE 
 -- Report an update conflict if there was one
   RAISERROR 50000 ''Concurrency violation on table OrderDetail.''
' 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOrderDetail]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsertOrderDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[InsertOrderDetail]
(
	
	@OrderID int, 
	@ProductID int, 
	@Quantity int, 
	@Price money,  
	@OrderDetailID int OUTPUT,
	@Modified timestamp OUTPUT
)
AS
 SET NOCOUNT ON;
 
 -- Inserts a OrderDetail row
 INSERT INTO OrderDetail 
	( OrderID, ProductID, Quantity, Price ) 
 VALUES 
	( @OrderID, @ProductID, @Quantity, @Price ) ;
 
 IF @@ROWCOUNT>0 AND @@ERROR=0 -- Checks if the last statement produced an error
	-- Selects the primay key value and the generated timestamp which is put back into the dataset
   SELECT @OrderDetailID = OrderDetailID, 
		  @Modified = Modified 
   FROM OrderDetail
   WHERE (OrderDetailID = SCOPE_IDENTITY());' 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrderDetail]    Script Date: 04/30/2009 11:23:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeleteOrderDetail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[DeleteOrderDetail] 
(
	@OrderDetailID int
)
AS
 SET NOCOUNT ON;

DELETE FROM OrderDetail WHERE (OrderDetailID = @OrderDetailID);' 
END
GO
/****** Object:  Default [DF_OrderDetail_Quantity]    Script Date: 04/30/2009 11:23:04 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_OrderDetail_Quantity]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_OrderDetail_Quantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_Quantity]  DEFAULT ((1)) FOR [Quantity]
END


End
GO
/****** Object:  Default [DF_Orders_OrderDate]    Script Date: 04/30/2009 11:23:04 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Orders_OrderDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Orders_OrderDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
END


End
GO
/****** Object:  ForeignKey [FK_OrderDetail_Orders]    Script Date: 04/30/2009 11:23:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Orders]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
/****** Object:  ForeignKey [FK_OrderDetail_Product]    Script Date: 04/30/2009 11:23:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
/****** Object:  ForeignKey [FK_Orders_Customer]    Script Date: 04/30/2009 11:23:04 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Orders_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Orders]'))
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customer]
GO

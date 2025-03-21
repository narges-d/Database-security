USE ShirazuCompany;
GO

CREATE TABLE Customers(
	[CustomerNumber] int NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](50) NULL,
	[Zip] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Birthdate] [varchar](50) NULL,
	[Anniversary] [varchar](50) NULL,
	[CCNumber] [varchar](20) NULL
	CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
	(
	[CustomerNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/********************************/

BULK 
INSERT Customers
        FROM 'E:\Courses\DBS\Encryption\customersData.csv'
            WITH
    (
                FIELDTERMINATOR = ',',
                ROWTERMINATOR = '\n'
    )
GO

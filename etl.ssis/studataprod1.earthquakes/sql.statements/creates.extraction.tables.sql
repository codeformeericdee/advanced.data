USE [ADMEDEarthquakeTracking]
GO

/****** Object:  Table [Import].[Earthquake]    Script Date: 10/22/2022 10:21:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Extract].[Earthquake](
	[id] [tinyint] NOT NULL,
	[date] [date] NOT NULL,
	[time] [time](7) NOT NULL,
	[lat] [float] NOT NULL,
	[long] [float] NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NULL,
	[area] [nvarchar](50) NULL,
	[dist] [float] NULL,
	[depth] [float] NOT NULL,
	[direction] [nvarchar](50) NULL,
	[xm] [float] NOT NULL,
	[md] [float] NOT NULL,
	[richter] [float] NOT NULL,
	[mw] [float] NULL,
	[ms] [float] NOT NULL,
	[mb] [float] NOT NULL,
	[pkAutoId] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pkAutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
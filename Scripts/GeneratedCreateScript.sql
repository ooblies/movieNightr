CREATE DATABASE MovieNightr
GO

USE MovieNightr
GO

/****** Object:  Schema [staging]    Script Date: 8/25/2017 4:40:05 PM ******/
CREATE SCHEMA [staging]
GO
/****** Object:  Schema [imdb]    Script Date: 8/25/2017 4:40:05 PM ******/
CREATE SCHEMA [imdb]
GO
/****** Object:  Schema [audit]    Script Date: 8/25/2017 4:40:05 PM ******/
CREATE SCHEMA [audit]
GO
/****** Object:  Table [audit].[Log]    Script Date: 8/25/2017 4:40:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit].[Log](
	[LogDate] [datetime] NOT NULL,
	[LogLevelId] [int] NOT NULL
)
GO
/****** Object:  Table [audit].[LogLevel]    Script Date: 8/25/2017 4:40:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [audit].[LogLevel](
	[LogLevelId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](100) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogLevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 8/25/2017 4:40:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 8/25/2017 4:40:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[EventMovies]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventMovies](
	[EventMovieId] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[WasWatched] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventMovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Events]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[EventId] [int] IDENTITY(1,1) NOT NULL,
	[EventLeaderUserId] [int] NOT NULL,
	[EventDate] [date] NOT NULL,
	[EventTime] [time](7) NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](1000) NULL,
	[FilterSetId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[EventUsers]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventUsers](
	[EventUserId] [int] IDENTITY(1,1) NOT NULL,
	[EventId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[EventUserStatusId] [int] NOT NULL,
	[LastActionOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[EventUserStatus]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventUserStatus](
	[EventUserStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventUserStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Filters]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filters](
	[FilterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FilterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[FilterSetFilters]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterSetFilters](
	[FilterSetFilterId] [int] IDENTITY(1,1) NOT NULL,
	[FilterSetId] [int] NOT NULL,
	[FilterId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FilterSetFilterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[FilterSets]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilterSets](
	[FilterSetId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UserId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FilterSetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Friendship]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendship](
	[FriendshipId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FriendId] [int] NOT NULL,
	[FriendshipStatusId] [int] NOT NULL,
	[LastActionUserId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[FriendshipStatus]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendshipStatus](
	[FriendshipStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendshipStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieActors]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieActors](
	[MovieActorId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieDirectors]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieDirectors](
	[MovieDirectorId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[DirectorId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieDirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieGenres]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieGenres](
	[MovieGenreId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieGenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieLanguages]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieLanguages](
	[MovieLanguageId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[LanguageId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieLists]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieLists](
	[MovieListId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[Rank] [int] NULL,
	[MovieListStatusId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieListStatus]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieListStatus](
	[MovieListStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieListStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieProducers]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieProducers](
	[MovieProducerId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Rating] [nvarchar](100) NULL,
	[ReleaseYear] [int] NOT NULL,
	[ReleaseNumber] [nvarchar](10) NULL,
	[IsTV] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieTags]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieTags](
	[MovieTagId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[MovieWriters]    Script Date: 8/25/2017 4:40:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieWriters](
	[MovieWriterId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[WriterId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MovieWriterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[ProducerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Recommendations]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recommendations](
	[RecommendationId] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[RecommendationDate] [datetime] NOT NULL,
	[Comment] [nvarchar](1000) NULL,
	[HasSeen] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecommendationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[UserStatusId] [int] NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[UserStatusId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[WriterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
	[ModifiedBy] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WriterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [staging].[Actors]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Actors](
	[Movie] [nvarchar](500) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [staging].[Directors]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Directors](
	[Movie] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Name] [nvarchar](2000) NULL
)
GO
/****** Object:  Table [staging].[Genres]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Genres](
	[Movie] [nvarchar](500) NOT NULL,
	[Genre] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table .[Actors]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Actors](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](2000) NULL,
	[Actor] [nvarchar](2000) NULL,
	[Roles] [nvarchar](2000) NULL
)
GO
/****** Object:  Table [imdb].[Actresses]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Actresses](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](2000) NOT NULL,
	[Actress] [nvarchar](2000) NOT NULL,
	[Roles] [nvarchar](2000) NULL
)
GO
/****** Object:  Table [imdb].[Directors]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Directors](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](2000) NULL,
	[Director] [nvarchar](2000) NULL
)
GO
/****** Object:  Table [imdb].[Genres]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Genres](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [imdb].[Keywords]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Keywords](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](500) NOT NULL,
	[Keyword] [nvarchar](500) NOT NULL
)
GO
/****** Object:  Table [imdb].[Languages]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Languages](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](500) NOT NULL,
	[Language] [nvarchar](500) NOT NULL
)
GO
/****** Object:  Table [imdb].[Movies]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Movies](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [imdb].[Producers]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Producers](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](500) NOT NULL,
	[Producer] [nvarchar](500) NOT NULL
)
GO
/****** Object:  Table [imdb].[Ratings]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Ratings](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](500) NOT NULL,
	[Rating] [nvarchar](500) NOT NULL
)
GO
/****** Object:  Table [imdb].[Writers]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [imdb].[Writers](
	[Data] [nvarchar](2000) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Movie] [nvarchar](500) NOT NULL,
	[Writer] [nvarchar](500) NOT NULL
)
GO
/****** Object:  Table [staging].[Keywords]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Keywords](
	[Movie] [nvarchar](500) NOT NULL,
	[Keyword] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [staging].[Languages]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Languages](
	[Movie] [nvarchar](500) NOT NULL,
	[Language] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [staging].[Movies]    Script Date: 8/25/2017 4:40:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Movies](
	[Movie] [nvarchar](500) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[ReleaseYear] [nvarchar](10) NULL,
	[IsTV] [bit] NULL,
	[ReleaseNumber] [nvarchar](10) NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [staging].[Producers]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Producers](
	[Movie] [nvarchar](500) NOT NULL,
	[Producer] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [staging].[Ratings]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Ratings](
	[Movie] [nvarchar](500) NOT NULL,
	[Rating] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
/****** Object:  Table [staging].[Writers]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [staging].[Writers](
	[Movie] [nvarchar](500) NOT NULL,
	[Writer] [nvarchar](500) NOT NULL,
	[CreatedOn] [datetime] NOT NULL
)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Actors_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Actors_Name] ON [dbo].[Actors]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Directors_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Directors_Name] ON [dbo].[Directors]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_EventMovies_EventId_MovieId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventMovies_EventId_MovieId] ON [dbo].[EventMovies]
(
	[EventId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_EventUsers_EventId_UserId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventUsers_EventId_UserId] ON [dbo].[EventUsers]
(
	[EventId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_FilterSetFilters_FilterSetId_FilterId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_FilterSetFilters_FilterSetId_FilterId] ON [dbo].[FilterSetFilters]
(
	[FilterSetId] ASC,
	[FilterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_FilterSets_UserId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_FilterSets_UserId] ON [dbo].[FilterSets]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_Friendship_UserId_FriendId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Friendship_UserId_FriendId] ON [dbo].[Friendship]
(
	[UserId] ASC,
	[FriendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Genres_Name] ON [dbo].[Genres]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Languages_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Languages_Name] ON [dbo].[Languages]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieActors_MovieId_ActorId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieActors_MovieId_ActorId] ON [dbo].[MovieActors]
(
	[MovieId] ASC,
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieDirectors_MovieId_DirectorId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieDirectors_MovieId_DirectorId] ON [dbo].[MovieDirectors]
(
	[MovieId] ASC,
	[DirectorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieGenres_MovieId_GenreId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieGenres_MovieId_GenreId] ON [dbo].[MovieGenres]
(
	[MovieId] ASC,
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieLanguages_MovieId_LanguageId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieLanguages_MovieId_LanguageId] ON [dbo].[MovieLanguages]
(
	[MovieId] ASC,
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieLists_MovieId_UserId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieLists_MovieId_UserId] ON [dbo].[MovieLists]
(
	[MovieId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieProducers_MovieId_ProducerId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieProducers_MovieId_ProducerId] ON [dbo].[MovieProducers]
(
	[MovieId] ASC,
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_Title]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Movies_Title] ON [dbo].[Movies]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Movies_Unique]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Movies_Unique] ON [dbo].[Movies]
(
	[Title] ASC,
	[ReleaseYear] ASC,
	[ReleaseNumber] ASC,
	[IsTV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieTags_MovieId_TagId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieTags_MovieId_TagId] ON [dbo].[MovieTags]
(
	[MovieId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
/****** Object:  Index [IX_MovieWrtiers_MovieId_WriterId]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_MovieWrtiers_MovieId_WriterId] ON [dbo].[MovieWriters]
(
	[MovieId] ASC,
	[WriterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Producers_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Producers_Name] ON [dbo].[Producers]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tags_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tags_Name] ON [dbo].[Tags]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Writers_Name]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Writers_Name] ON [dbo].[Writers]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Actors_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Actors_Movie] ON [staging].[Actors]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Directors_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Directors_Movie] ON [staging].[Directors]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Genres_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Genres_Movie] ON [staging].[Genres]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Keywords_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Keywords_Movie] ON [staging].[Keywords]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Languages_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Languages_Movie] ON [staging].[Languages]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Movies_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Movies_Movie] ON [staging].[Movies]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Producers_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Producers_Movie] ON [staging].[Producers]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Ratings_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Ratings_Movie] ON [staging].[Ratings]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Staging_Writers_Movie]    Script Date: 8/25/2017 4:40:10 PM ******/
CREATE NONCLUSTERED INDEX [IX_Staging_Writers_Movie] ON [staging].[Writers]
(
	[Movie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
GO
ALTER TABLE [audit].[Log] ADD  DEFAULT (getdate()) FOR [LogDate]
GO
ALTER TABLE [audit].[LogLevel] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [audit].[LogLevel] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Actors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Actors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Actors] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Directors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Directors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Directors] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[EventMovies] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EventMovies] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[EventMovies] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[EventUsers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EventUsers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[EventUsers] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[EventUserStatus] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[EventUserStatus] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[EventUserStatus] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Filters] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Filters] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Filters] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[FilterSetFilters] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FilterSetFilters] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[FilterSetFilters] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[FilterSets] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FilterSets] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[FilterSets] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Friendship] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Friendship] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Friendship] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[FriendshipStatus] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[FriendshipStatus] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[FriendshipStatus] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Genres] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Genres] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Genres] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Languages] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Languages] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Languages] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieActors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieActors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieActors] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieDirectors] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieDirectors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieDirectors] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieGenres] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieGenres] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieGenres] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieLanguages] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieLanguages] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieLanguages] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieLists] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieLists] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieLists] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieListStatus] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieListStatus] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieListStatus] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieProducers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieProducers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieProducers] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Movies] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieTags] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieTags] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieTags] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[MovieWriters] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MovieWriters] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[MovieWriters] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Producers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Producers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Producers] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Recommendations] ADD  DEFAULT ((0)) FOR [HasSeen]
GO
ALTER TABLE [dbo].[Recommendations] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Recommendations] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Recommendations] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Tags] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Tags] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Tags] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[UserStatus] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserStatus] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[UserStatus] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [dbo].[Writers] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Writers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[Writers] ADD  DEFAULT (getdate()) FOR [ModifiedOn]
GO
ALTER TABLE [staging].[Actors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Directors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Genres] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Actors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Actresses] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Directors] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Genres] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Keywords] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Languages] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Movies] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Producers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Ratings] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [imdb].[Writers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Keywords] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Languages] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Movies] ADD  DEFAULT (NULL) FOR [Movie]
GO
ALTER TABLE [staging].[Movies] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Producers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Ratings] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [staging].[Writers] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [audit].[Log]  WITH CHECK ADD FOREIGN KEY([LogLevelId])
REFERENCES [audit].[LogLevel] ([LogLevelId])
GO
ALTER TABLE [dbo].[EventMovies]  WITH CHECK ADD FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([EventId])
GO
ALTER TABLE [dbo].[EventMovies]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([EventLeaderUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD FOREIGN KEY([FilterSetId])
REFERENCES [dbo].[FilterSets] ([FilterSetId])
GO
ALTER TABLE [dbo].[EventUsers]  WITH CHECK ADD FOREIGN KEY([EventId])
REFERENCES [dbo].[Events] ([EventId])
GO
ALTER TABLE [dbo].[EventUsers]  WITH CHECK ADD FOREIGN KEY([EventUserStatusId])
REFERENCES [dbo].[EventUserStatus] ([EventUserStatusId])
GO
ALTER TABLE [dbo].[EventUsers]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[FilterSetFilters]  WITH CHECK ADD FOREIGN KEY([FilterId])
REFERENCES [dbo].[Filters] ([FilterId])
GO
ALTER TABLE [dbo].[FilterSetFilters]  WITH CHECK ADD FOREIGN KEY([FilterSetId])
REFERENCES [dbo].[FilterSets] ([FilterSetId])
GO
ALTER TABLE [dbo].[FilterSets]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD FOREIGN KEY([FriendId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD FOREIGN KEY([FriendshipStatusId])
REFERENCES [dbo].[FriendshipStatus] ([FriendshipStatusId])
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD FOREIGN KEY([LastActionUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Friendship]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([ActorId])
GO
ALTER TABLE [dbo].[MovieActors]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieDirectors]  WITH CHECK ADD FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Directors] ([DirectorId])
GO
ALTER TABLE [dbo].[MovieDirectors]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieGenres]  WITH CHECK ADD FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
GO
ALTER TABLE [dbo].[MovieGenres]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieLanguages]  WITH CHECK ADD FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Languages] ([LanguageId])
GO
ALTER TABLE [dbo].[MovieLanguages]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieLists]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieLists]  WITH CHECK ADD FOREIGN KEY([MovieListStatusId])
REFERENCES [dbo].[MovieListStatus] ([MovieListStatusId])
GO
ALTER TABLE [dbo].[MovieLists]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[MovieProducers]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieProducers]  WITH CHECK ADD FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producers] ([ProducerId])
GO
ALTER TABLE [dbo].[MovieTags]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieTags]  WITH CHECK ADD FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[MovieWriters]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[MovieWriters]  WITH CHECK ADD FOREIGN KEY([WriterId])
REFERENCES [dbo].[Writers] ([WriterId])
GO
ALTER TABLE [dbo].[Recommendations]  WITH CHECK ADD FOREIGN KEY([FromUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Recommendations]  WITH CHECK ADD FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([MovieId])
GO
ALTER TABLE [dbo].[Recommendations]  WITH CHECK ADD FOREIGN KEY([ToUserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([UserStatusId])
REFERENCES [dbo].[UserStatus] ([UserStatusId])
GO
/****** Object:  StoredProcedure [dbo].[Import_Actors]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/20/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Import_Actors]

AS
BEGIN
    SET NOCOUNT ON

    -- Insert statements for procedure here
    DELETE FROM Actors
	DBCC CHECKIDENT ('Actors', RESEED, 1)

	INSERT INTO Actors (Name, CreatedBy, ModifiedBy)
	SELECT DISTINCT Name, 'Import','Import'
	FROM staging.Actors

END
GO
/****** Object:  StoredProcedure [dbo].[Import_Directors]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/20/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Import_Directors]

AS
BEGIN
    SET NOCOUNT ON

    -- Insert statements for procedure here
    DELETE FROM Directors
	DBCC CHECKIDENT ('Directors', RESEED, 1)

	INSERT INTO Directors (Name, CreatedBy, ModifiedBy)
	SELECT DISTINCT Name, 'Import','Import'
	FROM staging.Directors
END
GO
/****** Object:  StoredProcedure [dbo].[Import_Genres]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/6/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Import_Genres]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	DELETE FROM Genres
	DBCC CHECKIDENT ('Genres', RESEED, 1)

	INSERT INTO Genres (Name, CreatedBy, Modifiedby)
    SELECT DISTINCT Genre, 'Import','Import'
	FROM staging.Genres
END
GO
/****** Object:  StoredProcedure [dbo].[Import_MovieActors]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/20/17
-- Description: 
-- =============================================
Create PROCEDURE [dbo].[Import_MovieActors]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    DELETE FROM MovieActors
	DBCC CHECKIDENT ('MovieActors', RESEED, 1)

	INSERT INTO MovieActors (MovieID, ActorId, CreatedBy, ModifiedBy)
	SELECT m.MovieId, a.ActorId, 'Import','Import'
	FROM staging.Actors sa
	INNER JOIN Actors a
	ON a.Name = sa.Name
	INNER JOIN staging.Movies sm
	ON sa.Movie = sm.Movie
	INNER JOIN Movies m
	ON m.Title = sm.Title
	AND m.ReleaseYear = sm.ReleaseYear
	AND COALESCE(m.ReleaseNumber, 'NULL') = COALESCE(sm.ReleaseNumber, 'NULL')
	AND m.IsTv = sm.IsTv
END
GO
/****** Object:  StoredProcedure [dbo].[Import_MovieDirectors]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/20/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Import_MovieDirectors]

AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
    DELETE FROM MovieDirectors
	DBCC CHECKIDENT ('MovieDirectors', RESEED, 1)

	INSERT INTO MovieDirectors (MovieID, DirectorId, CreatedBy, ModifiedBy)
	SELECT m.MovieId, d.DirectorId, 'Import','Import'
	FROM staging.Directors sd
	INNER JOIN Directors d
	ON d.Name = sd.Name
	INNER JOIN staging.Movies sm
	ON sd.Movie = sm.Movie
	INNER JOIN Movies m
	ON m.Title = sm.Title
	AND m.ReleaseYear = sm.ReleaseYear
	AND COALESCE(m.ReleaseNumber, 'NULL') = COALESCE(sm.ReleaseNumber, 'NULL')
	AND m.IsTv = sm.IsTv
END
GO
/****** Object:  StoredProcedure [dbo].[Import_MovieGenres]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Import_MovieGenres]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	DELETE FROM MovieGenres
	DBCC CHECKIDENT ('MovieGenres', RESEED, 1)

	INSERT INTO MovieGenres (MovieId, GenreId, CreatedBy, ModifiedBy)
	SELECT m.MovieId, g.GenreId, 'Import','Import'
	FROM staging.Genres mg
	INNER JOIN staging.Movies sm
	ON mg.Movie = sm.Movie
	INNER JOIN Movies m
	ON m.Title = sm.Title
	AND m.ReleaseYear = sm.ReleaseYear
	AND COALESCE(m.ReleaseNumber, 'NULL') = COALESCE(sm.ReleaseNumber, 'NULL')
	AND m.IsTv = sm.IsTv
	INNER JOIN Genres g
	ON g.Name = mg.Genre
	GROUP BY m.MovieId, g.GenreId

END
GO
/****** Object:  StoredProcedure [dbo].[Import_Movies]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Import_Movies]
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON

    -- Insert statements for procedure here
	DELETE FROM Movies
	DBCC CHECKIDENT ('Movies', RESEED, 1)

	INSERT INTO Movies (Title, ReleaseYear, ReleaseNumber, IsTv, CreatedBy, ModifiedBy)
	SELECT Title, 
		   ReleaseYear, 
		   CASE WHEN ReleaseNumber = '' THEN NULL ELSE ReleaseNumber END, 
		   IsTV, 
		   'Import',
		   'Import'
	FROM staging.Movies
END
GO
/****** Object:  StoredProcedure [dbo].[Process_IMDBActors]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Process_IMDBActors]

AS
BEGIN

    SET NOCOUNT ON;

	DELETE FROM staging.Actors
	INSERT INTO staging.Actors (Movie, Name)
	SELECT Movie, Actor
	FROM imdb.Actors
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[Process_IMDBActresses]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Process_IMDBActresses]

AS
BEGIN

    SET NOCOUNT ON;

	DELETE FROM staging.Actors
	INSERT INTO staging.Actors (Movie, Name)
	SELECT Movie, Actress
	FROM imdb.Actresses
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[Process_IMDBDirectors]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Process_IMDBDirectors]

AS
BEGIN

    SET NOCOUNT ON;

	DELETE FROM staging.Directors
		
	INSERT INTO staging.Directors (Movie, Name)
	select Movie, 	
			CASE WHEN Director LIKE '%(%' THEN SUBSTRING(Director, CHARINDEX(',', Director) + 2, CHARINDEX('(', Director) - CHARINDEX(',', Director) - 3)
			+ ' ' + SUBSTRING(Director, 0, CHARINDEX(',', Director))
			+ ' ' + SUBSTRING(Director, CHARINDEX('(', Director), LEN(Director))
				ELSE SUBSTRING(Director, CHARINDEX(',', Director) + 2, LEN(Director)) 
				+ ' ' + SUBSTRING(Director, 0, CHARINDEX(',', Director))
			END AS Name
	from imdb.Directors
END





GO
/****** Object:  StoredProcedure [dbo].[Process_IMDBGenres]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Process_IMDBGenres]

AS
BEGIN

    SET NOCOUNT ON;

	DELETE FROM staging.Genres

	INSERT INTO staging.Genres (Movie, Genre)
	SELECT SUBSTRING(Data, 1, CHARINDEX(CHAR(9),Data) - 1), 
		   LTRIM(RTRIM(REPLACE(SUBSTRING(Data, CHARINDEX(CHAR(9), Data), LEN(DATA)), CHAR(9), '')))
	FROM imdb.Genres	
END
GO
/****** Object:  StoredProcedure [dbo].[Process_IMDBMovies]    Script Date: 8/25/2017 4:40:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Chris Dudziak
-- Create Date: 5/16/17
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[Process_IMDBMovies]
AS
BEGIN    
    SET NOCOUNT ON

	DELETE FROM staging.Movies
	INSERT INTO staging.Movies (Movie, Title, ReleaseYear, IsTv, ReleaseNumber, CreatedOn)
	select	
		LTRIM(RTRIM(REPLACE(LEFT(Data, LEN(Data) - 4), CHAR(9), ''))),
		LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''), REVERSE(SUBSTRING(REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', '')),0,CHARINDEX(' ',REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''))))), ''))) AS Title,
		RIGHT(Data,4) AS Year,
		CASE WHEN Data LIKE '%(TV)%' THEN 1 ELSE 0 END AS IsTV,
       
		
		CASE WHEN RIGHT(REPLACE(REPLACE(SUBSTRING(Data,1,LEN(Data) - 4), CHAR(9), ''), '(TV)', ''), 6) <> '(' + RIGHT(Data, 4) + ')'
			 THEN SUBSTRING(REPLACE(REPLACE(REVERSE(SUBSTRING(REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', '')),0,CHARINDEX(' ',REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''))))),')',''),'(',''), CHARINDEX('/', REPLACE(REPLACE(REVERSE(SUBSTRING(REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', '')),0,CHARINDEX(' ',REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''))))),')',''),'(','')) + 1, 10)
			 ELSE NULL END AS ReleaseNumber		,
		GETDATE()
	FROM imdb.Movies
	WHERE RIGHT(Data,4) != '????' 
	  AND REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), '') NOT LIKE '%(V)'	  
	  AND REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), '') NOT LIKE '%(VG)'	  
	  AND REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), '') NOT LIKE '%{{SUSPENDED}}'
	  AND REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), '') NOT LIKE '%(????%'	  
	  AND REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), '') NOT LIKE '%----%'	
	GROUP BY 
		LTRIM(RTRIM(REPLACE(LEFT(Data, LEN(Data) - 4), CHAR(9), ''))),
		REPLACE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''), REVERSE(SUBSTRING(REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', '')),0,CHARINDEX(' ',REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''))))), ''),
		RIGHT(Data,4),
		CASE WHEN Data LIKE '%(TV)%' THEN 1 ELSE 0 END,
       
		
		CASE WHEN RIGHT(REPLACE(REPLACE(SUBSTRING(Data,1,LEN(Data) - 4), CHAR(9), ''), '(TV)', ''), 6) <> '(' + RIGHT(Data, 4) + ')'
			 THEN SUBSTRING(REPLACE(REPLACE(REVERSE(SUBSTRING(REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', '')),0,CHARINDEX(' ',REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''))))),')',''),'(',''), CHARINDEX('/', REPLACE(REPLACE(REVERSE(SUBSTRING(REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', '')),0,CHARINDEX(' ',REVERSE(REPLACE(REPLACE(SUBSTRING(Data, 1, LEN(Data) - 4), CHAR(9), ''), '(TV)', ''))))),')',''),'(','')) + 1, 10)
			 ELSE NULL END
			
END
GO

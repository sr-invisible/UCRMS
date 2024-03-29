USE [master]
GO
/****** Object:  Database [UCRMFinalDB]    Script Date: 9/14/2019 1:47:12 PM ******/
CREATE DATABASE [UCRMFinalDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UCRMFinalDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\UCRMFinalDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UCRMFinalDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\Backup\UCRMFinalDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UCRMFinalDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UCRMFinalDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UCRMFinalDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UCRMFinalDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UCRMFinalDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UCRMFinalDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UCRMFinalDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UCRMFinalDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UCRMFinalDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UCRMFinalDB] SET  MULTI_USER 
GO
ALTER DATABASE [UCRMFinalDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UCRMFinalDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UCRMFinalDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UCRMFinalDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UCRMFinalDB]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Credit] [decimal](18, 2) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[SemesterId] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignStudent]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseAssignStudent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_CourseAssignStudent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseAssignTeacher]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignTeacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[CourseCredit] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CourseAssignTeacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Days]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Days](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DayName] [varchar](50) NOT NULL,
	[DayDet] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Days] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Room]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [varchar](50) NOT NULL,
	[IsAssign] [bit] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomAssign]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomAssign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[RoomId] [int] NOT NULL,
	[DayId] [int] NOT NULL,
	[StartTime] [varchar](10) NOT NULL,
	[StartAMPM] [varchar](5) NOT NULL,
	[EndTime] [varchar](50) NOT NULL,
	[EndAMPM] [varchar](5) NOT NULL,
	[IsAssign] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Semester](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Date] [date] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_StudentResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teacher](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ContactNo] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[CreditToTake] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewAllCoursesWithTeacher]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewAllCoursesWithTeacher]
AS
SELECT        dbo.Course.Code, dbo.Course.Name, dbo.Course.DepartmentId, dbo.Semester.Name AS Semester, dbo.Teacher.Name AS AssignedTo, 
                         dbo.Course.IsActive
FROM            dbo.Course LEFT OUTER JOIN
                         dbo.Semester ON dbo.Course.SemesterId = dbo.Semester.Id LEFT OUTER JOIN
                         dbo.CourseAssignTeacher ON dbo.Course.Id = dbo.CourseAssignTeacher.CourseId AND dbo.CourseAssignTeacher.IsActive=1  LEFT OUTER JOIN
                         dbo.Teacher ON dbo.CourseAssignTeacher.TeacherId = dbo.Teacher.Id

GO
/****** Object:  View [dbo].[ViewClassScheduleRoomAllocation]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewClassScheduleRoomAllocation]
AS
SELECT        dbo.RoomAssign.DepartmentId, dbo.Course.Code, dbo.Course.Name, dbo.Room.RoomName, dbo.Days.DayName, dbo.RoomAssign.StartTime, 
                         dbo.RoomAssign.StartAMPM, dbo.RoomAssign.EndTime, dbo.RoomAssign.EndAMPM, dbo.RoomAssign.IsAssign
FROM            dbo.Department INNER JOIN
                         dbo.RoomAssign ON dbo.Department.Id = dbo.RoomAssign.DepartmentId INNER JOIN
                         dbo.Days ON dbo.RoomAssign.DayId = dbo.Days.Id INNER JOIN
                         dbo.Course ON dbo.RoomAssign.CourseId = dbo.Course.Id AND dbo.Department.Id = dbo.Course.DepartmentId INNER JOIN
                         dbo.Room ON dbo.RoomAssign.RoomId = dbo.Room.Id

GO
/****** Object:  View [dbo].[ViewDepartmentCourse]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewDepartmentCourse]
AS
SELECT        dbo.Department.Id, dbo.Course.Code, dbo.Course.Name
FROM            dbo.Department INNER JOIN
                         dbo.Course ON dbo.Department.Id = dbo.Course.DepartmentId



GO
/****** Object:  View [dbo].[ViewStudentWithDEpartment]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewStudentWithDEpartment]
AS
SELECT        dbo.Student.Id, dbo.Student.Name, dbo.Student.Email, dbo.Student.ContactNo, dbo.Student.Address, dbo.Student.Date, dbo.Student.RegNo, 
                         dbo.Student.DepartmentId, dbo.Department.Name AS Department
FROM            dbo.Student LEFT OUTER JOIN
                         dbo.Department ON dbo.Student.DepartmentId = dbo.Department.Id




GO
/****** Object:  View [dbo].[ViewTeacherWithCouse]    Script Date: 9/14/2019 1:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTeacherWithCouse]
AS
SELECT        dbo.Teacher.Id AS TeacherId, dbo.Teacher.CreditToTake, ISNULL(SUM(dbo.CourseAssignTeacher.CourseCredit), 0) AS CreditTaken
FROM            dbo.Teacher LEFT OUTER JOIN
                         dbo.CourseAssignTeacher ON dbo.Teacher.Id = dbo.CourseAssignTeacher.TeacherId AND dbo.CourseAssignTeacher.IsActive = 1
GROUP BY dbo.Teacher.CreditToTake, dbo.Teacher.Id



GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (1, N'CSE-101', N'Computer Programming', CAST(3.00 AS Decimal(18, 2)), N'C programming', 1006, 1, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2, N'PHY-101', N'Thamodynamics', CAST(2.00 AS Decimal(18, 2)), N'First Semester Subject', 1007, 1, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (3, N'CSE-103', N'Algorithm', CAST(4.00 AS Decimal(18, 2)), N'Subject of CSE', 1006, 7, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (4, N'CSE-206', N'Database', CAST(3.50 AS Decimal(18, 2)), N'hjghg', 1006, 4, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (5, N'CSE-111', N'Networking', CAST(4.90 AS Decimal(18, 2)), N'ddfgfgvg', 1006, 1, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (6, N'CSE-303', N'Computer Programming 2', CAST(3.50 AS Decimal(18, 2)), N'Java programming', 1006, 4, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (7, N'CSE-211', N'aaa', CAST(4.00 AS Decimal(18, 2)), N'sdfd', 1006, 4, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (1007, N'CHE-101', N'Chemical Reaction', CAST(3.50 AS Decimal(18, 2)), N'Subject of Chemistry', 2002, 2, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2007, N'CSE-129', N'Software Engineering', CAST(4.00 AS Decimal(18, 2)), N'hjghg', 1006, 4, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2008, N'CSE-109', N'Electrical & Electronics Engineering', CAST(3.00 AS Decimal(18, 2)), N'Database Design & Structure Fundamental', 1006, 5, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2009, N'CSE-505', N'Computer Fundamental', CAST(3.00 AS Decimal(18, 2)), N'Computer Fundamenta Course', 1006, 4, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2010, N'CSE-105', N'Computer Fundamental 1', CAST(3.00 AS Decimal(18, 2)), N'Database Design & Structure Fundamental', 1006, 2, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2011, N'CSE-121', N'Structural Engineering', CAST(3.00 AS Decimal(18, 2)), N'Physics', 1007, 8, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2012, N'PHY-203', N'Applied Physics', CAST(3.00 AS Decimal(18, 2)), N'Applied Physics', 1007, 1, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2013, N'ECO-101', N'Human Resource', CAST(5.00 AS Decimal(18, 2)), N'sddff', 2005, 1, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2014, N'ECO-102', N'dfdfff', CAST(4.50 AS Decimal(18, 2)), N'gfgt', 2005, 5, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2015, N'ECO-112', N'vfv', CAST(5.00 AS Decimal(18, 2)), N'dfdf', 2005, 6, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2016, N'ECO-122', N'fef', CAST(5.00 AS Decimal(18, 2)), N'fefef', 2005, 7, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2017, N'ECO-312', N'vffvgfv', CAST(5.00 AS Decimal(18, 2)), N'rggg', 2005, 6, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2018, N'ECO-324', N'fdf', CAST(5.00 AS Decimal(18, 2)), N'rfg', 2005, 4, 0)
INSERT [dbo].[Course] ([Id], [Code], [Name], [Credit], [Description], [DepartmentId], [SemesterId], [IsActive]) VALUES (2019, N'ECO-124', N'gth', CAST(5.00 AS Decimal(18, 2)), N'ggtg', 2005, 1, 0)
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignStudent] ON 

INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (1, 29, N'Computer Science & Engineering', 1006, 1, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (2, 30, N'Computer Science & Engineering', 1006, 3, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (3, 29, N'Computer Science & Engineering', 1006, 7, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (4, 34, N'Computer Science & Engineering', 1006, 7, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (5, 29, N'Computer Science & Engineering', 1006, 7, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (6, 29, N'Computer Science & Engineering', 1006, 3, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (7, 40, N'Physics', 1007, 2, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (8, 41, N'Physics', 1007, 2, CAST(0x5E3B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (9, 32, N'Computer Science & Engineering', 1006, 1, CAST(0x603B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (10, 32, N'Computer Science & Engineering', 1006, 6, CAST(0x603B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (11, 29, N'Computer Science & Engineering', 1006, 6, CAST(0x623B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (12, 29, N'Computer Science & Engineering', 1006, 6, CAST(0x623B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (13, 29, N'Computer Science & Engineering', 1006, 6, CAST(0x623B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (14, 29, N'Computer Science & Engineering', 1006, 4, CAST(0x623B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (15, 29, N'Computer Science & Engineering', 1006, 4, CAST(0x623B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (16, 35, N'Computer Science & Engineering', 0, 6, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (17, 35, N'Computer Science & Engineering', 0, 6, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (18, 35, N'Computer Science & Engineering', 0, 6, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (19, 33, N'Computer Science & Engineering', 0, 5, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (20, 33, N'Computer Science & Engineering', 0, 5, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (21, 33, N'Computer Science & Engineering', 0, 5, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (22, 33, N'Computer Science & Engineering', 0, 5, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (23, 33, N'Computer Science & Engineering', 0, 5, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (24, 34, N'Computer Science & Engineering', 1006, 3, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (25, 32, N'Computer Science & Engineering', 1006, 2008, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (26, 32, N'Computer Science & Engineering', 1006, 2008, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (27, 31, N'Computer Science & Engineering', 1006, 6, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (28, 44, N'Computer Science & Engineering', 1006, 2007, CAST(0x813B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (29, 45, N'Physics', 1007, 2011, CAST(0x833B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (30, 47, N'Economics', 2005, 2013, CAST(0x833B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (31, 47, N'Economics', 2005, 2013, CAST(0x833B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (32, 48, N'Economics', 2005, 2013, CAST(0x833B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (33, 47, N'Economics', 2005, 2014, CAST(0x833B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (34, 47, N'Economics', 2005, 2017, CAST(0x833B0B00 AS Date))
INSERT [dbo].[CourseAssignStudent] ([Id], [StudentId], [DepartmentName], [DepartmentId], [CourseId], [Date]) VALUES (35, 47, N'Economics', 2005, 2019, CAST(0x833B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[CourseAssignStudent] OFF
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] ON 

INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (2, 1, 1, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (3, 1, 3, CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (4, 1, 4, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (5, 1, 5, CAST(4.90 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (6, 1, 6, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (7, 1, 6, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (8, 1, 7, CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1008, 1, 2007, CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1009, 1, 1, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1010, 1, 7, CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1011, 1, 1, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1012, 1, 5, CAST(4.90 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1013, 0, 0, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1014, 1, 4, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1015, 1, 5, CAST(4.90 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1016, 2, 1007, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1019, 3, 2008, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1020, 3, 2008, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1021, 3, 2009, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1022, 3, 2009, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1026, 4, 2010, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1032, 4, 2009, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1033, 4, 2010, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1034, 5, 2, CAST(2.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1035, 4, 1, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1036, 4, 1, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1037, 5, 2011, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1038, 1, 1, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1039, 1, 3, CAST(4.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1040, 1, 4, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1041, 1, 5, CAST(4.90 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1042, 1, 6, CAST(3.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1043, 6, 2, CAST(2.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1044, 6, 2011, CAST(3.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1045, 7, 2013, CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1046, 7, 2014, CAST(4.50 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1047, 7, 2015, CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1048, 7, 2016, CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1049, 7, 2017, CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1050, 7, 2018, CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1051, 7, 2019, CAST(5.00 AS Decimal(18, 2)), 0)
INSERT [dbo].[CourseAssignTeacher] ([Id], [TeacherId], [CourseId], [CourseCredit], [IsActive]) VALUES (1052, 1, 3, CAST(4.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[CourseAssignTeacher] OFF
SET IDENTITY_INSERT [dbo].[Days] ON 

INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (1, N'Fri', N'Friday')
INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (2, N'Sat', N'Saturday')
INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (3, N'Sun', N'Sunday')
INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (4, N'Mon', N'Monday')
INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (5, N'Tue', N'Tuesday')
INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (6, N'Wed', N'Wednesday')
INSERT [dbo].[Days] ([Id], [DayName], [DayDet]) VALUES (7, N'Thu', N'Thursday')
SET IDENTITY_INSERT [dbo].[Days] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1006, N'CSE', N'Computer Science & Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (1007, N'PHY', N'Physics')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2002, N'CHY', N'Chemistry')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2003, N'EEE', N'Electrical & Electronics Engineering')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2004, N'Arch', N'Architechture')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2005, N'ECO', N'Economics')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2006, N'ICT', N'ICT')
INSERT [dbo].[Department] ([Id], [Code], [Name]) VALUES (2007, N'CS', N'Computer Science')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Designation] ON 

INSERT [dbo].[Designation] ([Id], [Name]) VALUES (1, N'Lecturer')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (2, N'Assistant Professor')
INSERT [dbo].[Designation] ([Id], [Name]) VALUES (3, N'Professor')
SET IDENTITY_INSERT [dbo].[Designation] OFF
SET IDENTITY_INSERT [dbo].[Grade] ON 

INSERT [dbo].[Grade] ([Id], [Name]) VALUES (1, N'A+')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (2, N'A')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (3, N'A-')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (4, N'B+')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (5, N'B')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (6, N'B-')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (7, N'C+')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (8, N'C')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (9, N'C-')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (10, N'D+')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (11, N'D')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (12, N'D-')
INSERT [dbo].[Grade] ([Id], [Name]) VALUES (13, N'F')
SET IDENTITY_INSERT [dbo].[Grade] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (1, N'A-101', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (2, N'A-102', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (3, N'A-103', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (4, N'A-104', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (5, N'A-105', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (6, N'B-201', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (8, N'B-202', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (9, N'B-203', 0)
INSERT [dbo].[Room] ([Id], [RoomName], [IsAssign]) VALUES (10, N'B-204', 0)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[RoomAssign] ON 

INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (7, 1006, 6, 4, 4, N'10:10', N'AM', N'12:10', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (8, 1006, 6, 6, 4, N'11:20', N'AM', N'12:59', N'PM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (9, 1006, 1, 1, 2, N'11:20', N'AM', N'12:20', N'PM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (10, 1006, 4, 2, 6, N'09:02', N'AM', N'10:56', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (11, 1006, 1, 3, 3, N'10:25', N'AM', N'11:40', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (12, 1007, 2, 9, 1, N'09:20', N'AM', N'11:30', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (13, 1007, 2, 8, 2, N'09:30', N'AM', N'10:30', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (14, 1006, 1, 2, 1, N'09:10', N'AM', N'11:20', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (15, 1006, 1, 1, 1, N'09:30', N'AM', N'10:30', N'AM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (16, 1007, 2012, 5, 4, N'11:20', N'AM', N'01:30', N'PM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (17, 2005, 2013, 6, 2, N'12:56', N'PM', N'03:34', N'PM', 0)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (18, 1006, 3, 4, 4, N'10:20', N'AM', N'11:20', N'AM', 1)
INSERT [dbo].[RoomAssign] ([Id], [DepartmentId], [CourseId], [RoomId], [DayId], [StartTime], [StartAMPM], [EndTime], [EndAMPM], [IsAssign]) VALUES (19, 1006, 5, 4, 4, N'10:50', N'AM', N'03:00', N'PM', 1)
SET IDENTITY_INSERT [dbo].[RoomAssign] OFF
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([Id], [Name]) VALUES (8, N'Eighth')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (5, N'Fifth')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (1, N'First')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (4, N'Fourth')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (2, N'Second')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (7, N'Seveth')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (6, N'Sixth')
INSERT [dbo].[Semester] ([Id], [Name]) VALUES (3, N'Third')
SET IDENTITY_INSERT [dbo].[Semester] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (29, N'Shemanto Roy', N'sd@dd.c', N'171456789', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (30, N'droy', N'droy@d.hg', N'5656', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (31, N'Bonna Roy', N'fggf@d.hg', N'5656', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (32, N'Joti', N'joti@gmail.com', N'171456', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (33, N'Mufu', N'Mufu@gmail.com', N'01666', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-004')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (34, N'Sadia', N'sadia@sadia.com', N'171456789', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-005')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (35, N'Shemanto roy', N'shemanto@gmail.com', N'0198968', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-006')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (36, N'Demo', N'demo@gmail.com', N'0178632', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-007')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (37, N'Naeem', N'naeem@gmail.com', N'0156', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-008')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (38, N'Rohit Roy', N'rohit@gmail.com', N'5858', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-009')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (39, N'Anuska', N'anuska@gmail.com', N'8638863', N'Dhaka', CAST(0xC93C0B00 AS Date), 1006, N'CSE-2016-010')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (40, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0xC93C0B00 AS Date), 1007, N'PHY-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (41, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0xC93C0B00 AS Date), 1007, N'PHY-2016-002')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (42, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x4C3A0B00 AS Date), 1007, N'PHY-2015-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (43, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x803B0B00 AS Date), 1006, N'CSE-2016-011')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (44, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x803B0B00 AS Date), 1006, N'CSE-2016-012')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (45, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x833B0B00 AS Date), 1007, N'PHY-2016-003')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (46, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x873B0B00 AS Date), 1006, N'CSE-2016-013')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (47, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x843B0B00 AS Date), 2005, N'ECO-2016-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (48, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0x763A0B00 AS Date), 2005, N'ECO-2015-001')
INSERT [dbo].[Student] ([Id], [Name], [Email], [ContactNo], [Address], [Date], [DepartmentId], [RegNo]) VALUES (49, N'demo', N'demo@gmail.com', N'0170000', N'Dhaka', CAST(0xB53C0B00 AS Date), 1006, N'CSE-2017-001')
SET IDENTITY_INSERT [dbo].[Student] OFF
SET IDENTITY_INSERT [dbo].[StudentResult] ON 

INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (1, 29, 1, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (2, 40, 2, 4)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (3, 29, 5, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (4, 29, 3, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (5, 32, 3, 7)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (6, 32, 4, 6)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (7, 41, 2, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (8, 45, 2, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (9, 45, 2011, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (10, 47, 2013, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (11, 29, 4, 1)
INSERT [dbo].[StudentResult] ([Id], [StudentId], [CourseId], [GradeId]) VALUES (12, 29, 6, 11)
SET IDENTITY_INSERT [dbo].[StudentResult] OFF
SET IDENTITY_INSERT [dbo].[Teacher] ON 

INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (1, N'Shemanto Roy', N'Dhaka', N'Shemantoroy@gmail.com', 171456789, 3, 1006, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (2, N'Aziz', N'Chittagong', N'Aziz@gmail.com', 12345678, 1, 2002, CAST(25.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (3, N'Lee ', N'Dhaka', N'lee@gmail.com', 1719336463, 2, 1006, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (4, N'Raddy ', N'Comilla', N'Raddy@gmail.com', 1976835583, 1, 1006, CAST(12.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (5, N'dRoy', N'Dhaka', N'droy@gmail.com', 171933646, 1, 1007, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (6, N'Suchona', N'Dhaka', N'suchona@gmail.com', 1671959215, 2, 1007, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[Teacher] ([Id], [Name], [Address], [Email], [ContactNo], [DesignationId], [DepartmentId], [CreditToTake]) VALUES (7, N'Jotirmory', N'Dinajpur', N'jotirmoy@gmail.com', 465456, 2, 2005, CAST(30.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Teacher] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department]    Script Date: 9/14/2019 1:47:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department] ON [dbo].[Department]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Department_1]    Script Date: 9/14/2019 1:47:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Department_1] ON [dbo].[Department]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Semester]    Script Date: 9/14/2019 1:47:12 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Semester] ON [dbo].[Semester]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RoomAssign]  WITH CHECK ADD  CONSTRAINT [FK_RoomAssign_Course] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[RoomAssign] CHECK CONSTRAINT [FK_RoomAssign_Course]
GO
ALTER TABLE [dbo].[RoomAssign]  WITH CHECK ADD  CONSTRAINT [FK_RoomAssign_Days] FOREIGN KEY([DayId])
REFERENCES [dbo].[Days] ([Id])
GO
ALTER TABLE [dbo].[RoomAssign] CHECK CONSTRAINT [FK_RoomAssign_Days]
GO
ALTER TABLE [dbo].[RoomAssign]  WITH CHECK ADD  CONSTRAINT [FK_RoomAssign_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[RoomAssign] CHECK CONSTRAINT [FK_RoomAssign_Department]
GO
ALTER TABLE [dbo].[RoomAssign]  WITH CHECK ADD  CONSTRAINT [FK_RoomAssign_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[RoomAssign] CHECK CONSTRAINT [FK_RoomAssign_Room]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[19] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 137
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Course"
            Begin Extent = 
               Top = 0
               Left = 430
               Bottom = 217
               Right = 600
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1635
         Width = 1680
         Width = 2415
         Width = 2475
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDepartmentCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewDepartmentCourse'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Student"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Department"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewStudentWithDEpartment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewStudentWithDEpartment'
GO
USE [master]
GO
ALTER DATABASE [UCRMFinalDB] SET  READ_WRITE 
GO

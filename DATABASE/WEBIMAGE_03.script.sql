CREATE DATABASE WebImage
USE [WebImage]
GO
/****** Object:  StoredProcedure [dbo].[Sp_AttributeSearchImage]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_AttributeSearchImage]
(
@SearchText varchar(50)
)
as 
select Picture,HashValue from Hyperedge_Images
where 
HashValue 
in (
select HashValue from Hperedge_Attributes 
where Attr1 like @SearchText + '%' 
or Attr2 like @SearchText + '%'
or Attr3 like @SearchText + '%'
or Attr4 like @SearchText + '%'
or Attr5 like @SearchText + '%'
or Attr6 like @SearchText + '%'
 )

GO
/****** Object:  StoredProcedure [dbo].[Sp_AutoExtender]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_AutoExtender]
(
@PrefixText varchar(50)
)
as
Select ImageNames from dbo.ImageNames where ImageNames like '%' + @PrefixText + '%'

GO
/****** Object:  StoredProcedure [dbo].[Sp_HAttributeCount]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_HAttributeCount](@Attr1 varchar(50),@Attr2 varchar(50),@Attr3 varchar(50),@Attr4 varchar(50),@Attr5 varchar(50),@Attr6 varchar(50))
AS
BEGIN
	select Attribute_Name, count(*) Total_Images
from 
(
  select @Attr1 as Attribute_Name
  from Hperedge_Attributes
  union all
  select @Attr2
  from Hperedge_Attributes
   union all
  select @Attr3
  from Hperedge_Attributes
  union all
  select @Attr4
  from Hperedge_Attributes
  union all
  select @Attr5
  from Hperedge_Attributes
  union all
  select @Attr6
  from Hperedge_Attributes

) d
group by Attribute_Name
order by Total_Images desc
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_HyperImageUpload]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_HyperImageUpload]
(
@Imgname varchar(50),
@OrgImg image,
@Img1 image,
@Img2 image,
@Img3 image,
@Img4 image,
@Img5 image,
@Img6 image,
@Size int,
@Type varchar(50),
@Attr1 varchar(50),
@Attr2 varchar(50),
@Attr3 varchar(50),
@Attr4 varchar(50),
@Attr5 varchar(50),
@Attr6 varchar(50),
@category varchar(50)

)
as
declare @ID int;

INSERT INTO dbo.Hyperedge_Images values(@Imgname,@OrgImg,@Size,@Type,GETDATE())
Set @ID= (select MAX(Hashvalue) from dbo.Hyperedge_Images)
INSERT INTO dbo.Hyperedge values(@ID,@Img1,@Img2,@Img3,@Img4,@Img5,@Img6)
INSERT INTO dbo.Hperedge_Attributes values(@ID,@Attr1,@Attr2,@Attr3,@Attr4,@Attr5,@Attr6)
if not exists (select ImageNames from dbo.ImageNames where ImageNames=@Imgname)
Insert into dbo.ImageNames values (@Imgname,'',@category)


GO
/****** Object:  StoredProcedure [dbo].[Sp_login]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_login](@user_ID varchar(20),@Password varchar(10))
as 
begin
select * from user_register where user_ID=@user_ID and Password=@Password
end 

GO
/****** Object:  StoredProcedure [dbo].[Sp_register]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_register](@Name varchar(20) ,@user_ID varchar(20),@Password varchar(10),@Gender varchar(8),@Email varchar(20),@Mobile bigint,@Location varchar(20))
as
begin
insert into user_register values(@Name,@user_ID,@Password,@Gender,@Email,@Mobile,@Location)
end 

GO
/****** Object:  StoredProcedure [dbo].[Sp_SearchImage2]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_SearchImage2]
(
@SearchText varchar(50),
@Mode int
)
as 
if(@Mode='1')
select HashValue,Picture from dbo.Hyperedge_Images where ImageName like '%' + @SearchText+'%'
else if (@Mode='2')
select HashValue,Picture from dbo.TreeImages where ImageName like '%'+@SearchText+'%'

GO
/****** Object:  StoredProcedure [dbo].[Sp_textupload]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_textupload](@ImageName varchar(50),@ImageFile image)
as
begin
insert into Text_upload values(@ImageName,@ImageFile)
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_TreeImageUpload]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_TreeImageUpload]
(
@Imgname varchar(50),
@OrgImg image,
@Size int,
@Type varchar(50),
@Class varchar(50),
@MidClass varchar(50),
@Attr1 varchar(50),
@Attr2 varchar(50),
@Attr3 varchar(50),
@Attr4 varchar(50),
@Attr5 varchar(50),
@Attr6 varchar(50)
)
as
declare @ID int;

INSERT INTO dbo.Treeimages values(@Imgname,@OrgImg,@Size,@Type,GETDATE())
Set @ID= (select MAX(Hashvalue) from dbo.Treeimages)
INSERT INTO dbo.TreeAttributes values(@ID,@Class,@MidClass,@Attr1,@Attr2,@Attr3,@Attr4,@Attr5,@Attr6)
if not exists (select ImageNames from dbo.ImageNames where ImageNames=@Imgname)
Insert into dbo.ImageNames values (@Imgname,'','')


GO
/****** Object:  StoredProcedure [dbo].[Sp_UserView_HyperImages]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sp_UserView_HyperImages]
(
@HashValue int
)
as 
select 
A.Picture,A.HashValue,
C.Img1,C.Img2,C.Img3,C.Img4,C.Img5,C.Img6,
D.Attr1,D.Attr2,D.Attr3,D.Attr4,D.Attr5,D.Attr6
from 
dbo.Hyperedge_Images as A
join 
dbo.Hyperedge as C
on 
A.HashValue=C.HashValue
join
dbo.Hperedge_Attributes as D
on
A.HashValue=D.Hashvalue
where A.HashValue=@HashValue and 
C.HashValue=@HashValue and 
D.HashValue=@HashValue
GO
/****** Object:  StoredProcedure [dbo].[Sp_UserView_TreeImages]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_UserView_TreeImages]
(
@HashValue int
)
as 
select 
A.Picture,A.HashValue,A.ImageName,
D.Attr1,D.Attr2,D.Attr3,D.Attr4,D.Attr5,D.Attr6,D.Class,D.MidClass
from 
dbo.Treeimages as A
join 
dbo.TreeAttributes as D
on
A.HashValue=D.Hashvalue
where A.HashValue=@HashValue and 
D.HashValue=@HashValue
GO
/****** Object:  StoredProcedure [dbo].[stp_AugmentedImageUpload]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_AugmentedImageUpload]
(
@Imgname varchar(50),
@OrgImg image,
@Img1 image,
@Img2 image,
@Img3 image,
@Img4 image,
@Img5 image,
@Img6 image,
@Size int,
@Type varchar(50),
@Attr1 varchar(50),
@Attr2 varchar(50),
@Attr3 varchar(50),
@Attr4 varchar(50),
@Attr5 varchar(50),
@Attr6 varchar(50),
@category varchar(50)
)
as
declare @ID int;

INSERT INTO dbo.Hyperedge_Images values(@Imgname,@OrgImg,@Size,@Type,GETDATE())
Set @ID= (select MAX(Hashvalue) from dbo.Hyperedge_Images)
INSERT INTO dbo.Hyperedge values(@ID,@Img1,@Img2,@Img3,@Img4,@Img5,@Img6)
INSERT INTO dbo.Hperedge_Attributes values(@ID,@Attr1,@Attr2,@Attr3,@Attr4,@Attr5,@Attr6)
if not exists (select ImageNames from dbo.ImageNames where ImageNames=@Imgname)
Insert into dbo.ImageNames values (@Imgname,'',@category)


GO
/****** Object:  Table [dbo].[Hperedge_Attributes]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hperedge_Attributes](
	[HashValue] [int] NOT NULL,
	[Attr1] [varchar](50) NULL,
	[Attr2] [varchar](50) NULL,
	[Attr3] [varchar](50) NULL,
	[Attr4] [varchar](50) NULL,
	[Attr5] [varchar](50) NULL,
	[Attr6] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hyperedge]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hyperedge](
	[HashValue] [int] NOT NULL,
	[Img1] [image] NOT NULL,
	[Img2] [image] NOT NULL,
	[Img3] [image] NOT NULL,
	[Img4] [image] NOT NULL,
	[Img5] [image] NOT NULL,
	[Img6] [image] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hyperedge_Images]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hyperedge_Images](
	[HashValue] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[Picture] [image] NOT NULL,
	[Size] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImageNames]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImageNames](
	[ImageNames] [varchar](50) NOT NULL,
	[SemanticWords] [varchar](50) NULL,
	[category] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Register]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Register](
	[COMPANYNAME] [varchar](50) NOT NULL,
	[keywords] [varchar](50) NULL,
	[image_dat] [varchar](max) NULL,
	[Product_data] [varchar](max) NULL,
	[COMPANYLOGO] [image] NULL,
	[UserName] [varchar](50) NOT NULL,
	[Passwrd] [varchar](50) NULL,
	[CrmPassword] [varchar](50) NULL,
	[EMail_ID] [varchar](50) NULL,
	[Mobile] [bigint] NULL,
	[STATE] [varchar](50) NULL,
 CONSTRAINT [PK_Register] PRIMARY KEY CLUSTERED 
(
	[COMPANYNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Text_upload]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Text_upload](
	[ImageName] [varchar](50) NULL,
	[ImageFile] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TreeAttributes]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TreeAttributes](
	[HashValue] [int] NOT NULL,
	[Class] [varchar](50) NULL,
	[MidClass] [varchar](50) NULL,
	[Attr1] [varchar](50) NULL,
	[Attr2] [varchar](50) NULL,
	[Attr3] [varchar](50) NULL,
	[Attr4] [varchar](50) NULL,
	[Attr5] [varchar](50) NULL,
	[Attr6] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Treeimages]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Treeimages](
	[HashValue] [int] IDENTITY(1,1000) NOT NULL,
	[ImageName] [varchar](50) NOT NULL,
	[Picture] [image] NOT NULL,
	[Size] [int] NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[DateTime] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_register]    Script Date: 9/15/2015 5:55:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_register](
	[Name] [varchar](20) NULL,
	[user_ID] [varchar](20) NOT NULL,
	[Password] [varchar](10) NULL,
	[Gender] [varchar](8) NULL,
	[Email] [varchar](20) NULL,
	[Mobile] [bigint] NULL,
	[Location] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

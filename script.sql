USE [Faturalandirma]
GO
/****** Object:  StoredProcedure [dbo].[sp_FaturaGetir]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_FaturaGetir]
@FaturaNo int
AS
SELECT *
FROM tbl_FaturaBilgi
WHERE FaturaNo=@FaturaNo
GO
/****** Object:  StoredProcedure [dbo].[sp_FtrEkleme]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_FtrEkleme] (
	@FaturaNo int
)
AS
UPDATE tbl_Fatura SET FaturaTutar=0 WHERE FaturaNo=@FaturaNo
GO
/****** Object:  StoredProcedure [dbo].[sp_FtrTutarEkleme]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_FtrTutarEkleme] (
	@FaturaId int,
	@FBTutar money
)
AS
UPDATE tbl_Fatura SET FaturaTutar=FaturaTutar+@FBTutar WHERE FaturaId=@FaturaId
GO
/****** Object:  StoredProcedure [dbo].[sp_MusteriEkle]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MusteriEkle](
	@MusteriNo int,
	@MusteriAdi nvarchar(20)
)
as
INSERT INTO tbl_Musteri(MusteriNo,MusteriAdi)
VALUES(@MusteriNo,@MusteriAdi)
GO
/****** Object:  Table [dbo].[tbl_Fatura]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Fatura](
	[FaturaId] [int] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [int] NOT NULL,
	[FaturaTutar] [money] NULL,
	[MusteriId] [int] NULL,
 CONSTRAINT [PK_tbl_Fatura] PRIMARY KEY CLUSTERED 
(
	[FaturaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_FaturaBilgi]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FaturaBilgi](
	[FBId] [int] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [int] NULL,
	[FBUrunAdi] [nvarchar](20) NULL,
	[FBUrunAdet] [int] NULL,
	[FBTutar] [money] NULL,
	[UrunId] [int] NULL,
	[FBNo] [int] NULL,
 CONSTRAINT [PK_tbl_FaturaBilgi] PRIMARY KEY CLUSTERED 
(
	[FBId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Musteri]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Musteri](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [int] NULL,
	[MusteriAdi] [nvarchar](20) NULL,
 CONSTRAINT [PK__tbl_Must__72627C22D6F5F594] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Urun]    Script Date: 5.03.2020 09:32:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Urun](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunNo] [int] NULL,
	[UrunAdi] [nvarchar](20) NULL,
	[UrunFiyat] [money] NULL,
 CONSTRAINT [PK__tbl_Urun__623E0928B41B4BD5] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_Fatura]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Fatura_tbl_Musteri] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[tbl_Musteri] ([MusteriId])
GO
ALTER TABLE [dbo].[tbl_Fatura] CHECK CONSTRAINT [FK_tbl_Fatura_tbl_Musteri]
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Fatura] FOREIGN KEY([FaturaNo])
REFERENCES [dbo].[tbl_Fatura] ([FaturaNo])
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi] CHECK CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Fatura]
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[tbl_Urun] ([UrunId])
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi] CHECK CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Urun]
GO

USE [Faturalandirma]
GO
/****** Object:  Table [dbo].[tbl_Fatura]    Script Date: 20.02.2020 19:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Fatura](
	[FaturaId] [int] IDENTITY(1,1) NOT NULL,
	[FaturaNo] [int] NOT NULL,
	[FaturaTutar] [money] NULL,
	[MusteriNo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FaturaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_FaturaBilgi]    Script Date: 20.02.2020 19:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_FaturaBilgi](
	[FBId] [int] IDENTITY(1,1) NOT NULL,
	[FBNo] [int] NOT NULL,
	[FaturaNo] [int] NULL,
	[FBUrunAdi] [nvarchar](20) NULL,
	[FBUrunAdet] [int] NULL,
	[FBTutar] [money] NULL,
	[UrunNo] [int] NULL,
 CONSTRAINT [PK_tbl_FaturaBilgi_1] PRIMARY KEY CLUSTERED 
(
	[FBNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Musteri]    Script Date: 20.02.2020 19:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Musteri](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [int] NOT NULL,
	[MusteriAdi] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__tbl_Must__72627C22D6F5F594] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Urun]    Script Date: 20.02.2020 19:44:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Urun](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunNo] [int] NOT NULL,
	[UrunAdi] [nvarchar](20) NULL,
	[UrunFiyat] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[UrunNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tbl_Fatura] ON 

INSERT [dbo].[tbl_Fatura] ([FaturaId], [FaturaNo], [FaturaTutar], [MusteriNo]) VALUES (1, 1, NULL, NULL)
INSERT [dbo].[tbl_Fatura] ([FaturaId], [FaturaNo], [FaturaTutar], [MusteriNo]) VALUES (3, 2, 22.0000, 12)
SET IDENTITY_INSERT [dbo].[tbl_Fatura] OFF
SET IDENTITY_INSERT [dbo].[tbl_FaturaBilgi] ON 

INSERT [dbo].[tbl_FaturaBilgi] ([FBId], [FBNo], [FaturaNo], [FBUrunAdi], [FBUrunAdet], [FBTutar], [UrunNo]) VALUES (1, 2, 1, N'Su', 5, 2.5000, 1)
INSERT [dbo].[tbl_FaturaBilgi] ([FBId], [FBNo], [FaturaNo], [FBUrunAdi], [FBUrunAdet], [FBTutar], [UrunNo]) VALUES (2, 3, 1, N'Su', 4, 2.0000, 1)
SET IDENTITY_INSERT [dbo].[tbl_FaturaBilgi] OFF
SET IDENTITY_INSERT [dbo].[tbl_Musteri] ON 

INSERT [dbo].[tbl_Musteri] ([MusteriId], [MusteriNo], [MusteriAdi]) VALUES (1, 1, N'Yunus')
INSERT [dbo].[tbl_Musteri] ([MusteriId], [MusteriNo], [MusteriAdi]) VALUES (2, 2, N'Ahmet')
INSERT [dbo].[tbl_Musteri] ([MusteriId], [MusteriNo], [MusteriAdi]) VALUES (3, 12, N'Mehmet')
SET IDENTITY_INSERT [dbo].[tbl_Musteri] OFF
SET IDENTITY_INSERT [dbo].[tbl_Urun] ON 

INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (1, 1, N'Su', 0.5000)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (2, 2, N'Ekmek', 1.5000)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (7, 11, N'Şişe', 1.0000)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (5, 22, N'Ekran', NULL)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (8, 44, N'Kayısı', 4.0000)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (4, 123, N'Telefon', NULL)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (6, 322, N'Kablo', 5.0000)
INSERT [dbo].[tbl_Urun] ([UrunId], [UrunNo], [UrunAdi], [UrunFiyat]) VALUES (3, 15468, N'Gazete', 3.0000)
SET IDENTITY_INSERT [dbo].[tbl_Urun] OFF
ALTER TABLE [dbo].[tbl_Fatura]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Fatura_tbl_Musteri1] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[tbl_Musteri] ([MusteriNo])
GO
ALTER TABLE [dbo].[tbl_Fatura] CHECK CONSTRAINT [FK_tbl_Fatura_tbl_Musteri1]
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Fatura] FOREIGN KEY([FaturaNo])
REFERENCES [dbo].[tbl_Fatura] ([FaturaNo])
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi] CHECK CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Fatura]
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi]  WITH CHECK ADD  CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Urun] FOREIGN KEY([UrunNo])
REFERENCES [dbo].[tbl_Urun] ([UrunNo])
GO
ALTER TABLE [dbo].[tbl_FaturaBilgi] CHECK CONSTRAINT [FK_tbl_FaturaBilgi_tbl_Urun]
GO

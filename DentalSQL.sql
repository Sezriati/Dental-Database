CREATE TABLE Hasta (
  HastaID INT PRIMARY KEY,
  Ad VARCHAR(50),
  Soyad VARCHAR(50),
  DogumTarihi DATE,
  Cinsiyet VARCHAR(10),
  Iletisim VARCHAR(100)

)
go

 insert into Hasta (HastaID,Ad,Soyad,DogumTarihi,Cinsiyet,Iletisim) values ('2','bilge','tunca','2020-06-12','kadýn','1234')
 go
CREATE TABLE Randevu (
  RandevuID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  RandevuTarihi DATE,
  RandevuSaati TIME,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
insert into Randevu(RandevuID,HastaID,HekimID,RandevuTarihi,RandevuSaati) values ('101','102','103','2022-05-02','05:00')

Go

CREATE TABLE Hekim (
  HekimID INT PRIMARY KEY,
  Ad VARCHAR(50),
  Soyad VARCHAR(50),
  UzmanlikAlani VARCHAR(100),
  Iletisim VARCHAR(100)

)
insert  Hekim (HekimID,Ad,Soyad,UzmanlikAlani,Iletisim) values ('1001','Mert','Sezer','Orto','3212')
go


go
CREATE TABLE Tedavi (
  TedaviID INT PRIMARY KEY,
  RandevuID INT,
  TedaviAdi VARCHAR(100),
  TedaviTarihi DATE,

  FOREIGN KEY (RandevuID) REFERENCES Randevu(RandevuID)
)
insert into Tedavi(TedaviID,TedaviAdi,TedaviTarihi) values ('10011','Diþ Teli','11.12.2004')

Go
CREATE TABLE Odemeler (
  OdemeID INT PRIMARY KEY,
  HastaID INT,
  TedaviID INT,
  OdemeTutari DECIMAL(10, 2),
  OdemeTarihi DATE,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (TedaviID) REFERENCES Tedavi(TedaviID)
)
go
insert into  Odemeler (OdemeID,HastaID,TedaviID,OdemeTutari,OdemeTarihi) values ('0002','2','098826','1000','05.04.2022')


CREATE TABLE Stok (
  StokID INT PRIMARY KEY,
  UrunAdi VARCHAR(100),
  Miktar INT,
  Fiyat DECIMAL(10, 2),
  TedarikciID INT,

  FOREIGN KEY  (TedarikciID) REFERENCES MalzemeTedarikcileri (TedarikciID),
)
go


CREATE TABLE Kullanicilar (
  KullaniciID INT PRIMARY KEY,
  KullaniciAdi VARCHAR(50),
  Sifre VARCHAR(50),
  Rol VARCHAR(20),

)
go
CREATE TABLE Poliklinikler (
  PoliklinikID INT PRIMARY KEY,
  PoliklinikAdi VARCHAR(100),
  hasta_sayýsý varchar(500) 
)
go
alter table Poliklinikler add hasta_sayýsý varchar (500)

CREATE TABLE Departmanlar (
  DepartmanID INT PRIMARY KEY,
  DepartmanAdi VARCHAR(100),

)
go
CREATE TABLE SigortaSirketleri (
  SigortaSirketID INT PRIMARY KEY,
  SigortaSirketAdi VARCHAR(100),

)
go
CREATE TABLE Raporlar (
  RaporID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  RaporTarihi DATE,
  RaporIcerigi TEXT,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
go
CREATE TABLE LaboratuvarTestleri (
  TestID INT PRIMARY KEY,
  HastaID INT,
  TestAdi VARCHAR(100),
  TestSonucu VARCHAR(100),

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID)
)
go

CREATE TABLE MalzemeTedarikcileri (
  TedarikciID INT PRIMARY KEY,
  TedarikciAdi VARCHAR(100),
  Iletisim VARCHAR(100),

)
go
CREATE TABLE OdemeTurleri (
  OdemeTuruID INT PRIMARY KEY,
  OdemeTuruAdi VARCHAR(100),

)
go
CREATE TABLE TedaviPlanlari (
  PlanID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  PlanTarihi DATE,
  PlanDetayi TEXT,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
go
CREATE TABLE Disler (
  DisID INT PRIMARY KEY,
  DisAdi VARCHAR(50),

)
go
CREATE TABLE Personel (
  PersonelID INT PRIMARY KEY,
  Ad VARCHAR(50),
  Soyad VARCHAR(50),
  DepartmanID INT,
  Iletisim VARCHAR(100),

  FOREIGN KEY (DepartmanID) REFERENCES Departmanlar(DepartmanID)
)
go
CREATE TABLE Fatura (
  FaturaID INT PRIMARY KEY,
  HastaID INT,
  FaturaTarihi DATE,
  FaturaTutari DECIMAL(10, 2),

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID)
)
go
CREATE TABLE Recete (
  ReceteID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  ReceteTarihi DATE,
  ReceteDetayi TEXT,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
go
CREATE TABLE RadyolojiSonuclari (
  SonucID INT PRIMARY KEY,
  HastaID INT,
  SonucTarihi DATE,
  SonucDetayi TEXT,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID)
)
go
CREATE TABLE HastaSikayetleri (
  SikayetID INT PRIMARY KEY,
  HastaID INT,
  SikayetTarihi DATE,
  SikayetDetayi TEXT,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID)
)
go
CREATE TABLE Muayene (
  MuayeneID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  MuayeneTarihi DATE,
  MuayeneSonucu TEXT,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
go
CREATE TABLE PoliklinikZiyareti (
  ZiyaretID INT PRIMARY KEY,
  HastaID INT,
  PoliklinikID INT,
  ZiyaretTarihi DATE,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (PoliklinikID) REFERENCES Poliklinikler(PoliklinikID)
)
go
CREATE TABLE TedaviTakip (
  TakipID INT PRIMARY KEY,
  TedaviID INT,
  HastaID INT,
  HekimID INT,
  TakipTarihi DATE,
  TakipDurumu VARCHAR(50),

  FOREIGN KEY (TedaviID) REFERENCES Tedavi(TedaviID),
  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
go
CREATE TABLE HastaDosyalari (
  DosyaID INT PRIMARY KEY,
  HastaID INT,
  DosyaAdi VARCHAR(100),
  DosyaYolu VARCHAR(200),

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID)
)
go
CREATE TABLE Mesai (
  MesaiID INT PRIMARY KEY,
  PersonelID INT,
  BaslangicSaati TIME,
  BitisSaati TIME,
  Gun VARCHAR(20),

  FOREIGN KEY (PersonelID) REFERENCES Personel(PersonelID)
)
go
CREATE TABLE Randevular (
  RandevuID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  PoliklinikID INT,
  RandevuTarihi DATE,
  RandevuSaati TIME,

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID),
  FOREIGN KEY (PoliklinikID) REFERENCES Poliklinikler(PoliklinikID)
)

go
CREATE TABLE Ameliyatlar (
  AmeliyatID INT PRIMARY KEY,
  HastaID INT,
  HekimID INT,
  AmeliyatTarihi DATE,
  AmeliyatTuru VARCHAR(100),

  FOREIGN KEY (HastaID) REFERENCES Hasta(HastaID),
  FOREIGN KEY (HekimID) REFERENCES Hekim(HekimID)
)
go
CREATE TABLE Anestezi (
  AnesteziID INT PRIMARY KEY,
  AmeliyatID INT,
  AnesteziTuru VARCHAR(100),

  FOREIGN KEY (AmeliyatID) REFERENCES Ameliyatlar(AmeliyatID)
)
go
CREATE TABLE Ekipmanlar (
  EkipmanID INT PRIMARY KEY,
  EkipmanAdi VARCHAR(100),

)
go
CREATE TABLE EkipmanAtamalari (
  AtamaID INT PRIMARY KEY,
  AmeliyatID INT,
  EkipmanID INT,
  AtamaTarihi DATE,

  FOREIGN KEY (AmeliyatID) REFERENCES Ameliyatlar(AmeliyatID),
  FOREIGN KEY (EkipmanID) REFERENCES Ekipmanlar(EkipmanID)
)
go
CREATE TABLE Doktorlar (
  DoktorID INT PRIMARY KEY,
  Ad VARCHAR(50),
  Soyad VARCHAR(50),
  DepartmanID INT,
  Iletisim VARCHAR(100),

  FOREIGN KEY (DepartmanID) REFERENCES Departmanlar(DepartmanID)
)
Go
CREATE TABLE Odalar (
  OdaID INT PRIMARY KEY,
  OdaAdi VARCHAR(100),
  
);
Go
CREATE TABLE Ortodonti (
  OrtodontiID INT PRIMARY KEY,
  Ad VARCHAR(50),
  
);
Go
CREATE TABLE Pedodonti (
  PedodontiID INT PRIMARY KEY,
  Ad VARCHAR(50),
  
);
Go
CREATE TABLE Periodontoloji (
  PeriodontolojiID INT PRIMARY KEY,
  Ad VARCHAR(50),

);
Go
---------------
create trigger trg_hasta
on Hasta
after insert 
as
select * from Hasta

insert  Hasta (HastaID,Ad,Soyad,DogumTarihi,Cinsiyet,Iletisim) values ('1','mert','sezer','2020-04-01','erkek','123')

Go
---------------
create trigger teg_poliklinikler
on Poliklinikler
after insert
as
update Poliklinikler set hasta_sayýsý =hasta_sayýsý +1
select * from Poliklinikler
insert  Poliklinikler (PoliklinikID,PoliklinikAdi,hasta_sayýsý) values ('11','diþ','20')
insert  Poliklinikler (PoliklinikID,PoliklinikAdi,hasta_sayýsý) values ('111','göz','20')

insert Hasta (HastaID,Ad,Soyad,DogumTarihi,Cinsiyet,Iletisim) values ('2','bilge','tunca','2020-06-12','kadýn','1234')
insert Hasta (HastaID,Ad,Soyad,DogumTarihi,Cinsiyet,Iletisim) values ('3','ali','ak','2020-12-30','erkek','12345')

select * from Hasta
Go
------
create trigger tkk_Randevu
on Randevu
after insert 
as
select * from Randevu

insert  Randevu(RandevuID,HastaID,HekimID,RandevuTarihi,RandevuSaati) values ('101','Mert','sez','2022-05-02','05.00')
select * from Randevu
Go
-----
create trigger ptk_Hekim
on Hekim
after insert 
as
select * from Hekim

insert  Hekim (HekimID,Ad,Soyad,UzmanlikAlani,Iletisim) values ('1001','Mert','Sezer','Orto','3212')
select * from Hekim
Go
----
create trigger pts_tedavi
on Tedavi
after insert 
as
select * from Tedavi

insert  Tedavi(TedaviID,RandevuID,TedaviAdi,TedaviTarihi) values ('10011','100012','Diþ Teli','11.12.2004')
select * from Tedavi
Go
------
create trigger pks_odemeler
on Odemeler
after insert 
as
select * from Odemeler

insert  Odemeler (OdemeID,HastaID,TedaviID,OdemeTutari,OdemeTarihi) values ('0002','2','098826','1000','05.04.2022')
select * from Odemeler
Go
-----
create trigger pss_stok
on Stok
after insert 
as
select * from Stok

insert  Tedavi(TedaviID,RandevuID,TedaviAdi,TedaviTarihi) values ('10011','100012','Diþ Teli','11.12.2004')
select * from Tedavi
Go
-----
create trigger psss_kullanicilir
on Kullanicilar
after insert 
as
select * from Kullanicilar

insert  Kullanicilar(KullaniciID,KullaniciAdi,Sifre,Rol) values ('102011','Serhat','10101029','Yazýlýmcý')
select * from Kullanicilar
Go
---------
create trigger psaas_Poli
on Poliklinikler
after insert 
as
select * from Poliklinikler

insert  Poliklinikler(PoliklinikID,PoliklinikID,hasta_sayýsý) values ('1012381311','Es Dental','100')
select * from Poliklinikler
Go
-----
create trigger psggs_sig
on SigortaSirketleri
after insert 
as
select * from SigortaSirketleri

insert  SigortaSirketleri(SigortaSirketID,SigortaSirketAdi) values ('1022222011','Sompo-Japon')
select * from SigortaSirketleri
Go
------
create trigger hhhs_rap
on Raporlar
after insert 
as
select * from Raporlar

insert  Raporlar(RaporID,HastaID,HekimID,RaporTarihi,RaporIcerigi) values ('1981','02','3','02-03-2006','Rapor')
select * from Raporlar
Go
-------
create trigger zzza_Lab
on LaboratuvarTestleri
after insert 
as
select * from LaboratuvarTestleri

insert  LaboratuvarTestleri(TestID,HastaID,TestAdi,TestSonucu) values ('01001','02','HbsAg','Pozitif')
select * from LaboratuvarTestleri
Go
--------
create trigger hhhb_malzeme
on MalzemeTedarikcileri
after insert 
as
select * from MalzemeTedarikcileri

insert  MalzemeTedarikcileri(TedarikciID,TedarikciAdi,Iletisim) values ('01002','Hicret Dental','0902020')
select * from MalzemeTedarikcileri
Go
------
create trigger hhhc_odemet
on OdemeTurleri
after insert 
as
select * from OdemeTurleri

insert  OdemeTurleri(OdemeTuruID,OdemeTuruAdi) values ('01003','Nakit')
select * from OdemeTurleri
Go
-------
create trigger hhhd_tedavip
on TedaviPlanlari
after insert 
as
select * from TedaviPlanlari

insert  TedaviPlanlari(PlanID,HastaID,HekimID,PlanTarihi,PlanDetayi) values ('01004','2','3','02-01-2005','Diþ teli uygulamasi')
select * from TedaviPlanlari
Go
---------
create trigger hhhe_disler
on Disler
after insert 
as
select * from Disler

insert  Disler(DisID,DisAdi) values ('01005','Kanin Diþi')
select * from Disler
Go
--------
create trigger hhhf_personal
on Personel
after insert 
as
select * from Personel

insert  Personel(PersonelID,Ad,Soyad,DepartmanID,Iletisim) values ('01006','Mert','Sezer','05','99872')
select * from Personel
Go
---------
create trigger hhhg_fatura
on Fatura
after insert 
as
select * from Fatura

insert  Fatura(FaturaID,HastaID,FaturaTarihi,FaturaTutari) values ('01007','098','09-09-2009','100000')
select * from Personel
Go
------------
create trigger hhhð_recete
on Recete
after insert 
as
select * from Recete

insert  Recete(ReceteID,HastaID,HekimID,ReceteTarihi,ReceteDetayi) values ('01008','101','102','01-01-1998','Geçerli')
select * from Recete
Go
--------
create trigger hhhý_RadyolojiSonuclari
on RadyolojiSonuclari
after insert 
as
select * from RadyolojiSonuclari

insert  RadyolojiSonuclari(SonucID,HastaID,SonucTarihi,SonucDetayi) values ('01009','103','02-03-1995','Geçerli')
select * from RadyolojiSonuclari
Go
-------
create trigger hhhi_hast
on HastaSikayetleri
after insert 
as
select * from HastaSikayetleri

insert  HastaSikayetleri(SikayetID,HastaID,SikayetTarihi,SikayetDetayi) values ('01010','104','02-04-1995','Sorunlu.')
select * from HastaSikayetleri
Go
-----
create trigger hhhj_muayane
on Muayene
after insert 
as
select * from Muayene

insert  Muayene(MuayeneID,HastaID,HekimID,MuayeneTarihi,MuayeneSonucu) values ('01011','105','106','03-03-1990','Rahatsýz')
select * from HastaSikayetleri
Go
------
create trigger hhhk_pkziyaret
on PoliklinikZiyareti
after insert 
as
select * from PoliklinikZiyareti

insert  PoliklinikZiyareti(ZiyaretID,HastaID,PoliklinikID,ZiyaretTarihi) values ('01012','107','108','03-13-1990','Rahatsýz')
select * from PoliklinikZiyareti
Go
---------
create trigger hhhl_tedtap
on TedaviTakip
after insert 
as
select * from TedaviTakip

insert  TedaviTakip(TakipID,TedaviID,HastaID,HekimID,TakipTarihi,TakipDurumu) values ('01013','109','110','2','13-10-2000','Geçerli Takip')
select * from TedaviTakip
Go
------
create trigger hhhm_pkHastados
on HastaDosyalari
after insert 
as
select * from HastaDosyalari

insert  HastaDosyalari(DosyaID,HastaID,DosyaAdi,DosyaYolu) values ('01014','111','Köpek Diþleri','Root')
select * from HastaDosyalari
Go
--------
create trigger hhhn_pkmesai
on Mesai
after insert 
as
select * from Mesai

insert  Mesai(MesaiID,PersonelID,BaslangicSaati,BitisSaati,Gun) values ('01015','112','108','09:00','17:00','6')
select * from Mesai
Go
------
create trigger hhho_pkrand
on Randevular
after insert 
as
select * from Randevular

insert  Randevular(RandevuID,HastaID,HekimID,PoliklinikID,RandevuTarihi,RandevuSaati) values ('01016','109','110','111','19-04-95','14.00')
select * from Randevular
Go
--------
create trigger hhhö_pkam
on Ameliyatlar
after insert 
as
select * from Ameliyatlar

insert  Ameliyatlar(AmeliyatID,HastaID,HekimID,AmeliyatTarihi,AmeliyatTuru) values ('01017','112','113','19-04-96','Lokal')
select * from Randevular
Go
------
create trigger hhhp_pkanes
on Anestezi
after insert 
as
select * from Anestezi

insert  Anestezi(AnesteziID,AmeliyatID,AnesteziTuru) values ('01018','114','Uyutmalý')
select * from Anestezi
Go
-------
create trigger hhhr_pkekip
on Ekipmanlar
after insert 
as
select * from Ekipmanlar

insert  Ekipmanlar(EkipmanID,EkipmanAdi) values ('01019','Neþter')
select * from Ekipmanlar
Go
--------
create trigger hhhs_pkekat
on EkipmanAtamalari
after insert 
as
select * from EkipmanAtamalari

insert  EkipmanAtamalari(AtamaID,AmeliyatID,EkipmanID,AtamaTarihi) values ('01020','777','666','19-04-95')
select * from EkipmanAtamalari
Go
------
create trigger hhhþ_pkdoks
on Doktorlar
after insert 
as
select * from Doktorlar

insert  Doktorlar(DoktorID,Ad,Soyad,DepartmanID,Iletisim) values ('01021','Mert','Sezer','100874','282828')
select * from Doktorlar
Go
------
create trigger hhht_pkeOda
on Odalar
after insert 
as
select * from Odalar

insert  Odalar(OdaID,OdaAdi) values ('01022','Diþ Tabipleri Birliði')
select * from Odalar
Go
------
create trigger hhhu_pkotrocuu
on Ortodonti
after insert 
as
select * from Ortodonti

insert  Ortodonti(OrtodontiID,Ad) values ('01023','Þeffaf Plak')
select * from Ortodonti
Go
--------
create trigger hhhü_pkepedo
on Pedodonti
after insert 
as
select * from Pedodonti

insert  Pedodonti(PedodontiID,Ad) values ('01024','Rejeneratif Endodonti')
select * from Pedodonti
Go
-------
create trigger hhhv_pkeki12898s
on Periodontoloji
after insert 
as
select * from Periodontoloji

insert  Periodontoloji(PeriodontolojiID,Ad) values ('01025','Yönlendirilmiþ Doku Rejenarasyonu')
select * from Ekipmanlar
Go
--------
create trigger hhhz_pkeki12102s
on Departmanlar
after insert 
as
select * from Departmanlar

insert  Departmanlar(DepartmanID,DepartmanAdi) values ('01026','Ýnsan Kaynaklarý')
select * from Departmanlar
Go

--------------/*view*/

create view nw_poliklinikler
with Encryption
as
select PoliklinikID, PoliklinikAdi, hasta_sayýsý  from Poliklinikler

go

create view vw2_poliklinikler
with Schemabinding 
as
select PoliklinikID, PoliklinikAdi, hasta_sayýsý from dbo.Poliklinikler
go

create view nw_ameliyatlar
with Encryption
as
select  AmeliyatID, HastaID, HekimID, AmeliyatTarihi, AmeliyatTuru  from Ameliyatlar

go

create view vw2_ameliyatlar
with Schemabinding 
as
select AmeliyatID, HastaID, HekimID, AmeliyatTarihi, AmeliyatTuru from dbo.Ameliyatlar
go

create view nw_Anestezi
with Encryption
as
select AnesteziID, AmeliyatID, AnesteziTuru  from Anestezi

go

create view vw2_Anestezi
with Schemabinding 
as
select AnesteziID, AmeliyatID, AnesteziTuru from dbo.Anestezi
go

create view nw_Departmanlar
with Encryption
as
select DepartmanID, DepartmanAdi  from Departmanlar

go

create view vw2_Departmanlar
with Schemabinding 
as
select DepartmanID, DepartmanAdi from dbo.Departmanlar
go

create view nw_Disler
with Encryption
as
select DisID, DisAdi  from Disler

go

create view vw2_Disler
with Schemabinding 
as
select DisID, DisAdi from dbo.Disler
go

create view nw_Doktorlar
with Encryption
as
select DoktorID, Ad, Soyad, DepartmanID, Iletisim  from Doktorlar

go

create view vw2_Doktorlar
with Schemabinding 
as
select DoktorID, Ad, Soyad, DepartmanID, Iletisim from dbo.Doktorlar
go

create view nw_EkipmanAtamalari
with Encryption
as
select AtamaID, AmeliyatID, EkipmanID, AtamaTarihi from EkipmanAtamalari

go

create view vw2_EkipmanAtamalari
with Schemabinding 
as
select AtamaID, AmeliyatID, EkipmanID, AtamaTarihi from dbo.EkipmanAtamalari
go

create view nw_Ekipmanlar
with Encryption
as
select EkipmanID, EkipmanAdi from Ekipmanlar

go

create view vw2_Ekipmanlar
with Schemabinding 
as
select EkipmanID, EkipmanAdi from dbo.Ekipmanlar
go

create view nw_Fatura
with Encryption
as
select FaturaID, HastaID, FaturaTarihi, FaturaTutari from Fatura

go

create view vw2_Fatura
with Schemabinding 
as
select FaturaID, HastaID, FaturaTarihi, FaturaTutari from dbo.Fatura
go

create view nw_Hasta
with Encryption
as
select HastaID, Ad, Soyad, DogumTarihi, Cinsiyet, Iletisim from Hasta

go

create view vw2_Hasta
with Schemabinding 
as
select HastaID, Ad, Soyad, DogumTarihi,Cinsiyet, Iletisim from dbo.Hasta
go


--------------------/*SP*/

create procedure sp_poliklinikler
(
@id int,
@pad varchar(100),
@sayý varchar (500),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Poliklinikler (PoliklinikID,PoliklinikAdi,hasta_sayýsý) values (@id,@pad,@sayý)
end 

if @Stmnt='select'
begin
select * from Poliklinikler
end

if @Stmnt='update'
begin
update Poliklinikler set PoliklinikID=@id, PoliklinikAdi=@pad, hasta_sayýsý=@sayý
where hasta_sayýsý =@sayý
end

else if @Stmnt ='delete'
begin
delete from Poliklinikler where hasta_sayýsý=@sayý

end
end

select * from Poliklinikler

go

--

create procedure sp_Ameliyatlar
(
@id int,
@pad varchar(100),
@sayý varchar (500),
@AT date null,
@ATU  varchar (100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Ameliyatlar (AmeliyatID,HastaID,HekimID,AmeliyatTarihi,AmeliyatTuru) values (@id,@pad,@sayý,@AT,@ATU)
end 

if @Stmnt='select'
begin
select * from Ameliyatlar
end

if @Stmnt='update'
begin
update Ameliyatlar set AmeliyatID=@id, HastaID=@pad, HekimID=@sayý, AmeliyatTarihi=@AT, AmeliyatTuru=@ATU
where HekimID =@sayý
end

else if @Stmnt ='delete'
begin
delete from Ameliyatlar where HekimID=@sayý

end
end

select * from Ameliyatlar

go

----
create procedure sp_Anestezi
(
@id int,
@pad int,
@sayý varchar(100) ,
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Anestezi (AnesteziID,AmeliyatID,AnesteziTuru) values (@id,@pad,@sayý)
end 

if @Stmnt='select'
begin
select * from Anestezi
end

if @Stmnt='update'
begin
update Anestezi set AnesteziID=@id, AmeliyatID=@pad, AnesteziTuru=@sayý
where AnesteziTuru =@sayý
end

else if @Stmnt ='delete'
begin
delete from Anestezi where AnesteziTuru=@sayý

end
end

select * from Anestezi

go

----

create procedure sp_Departmanlar
(
@id int,
@pad varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Departmanlar (DepartmanID,DepartmanAdi) values (@id,@pad)
end 

if @Stmnt='select'
begin
select * from Departmanlar
end

if @Stmnt='update'
begin
update Departmanlar set DepartmanID=@id, DepartmanAdi=@pad
where DepartmanAdi =@pad
end

else if @Stmnt ='delete'
begin
delete from Departmanlar where DepartmanAdi=@pad

end
end

select * from Departmanlar

go

-----
create procedure sp_Disler
(
@id int,
@pad varchar(50),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Disler (DisID,DisAdi) values (@id,@pad)
end 

if @Stmnt='select'
begin
select * from Disler
end

if @Stmnt='update'
begin
update Disler set DisID=@id, DisAdi=@pad
where DisAdi =@pad
end

else if @Stmnt ='delete'
begin
delete from Disler where DisAdi=@pad

end
end

select * from Disler

go

------

create procedure sp_Doktorlar
(
@id int,
@pad varchar(50),
@Soad varchar(50),
@did int,
@IL varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Doktorlar (DoktorID,Ad,Soyad,DepartmanID,Iletisim) values (@id,@pad,@Soad,@did,@IL)
end 

if @Stmnt='select'
begin
select * from Doktorlar
end

if @Stmnt='update'
begin
update Doktorlar set DoktorID=@id, Ad=@pad, Soyad=@Soad, DepartmanID=@did, Iletisim=@IL
where Ad =@pad
end

else if @Stmnt ='delete'
begin
delete from Doktorlar where Ad=@pad

end
end

select * from Disler

go

------

create procedure sp_EkipmanAtamalari
(
@id int,
@pad int,
@Soad int,
@did date,
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into EkipmanAtamalari (AtamaID,AmeliyatID,EkipmanID,AtamaTarihi) values (@id,@pad,@Soad,@did)
end 

if @Stmnt='select'
begin
select * from EkipmanAtamalari
end

if @Stmnt='update'
begin
update EkipmanAtamalari set AtamaID=@id, AmeliyatID=@pad, EkipmanID=@Soad, AtamaTarihi=@did
where AmeliyatID =@pad
end

else if @Stmnt ='delete'
begin
delete from EkipmanAtamalari where AmeliyatID=@pad

end
end

select * from EkipmanAtamalari

go

-----

create procedure sp_Ekipmanlar
(
@id int,
@pad varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Ekipmanlar(EkipmanID,EkipmanAdi) values (@id,@pad)
end 

if @Stmnt='select'
begin
select * from Ekipmanlar
end

if @Stmnt='update'
begin
update Ekipmanlar set EkipmanID=@id, EkipmanAdi=@pad
where EkipmanAdi =@pad
end

else if @Stmnt ='delete'
begin
delete from Ekipmanlar where EkipmanAdi=@pad

end
end

select * from Ekipmanlar

go

------

create procedure sp_Fatura
(
@id int,
@pad varchar(100),
@ft date,
@ftu decimal(10,2),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Fatura(FaturaID,HastaID,FaturaTarihi,FaturaTutari) values (@id,@pad,@ft,@ftu)
end 

if @Stmnt='select'
begin
select * from Fatura
end

if @Stmnt='update'
begin
update Fatura set FaturaID=@id, HastaID=@pad, FaturaTarihi=@ft, FaturaTutari=@ftu
where HastaID =@pad
end

else if @Stmnt ='delete'
begin
delete from Fatura where HastaID=@pad

end
end

select * from Fatura

go

-----

create procedure sp_Hasta
(
@id int,
@pad varchar(50),
@ft varchar(50),
@ftu date,
@cin varchar(10),
@cinil varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Hasta(HastaID,Ad,Soyad,DogumTarihi,Cinsiyet,Iletisim) values (@id,@pad,@ft,@ftu,@cin,@cinil)
end 

if @Stmnt='select'
begin
select * from Hasta
end

if @Stmnt='update'
begin
update Hasta set HastaID=@id, Ad=@pad, Soyad=@ft, DogumTarihi=@ftu, Cinsiyet=@cin, Iletisim= @cinil
where Ad =@pad
end

else if @Stmnt ='delete'
begin
delete from Hasta where Ad=@pad

end
end

select * from Hasta

go

---

create procedure sp_HastaDosyalari
(
@id int,
@pad int,
@ft varchar(100),
@ftu varchar(200),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into HastaDosyalari(DosyaID,HastaID,DosyaAdi,DosyaYolu) values (@id,@pad,@ft,@ftu)
end 

if @Stmnt='select'
begin
select * from HastaDosyalari
end

if @Stmnt='update'
begin
update HastaDosyalari set DosyaID=@id, HastaID=@pad, DosyaAdi=@ft, DosyaYolu=@ftu
end

else if @Stmnt ='delete'
begin
delete from HastaDosyalari where HastaID=@pad

end
end

select * from HastaDosyalari

go

--

create procedure sp_HastaSikayetleri
(
@id int,
@pad int,
@ft date,
@ftu text,
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into HastaSikayetleri(SikayetID,HastaID,SikayetTarihi,SikayetDetayi) values (@id,@pad,@ft,@ftu)
end 

if @Stmnt='select'
begin
select * from HastaSikayetleri
end

if @Stmnt='update'
begin
update HastaSikayetleri set SikayetID=@id, HastaID=@pad, SikayetTarihi=@ft, SikayetDetayi=@ftu
end

else if @Stmnt ='delete'
begin
delete from HastaSikayetleri where HastaID=@pad

end
end

select * from HastaSikayetleri

go

--

create procedure sp_Hekim
(
@id int,
@pad varchar(50),
@ft varchar(50),
@ftu varchar(100),
@uýl varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Hekim(HekimID,Ad,Soyad,UzmanlikAlani,Iletisim) values (@id,@pad,@ft,@ftu,@uýl)
end 

if @Stmnt='select'
begin
select * from Hekim
end

if @Stmnt='update'
begin
update Hekim set HekimID=@id, Ad=@pad, Soyad=@ft, UzmanlikAlani=@ftu, Iletisim=@uýl
end

else if @Stmnt ='delete'
begin
delete from Hekim where Ad=@pad

end
end

select * from Hekim

go

---

create procedure sp_Kullanicilar
(
@id int,
@pad varchar(50),
@ft varchar(50),
@ftu varchar(20),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Kullanicilar(KullaniciID,KullaniciAdi,Sifre,Rol) values (@id,@pad,@ft,@ftu)
end 

if @Stmnt='select'
begin
select * from Kullanicilar
end

if @Stmnt='update'
begin
update Kullanicilar set KullaniciID=@id, KullaniciAdi=@pad, Sifre=@ft, Rol=@ftu
end

else if @Stmnt ='delete'
begin
delete from Kullanicilar where KullaniciAdi=@pad

end
end

select * from Kullanicilar

go

---

create procedure sp_LaboratuvarTestleri
(
@id int,
@pad int,
@ft varchar(100),
@ftu varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into LaboratuvarTestleri(TestID,HastaID,TestAdi,TestSonucu) values (@id,@pad,@ft,@ftu)
end 

if @Stmnt='select'
begin
select * from LaboratuvarTestleri
end

if @Stmnt='update'
begin
update LaboratuvarTestleri set TestID=@id, HastaID=@pad, TestAdi=@ft, TestSonucu=@ftu
end

else if @Stmnt ='delete'
begin
delete from LaboratuvarTestleri where HastaID=@pad

end
end

select * from LaboratuvarTestleri

go

---

create procedure sp_MalzemeTedarikcileri
(
@id int,
@pad varchar(100),
@ft varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into MalzemeTedarikcileri(TedarikciID,TedarikciAdi,Iletisim) values (@id,@pad,@ft)
end 

if @Stmnt='select'
begin
select * from MalzemeTedarikcileri
end

if @Stmnt='update'
begin
update MalzemeTedarikcileri set TedarikciID=@id, TedarikciAdi=@pad, Iletisim=@ft
end

else if @Stmnt ='delete'
begin
delete from MalzemeTedarikcileri where TedarikciAdi=@pad

end
end

select * from MalzemeTedarikcileri

go

---

create procedure sp_Mesai
(
@id int,
@pad int,
@ft time(7),
@ftu time(7),
@gun varchar(20),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Mesai(MesaiID,PersonelID,BaslangicSaati,BitisSaati,Gun) values (@id,@pad,@ft,@ftu,@gun)
end 

if @Stmnt='select'
begin
select * from Mesai
end

if @Stmnt='update'
begin
update Mesai set MesaiID=@id, PersonelID=@pad, BaslangicSaati=@ft, BitisSaati=@ftu, Gun=@gun
end

else if @Stmnt ='delete'
begin
delete from Mesai where PersonelID=@pad

end
end

select * from Mesai

go

--


create procedure sp_Muayene
(
@id int,
@pad int,
@ft int,
@ftu date,
@gun text,
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Muayene(MuayeneID,HastaID,HekimID,MuayeneTarihi,MuayeneSonucu) values (@id,@pad,@ft,@ftu,@gun)
end 

if @Stmnt='select'
begin
select * from Muayene
end

if @Stmnt='update'
begin
update Muayene set MuayeneID=@id, HastaID=@pad, HekimID=@ft, MuayeneTarihi=@ftu, MuayeneSonucu=@gun
end

else if @Stmnt ='delete'
begin
delete from Muayene where HastaID=@pad

end
end

select * from Muayene

go

---

create procedure sp_Odalar
(
@id int,
@pad varchar(100),
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Odalar(OdaID,OdaAdi) values (@id,@pad)
end 

if @Stmnt='select'
begin
select * from Odalar
end

if @Stmnt='update'
begin
update Odalar set OdaID=@id, OdaAdi=@pad
end

else if @Stmnt ='delete'
begin
delete from Odalar where OdaAdi=@pad

end
end

select * from Odalar

go

----

create procedure sp_Odemeler
(
@id int,
@pad int,
@ft int,
@ftu decimal(10,2),
@gun date,
@Stmnt nvarchar (20)= ''
)
as
begin
if @Stmnt='insert'
begin
insert into Odemeler(OdemeID,HastaID,TedaviID,OdemeTutari,OdemeTarihi) values (@id,@pad,@ft,@ftu,@gun)
end 

if @Stmnt='select'
begin
select * from Odemeler
end

if @Stmnt='update'
begin
update Odemeler set OdemeID=@id, HastaID=@pad, TedaviID=@ft, OdemeTutari=@ftu, OdemeTarihi=@gun
end

else if @Stmnt ='delete'
begin
delete from Odemeler where HastaID=@pad

end
end

select * from Odemeler

go



---------------------*/tablevaluefunction*/

create function tvf_poliklinikler
(
@id int,
@pad varchar(100),
@sayý varchar (500)
)
returns table 
as
return
select PoliklinikID, PoliklinikAdi, hasta_sayýsý from Poliklinikler where PoliklinikID=@id

go

--

create function tvf_ameliyatlar
(
@id int,
@pad varchar(100),
@sayý varchar (500),
@AT date null,
@ATU varchar (100)
)
returns table 
as
return
select AmeliyatID, HastaID, HekimID, AmeliyatTarihi, AmeliyatTuru from Ameliyatlar where AmeliyatID=@id

go

--
create function tvf_anestezi
(
@id int,
@pad int,
@sayý varchar (100)
)
returns table 
as
return
select AnesteziID, AmeliyatID, AnesteziTuru from Anestezi where AnesteziID=@id

go

--

create function tvf_departmanlar
(
@id int,
@pad varchar(100)
)
returns table 
as
return
select DepartmanID, DepartmanAdi from Departmanlar where DepartmanID=@id

go

---
create function tvf_Disler
(
@id int,
@pad varchar(50)
)
returns table 
as
return
select DisID, DisAdi from Disler where DisID=@id

go

----
create function tvf_Doktorlar
(
@id int,
@pad varchar(50),
@Soad varchar(59),
@did int,
@IL varchar(100)
)
returns table 
as
return
select DoktorID, Ad, Soyad, DepartmanID, Iletisim from Doktorlar where DoktorID=@id

go

--

create function tvf_EkipmanAtamalari
(
@id int,
@pad int,
@Soad int,
@did date
)
returns table 
as
return
select AtamaID, AmeliyatID, EkipmanID, AtamaTarihi from EkipmanAtamalari where AtamaID=@id

go

---

create function tvf_Ekipmanlar
(
@id int,
@pad varchar(100)
)
returns table 
as
return
select EkipmanID, EkipmanAdi from Ekipmanlar where EkipmanID=@id

go

---

create function tvf_Fatura
(
@id int,
@pad varchar(100),
@ft date,
@ftu decimal(10,2)
)
returns table 
as
return
select FaturaID, HastaID, FaturaTarihi, FaturaTutari from Fatura where FaturaID=@id

go

---

create function tvf_Hasta
(
@id int,
@pad varchar(50),
@ft varchar(50),
@ftu date,
@cin varchar(10),
@cinil varchar(100)
)
returns table 
as
return
select HastaID, Ad, Soyad, DogumTarihi, Cinsiyet, Iletisim from Hasta where HastaID=@id

go

--
create function tvf_HastaDosyalari
(
@id int,
@pad int,
@ft varchar(100),
@ftu varchar(200)
)
returns table 
as
return
select DosyaID, HastaID, DosyaAdi, DosyaYolu from HastaDosyalari where DosyaID=@id

go

---

create function tvf_HastaSikayetleri
(
@id int,
@pad int,
@ft date,
@ftu text
)
returns table 
as
return
select SikayetID, HastaID, SikayetTarihi, SikayetDetayi from HastaSikayetleri where SikayetID=@id

go

---

create function tvf_Hekim
(
@id int,
@pad varchar(50),
@ft varchar(50),
@ftu varchar(100),
@uýl varchar(100)
)
returns table 
as
return
select  HekimID, Ad, Soyad, UzmanlikAlani, Iletisim from Hekim where HekimID=@id

go

---

create function tvf_Kullanicilar
(
@id int,
@pad varchar(50),
@ft varchar(50),
@ftu varchar(20)
)
returns table 
as
return
select  KullaniciID, KullaniciAdi, Sifre, Rol from Kullanicilar where KullaniciID=@id

go

----

create function tvf_LaboratuvarTestleri
(
@id int,
@pad int,
@ft varchar(100),
@ftu varchar(100)
)
returns table 
as
return
select  TestID, HastaID, TestAdi, TestSonucu from LaboratuvarTestleri where TestID=@id

go

----

create function tvf_MalzemeTedarikcileri
(
@id int,
@pad varchar(100),
@ft varchar(100)
)
returns table 
as
return
select  TedarikciID, TedarikciAdi, Iletisim from MalzemeTedarikcileri where TedarikciID=@id

go

---

create function tvf_Mesai
(
@id int,
@pad varchar(100),
@ft time(7),
@ftu time(7),
@gun varchar(20)
)
returns table 
as
return
select  MesaiID, PersonelID, BaslangicSaati,BitisSaati,Gun from Mesai where MesaiID=@id

go

----
create function tvf_Muayene
(
@id int,
@pad int,
@ft int,
@ftu date,
@gun text
)
returns table 
as
return
select  MuayeneID, HastaID, HekimID,MuayeneTarihi,MuayeneSonucu from Muayene where MuayeneID=@id

go

----

create function tvf_Odalar
(
@id int,
@pad varchar(100)
)
returns table 
as
return
select  OdaID, OdaAdi from Odalar where OdaID=@id

go

-----
create function tvf_Odemeler
(
@id int,
@pad int,
@ft int,
@ftu decimal(10,2),
@gun date
)
returns table 
as
return
select  OdemeID, HastaID, TedaviID,OdemeTutari,OdemeTarihi from Odemeler where OdemeID=@id

go
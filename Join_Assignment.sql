CREATE TABLE personel (
      personel_id   INTEGER PRIMARY KEY,
      personel_isim TEXT,
      meslek        TEXT,
      mudur_id      INTEGER,
      ise_baslama   DATE,
      maas          REAL,
      bolum_id      INTEGER, 
      FOREIGN KEY (bolum_id) REFERENCES bolumler(bolum_id) 
	);

	CREATE TABLE bolumler (
      bolum_id   INTEGER PRIMARY KEY,
      bolum_isim TEXT,
      konum      TEXT
   );

    INSERT INTO bolumler VALUES (10,'MUHASABE','IST');
    INSERT INTO bolumler  VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler  VALUES (50,'DEPO', 'YOZGAT');

    INSERT INTO personel VALUES (7369,'AHMET','KATIP',7902,'17-12-1980',800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATIS',7698,'20-2-1981',1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATIS',7698,'22-2-1981',1250,30);
    INSERT INTO personel VALUES (7566,'MUZAFFER','MUDUR',7839,'2-4-1981',2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATIS',7698,'28-9-1981',1250,30);
    INSERT INTO personel VALUES (7698,'EMINE','MUDUR',7839,'1-5-1981',2850,30);
    INSERT INTO personel VALUES (7782,'HARUN','MUDUR',7839,'9-6-1981', 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',7566,'13-07-87',3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,'17-11-1981',5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATIS',7698,'8-9-1981',1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',7788,'13-07-87',1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',7698,'3-12-1981',950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',7566,'3-12-1981',3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',7782,'23-1-1982',1300,10);

	
	 /* -----------------------------------------------------------------------------
  ORNEK1: SATIS veya MUHASABE bolumlerinde calisan personelin isimlerini 
  ve bolumlerini, once bolum sonra isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 
SELECT p.personel_isim, b.bolum_isim
FROM personel p JOIN bolumler b 
on p.bolum_id = b.bolum_id
WHERE b.bolum_isim in ('SATIS', 'MUHASABE')
ORDER BY b.bolum_isim ASC, p.personel_isim ASC ;

/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin 
  isimlerini, bolumlerini ve ise_baslama tarihlerini isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
SELECT b.bolum_isim, p.personel_isim,  p.ise_baslama
FROM bolumler b LEFT JOIN personel p
ON b.bolum_id = p.bolum_id
where b.bolum_isim in ('SATIS', 'ISLETME', 'DEPO')
ORDER BY b.bolum_isim ASC;

/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini 
  ve maaslarini bolum ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
SELECT p.personel_isim, b.bolum_isim, p.maas
from bolumler b LEFT JOIN personel p
ON b.bolum_id = p.bolum_id
ORDER BY b.bolum_id,p.maas DESC;

/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari
  2000'den buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve 
  isme gore siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   
SELECT b.bolum_isim, p.personel_isim,  p.maas
FROM personel p LEFT JOIN bolumler b 
ON p.bolum_id = b.bolum_id
where p.maas > 2000 and b.bolum_isim in ('MUDURLUK','SATIS')
ORDER BY b.bolum_isim, p.personel_isim ;


/* -----------------------------------------------------------------------------
  ORNEK5: MUDUR'u Mesut veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve mudur isimlerini maas sıralı olarak (çoktan aza) listeleyiniz.
------------------------------------------------------------------------------*/   
SELECT b.bolum_isim, p.personel_isim, p.maas, (SELECT personel_isim FROM personel
											   WHERE personel_id = p.mudur_id) as mudur_adi
FROM bolumler b
LEFT JOIN personel p
on b.bolum_id = p.bolum_id
WHERE p.mudur_id in (7698, 7788)
ORDER BY p.maas DESC;








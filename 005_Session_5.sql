<?xml version="1.0" encoding="UTF-8"?><sqlb_project><db path="C:/Users/ASUS/Desktop/CLARUSWAY/SQL/Databases/chinook.db" readonly="0" foreign_keys="1" case_sensitive_like="0" temp_store="0" wal_autocheckpoint="1000" synchronous="2"/><attached/><window><main_tabs open="structure browser pragmas query" current="3"/></window><tab_structure><column_width id="0" width="300"/><column_width id="1" width="0"/><column_width id="2" width="100"/><column_width id="3" width="3862"/><column_width id="4" width="0"/><expanded_item id="0" parent="1"/><expanded_item id="1" parent="1"/><expanded_item id="2" parent="1"/><expanded_item id="3" parent="1"/></tab_structure><tab_browse><current_table name="4,6:mainpeople"/><default_encoding codec=""/><browse_table_settings><table schema="main" name="albums" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="61"/><column index="2" value="300"/><column index="3" value="59"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="employees" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="82"/><column index="2" value="71"/><column index="3" value="71"/><column index="4" value="124"/><column index="5" value="75"/><column index="6" value="129"/><column index="7" value="129"/><column index="8" value="178"/><column index="9" value="67"/><column index="10" value="44"/><column index="11" value="60"/><column index="12" value="80"/><column index="13" value="115"/><column index="14" value="115"/><column index="15" value="168"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="people" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="40"/><column index="2" value="84"/><column index="3" value="75"/><column index="4" value="48"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="personel" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="78"/><column index="2" value="75"/><column index="3" value="112"/><column index="4" value="102"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="61"/><column index="2" value="59"/><column index="3" value="84"/><column index="4" value="89"/><column index="5" value="113"/><column index="6" value="54"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation_plan" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="61"/><column index="2" value="59"/><column index="3" value="121"/><column index="4" value="89"/><column index="5" value="113"/><column index="6" value="54"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="vacation_plan2" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="61"/><column index="2" value="59"/><column index="3" value="143"/><column index="4" value="89"/><column index="5" value="113"/><column index="6" value="54"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table><table schema="main" name="workers" show_row_id="0" encoding="" plot_x_axis="" unlock_view_pk="_rowid_"><sort/><column_widths><column index="1" value="73"/><column index="2" value="185"/><column index="3" value="149"/><column index="4" value="48"/></column_widths><filter_values/><conditional_formats/><row_id_formats/><display_formats/><hidden_columns/><plot_y_axes/><global_filter/></table></browse_table_settings></tab_browse><tab_sql><sql name="session-5">/*===================================================
 DDL COMMANDS (CREATE TABLE, DROP TABLE,ALTER TABLE)
====================================================*/	
	
/*------------------------------------------------------------------------------------------
/*  CREATE TABLE
/*------------------------------------------------------------------------------------------
	
/*personel adinda bir tablo olu??turunuz.  Tabloda first_name, last_name 
age(INT) ve hire_date (Date) sutunular?? bulunmal??d??r.	*/

CREATE TABLE personel (
first_name TEXT,
last_name TEXT,
age INT,
hire_date date); 

/* Ayn?? isimle yeniden bir veritaban?? olu??turulmak istenirse hata verir. Bu hatay??
almamak i??in IF NOT EXISTS keywordu kullan??labilir */

CREATE TABLE IF NOT EXISTS personel (
first_name TEXT,
last_name TEXT,
age INT,
hire_date date); 

/*Veritaban??nda vacation_plan ad??nda yeni bir tablo olu??turunuz.  Sutun isimleri
place_id, country, hotel_name, employee_id, vacation_length,budget 	*/

CREATE TABLE vacation_plan (
place_id INT,
country NVARCHAR(50),
hotel_name NVARCHAR(100),
employee_id INTEGER,
vacation_length INT,
budget REAL
);

/*---------------------------------------------------------------------*/
/*  DROP TABLE
/*---------------------------------------------------------------------*/
/* personel tablosunu siliniz */

DROP TABLE personel;

/* Bir tabloyu silerken tablo bulunamazsa hata verir.
 Bu hatay?? g??rmemek i??in IF EXISTS keywordu kullan??labilir.*/
 DROP TABLE IF EXISTS personel;
 
 -- NOT: SQL'de TRUNCATE TABLE komutu bulunmas??na kar????n SQLite bu komutu 
-- desteklememektedir. Truncate komutu  bir tabloyu de??il i??indeki t??m verileri 
-- silmek i??in kullan??l??r.

INSERT INTO vacation_plan VALUES(34,&quot;Turkey&quot;, &quot;Hotel Istanbul&quot;, 1, 7, 4000);
INSERT INTO vacation_plan VALUES(42,&quot;Turkey&quot;, &quot;hotel Mevlana&quot;, 2, 4, 2000);


/*vacation_plan tablosuna vacation_lenght ve budget sutunlar??n?? eksik olarak veri giri??i 
yap??n??z*/

INSERT INTO vacation_plan (place_id, country, hotel_name, employee_id)
						   VALUES(06, &quot;Turkey&quot;, &quot;Hotel Ba??kent&quot;,3); 
-- NOT : giri?? yap??lmayan sutunlara NULL atan??r.


/*------------------------------------------------------------------------------------------
/*  CONSTRAINTS - KISITLAMALAR 
/*-----------------------------------------------------------------------------------------

NOT NULL - Bir S??tunun NULL i??ermemesini garanti eder. 

UNIQUE - Bir s??tundaki t??m de??erlerin BENZERS??Z olmas??n?? garanti eder.  

PRIMARY KEY - Bir s??t??n??n NULL i??ermemesini ve s??tundaki verilerin 
 BENZERS??Z olmas??n?? garanti eder.(NOT NULL ve UNIQUE birle??imi gibi)

FOREIGN KEY - Ba??ka bir tablodaki Primary Key'i referans g??stermek i??in kullan??l??r. 
 B??ylelikle, tablolar aras??nda ili??ki kurulmu?? olur. 

 DEFAULT - Herhangi bir de??er atanmad??????nda Ba??lang???? de??erinin atanmas??n?? sa??lar. */
 
 
 
 CREATE TABLE workers(
   id INT PRIMARY KEY,
   id_number TEXT NOT NULL UNIQUE,
   name TEXT DEFAULT 'NONAME',
   salary INTEGER NOT NULL
  );
  
 INSERT INTO workers VALUES(1,&quot;12345678910&quot;,&quot;Ahmet Y??lmaz&quot;, 10000);

-- UN??QUE CONST VIOLATION
--INSERT INTO workers VALUES(1,&quot;54324378910&quot;,&quot;Mehmet Yaman&quot;, 20000);

INSERT INTO workers(id, id_number,salary) VALUES(3,&quot;98513898910&quot;, 30000);

/*vacation_plan tablosunu place_id sutunu PK ve employee_id sutununu 
ise FK olarak  de??i??tirirek vacation_plan2 adinda yeni bir tablo olu??turunuz.
Bu tablo, employees tablosu ile ili??kili olmal??d??r */

CREATE TABLE vacation_plan2 (
place_id INT,
country NVARCHAR(50),
hotel_name NVARCHAR(100),
employee_id INTEGER,
vacation_length INT,
budget REAL,
PRIMARY KEY (place_id),
FOREIGN KEY (employee_id)
REFERENCES employees(EmployeeId)
);

/* Employees tablosundaki EmployeeId'si 1 olan ki??i i??in bir tatil plan?? giriniz.*/

INSERT INTO vacation_plan2 VALUES(34,&quot;Turkey&quot;, &quot;Happy Nation&quot;, 1,5,5000);

/* Employees tablosunda bulunmayan bir ki??i i??in (EmployeeId=9) olan ki??i i??in bir tatil plan?? giriniz.*/
INSERT INTO vacation_plan2 VALUES(35,&quot;Turkey&quot;, &quot;Hotel Delray&quot;, 9,4,3000);

--Execution finished with errors.
--Result: FOREIGN KEY constraint failed


/*JOIN i??lemi ile 2 tablodan veri ??ekme*/
/* INNER JOIN*/
SELECT FirstName, LastName, vacation_length, hotel_name
FROM employees e JOIN vacation_plan2 v
ON e.EmployeeId = v.employee_id;

/* LEFT JOIN*/
SELECT FirstName, LastName, vacation_length, hotel_name
FROM employees e JOIN vacation_plan2 v
ON e.EmployeeId = v.employee_id;

/*------------------------------------------------------------------------------------------
/*  ALTER TABLE (ADD, RENAME TO, DROP)
/*  SQLITE MODIFY VE DELETE KOMUTLARINI DO??RUDAN DESTEKLENMEZ
/*------------------------------------------------------------------------------------------
	
/*vacation_plan2 tablosuna name ad??nda ve DEFAULT de??eri noname olan 
yeni bir sutun ekleyelim */

ALTER TABLE vacation_plan2
 ADD name TEXT DEFAULT 'NONAME';
 
 /*vacation_plan2 tablosundaki name s??tununu siliniz*/
 ALTER TABLE vacation_plan2
 DROP COLUMN name;
 
 /* workers tablosunun ad??n?? people olarak de??i??tiriniz */
 
 ALTER TABLE workers
 RENAME TO people;
 
 /*------------------------------------------------------------------------------------------
/*  UPDATE,DELETE
-- SYNTAX
----------
-- UPDATE tablo_ad??
-- SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,...  
-- WHERE ko??ul;
		
--DELETE tablo_ad??
--WHERE ko??ul;
/*-----------------------------------------------------------------------------------------*/
   
/*vacation_plan2 tablosundaki employee_id=1 olan kaydini  hotel_name'ini
 Komagene Hotel olarak g??ncelleyiniz.*/
 
 UPDATE vacation_plan2
 SET hotel_name = &quot;Komagene Hotel&quot;
 WHERE employee_id = 1;

 
/* people tablosunda salary sutunu 12000 'den az olanlar??n salary(maa????na)
%10 zam yapacak sorguyu yaz??n??z*/ 

UPDATE people
SET salary = salary*1.1
WHERE salary &lt; 12000

/* people tablosunda salary sutunu b??t??n ki??iler i??in 
15000 yapacak sorguyu yaz??n??z*/ 
UPDATE people
SET salary = 15000;

</sql><sql name="SQL 2">INSERT INTO workers VALUES(1,&quot;12345678910&quot;,&quot;CAN CANAN&quot;, 10000);

ALTER TABLE vacation_plan2
 ADD name TEXT DEFAULT 'NONAME';
 
  ALTER TABLE vacation_plan2
 DROP COLUMN name;

 ALTER TABLE workers
 RENAME to people;
 
  UPDATE vacation_plan2
 SET hotel_name = &quot;Komagene Hotel&quot;
 WHERE employee_id = 1;
 
 UPDATE people
SET salary = salary*1.1
WHERE salary &lt; 12000

UPDATE people
SET salary = 15000;

DELETE FROM people
WHERE 
</sql><current_tab id="0"/></tab_sql></sqlb_project>

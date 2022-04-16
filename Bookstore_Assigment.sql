CREATE TABLE book_types (
                type_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                book_type TEXT (50) NOT NULL
                );
CREATE TABLE authors (
                author_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                author_name TEXT (50) NOT NULL
                );
CREATE TABLE publishers (
                publisher_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                publisher_name TEXT (50) NOT NULL,
                country TEXT (25)
                );
CREATE TABLE books (
                book_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
                book_name TEXT (50) NOT NULL,
                
                book_type INTEGER NOT NULL,
                author_id INTEGER NOT NULL,
                publisher_id INTEGER NOT NULL,
                price REAL (5,2),
            
                FOREIGN KEY (book_type) REFERENCES book_types (type_id) 
                    ON DELETE CASCADE ON UPDATE NO ACTION,
                FOREIGN KEY (author_id) REFERENCES authors (author_id) 
                    ON DELETE CASCADE ON UPDATE NO ACTION,
                FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id) 
                    ON DELETE CASCADE ON UPDATE NO ACTION
                );
                            
INSERT INTO book_types (book_type) VALUES ('Anı');
INSERT INTO book_types (book_type) VALUES ('Deneme');
INSERT INTO book_types (book_type) VALUES ('Hikaye');
INSERT INTO book_types (book_type) VALUES ('Şiir');
INSERT INTO authors (author_name) VALUES ('Ömer Seyfettin');
INSERT INTO authors (author_name) VALUES ('Halide Edip Adıvar');
INSERT INTO authors (author_name) VALUES ('Ahmet Rasim');
INSERT INTO authors (author_name) VALUES ('Necip Fazıl Kısakürek');
INSERT INTO authors (author_name) VALUES ('Rıfat Ilgaz');
INSERT INTO authors (author_name) VALUES ('George Orwell');
INSERT INTO authors (author_name) VALUES ('David Atkinson');
INSERT INTO authors (author_name) VALUES ('Osman Şahin');
INSERT INTO publishers (publisher_name, country) VALUES ('Can Yayınları', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Özgür Yayınları', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Bilge Kültür Sanat', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Dergah Yayınları', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Büyük Doğu Yayınları', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Hacegan Yayınları', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Çınar Yayınları', 'TR');
INSERT INTO publishers (publisher_name, country) VALUES ('Amazon', 'US');
INSERT INTO publishers (publisher_name, country) VALUES ('Joffe Books', 'UK');
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Mor Salkımlı Ev', 1, 2, 1, 41.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Vurun Kahpeye', 1, 2, 1, 32.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Vurun Kahpeye', 1, 2, 2, 13.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Şehir Mektupları', 2, 3, 4, 65.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Çile', 4, 4, 5, 100.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Çöle İnen Nur', 3, 4, 5, 120.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Dördüncü Bölük', 3, 5, 7, 21.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Sonuncu İz', 3, 8, 1, 29.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Animal Farm', 3, 6, 8, 55.00);
INSERT INTO books (book_name, book_type, author_id, publisher_id, price) VALUES ('Love Byte', 3, 7, 9, 35.00);


/*1) Tüm kitap isimlerini yazar isimleri ile birlikte getiren bir sorgu yazınız?*/
SELECT DISTINCT b.book_name, a.author_name
FROM books b 
LEFT JOIN authors a 
ON b.author_id = a.author_id;

/*2) Tüm kitap isimlerini yayınevleri ile birlikte getiren bir sorgu yazınız?*/
SELECT b.book_name, p.publisher_name
FROM books b 
LEFT JOIN publishers p
ON b.publisher_id = p.publisher_id;

/*3)Tüm yayınevleri tarafından basılan kitapların isimlerini yayınevleri ile birlikte getiren bir sorgu yazınız? */
SELECT p.publisher_name, b.book_name
FROM publishers p
LEFT JOIN books b
		  ON b.publisher_id = p.publisher_id;


/*4) 'Anı' türündeki tüm kitapların isimlerini getiren bir sorgu yazınız? */

SELECT DISTINCT b.book_name, bt.book_type
FROM books b
LEFT JOIN book_types bt
		  ON b.book_type = bt.type_id
WHERE bt.book_type = 'Anı'

/*5)'Büyük Doğu Yayınları' na ait tüm kitapların isimlerini getiren bir sorgu  yazınız? */
SELECT b.book_name
FROM books b
LEFT JOIN publishers p
		 ON b.publisher_id = p.publisher_id
WHERE p.publisher_name = 'Büyük Doğu Yayınları';

/* 6) 'Hikaye' türünde kitap yazan yazarların isimlerini getiren bir sorgu yazınız? */
SELECT a.author_name
FROM books b 
JOIN authors a 
	 ON b.author_id = a.author_id

JOIN book_types bt
	 ON b.book_type = bt.type_id
WHERE bt.book_type = 'Hikaye';

/* 7) 'Necip Fazıl Kısakürek'e ait kitapların türlerini getiren bir sorgu yazını? */

SELECT b.book_name, a.author_name, bt.book_type
FROM books b
LEFT JOIN authors a 
		  ON b.author_id = a.author_id
LEFT JOIN book_types bt
		  ON b.book_type = bt.type_id
WHERE a.author_id = 4;


/* 8) 'Hikaye' VEYA 'Şiir' türünde kitap yazan yazarların isimlerini ve 
kitap isimlerini türleri ile birlilte getiren bir soru yazınız?*/

SELECT a.author_name, bt.book_type, b.book_name
FROM books b
LEFT JOIN book_types bt
		  ON b.book_type = bt.type_id
LEFT JOIN authors a
		  ON b.author_id = a.author_id
WHERE bt.book_type = 'Hikaye' or bt.book_type = 'Şiir'

/*9) En pahalı kitabın türünü, ismini ve fiyatını getiren bir sorgu yazınız?*/
SELECT b.book_name, bt.book_type, b.price
FROM books b
JOIN book_types bt
	 ON b.book_type = bt.type_id
ORDER BY price DESC
LIMIT 1 

/*10) 'TR' dışında diğer ülkelerde basılan kitapların isimlerini, yazarlarını, 
yayınevlerini ve fiyatlarını getiren bir sorgu yazınız?*/

SELECT b.book_name, a.author_name, p.publisher_name, b.price, p.country 
FROM books b
LEFT JOIN authors a
		  ON b.author_id = a.author_id

LEFT JOIN publishers p
		  ON b.publisher_id = p.publisher_id 
WHERE p.country not in ('TR')


/*11) 'Hikaye' türünde yazılmış olan en ucuz kitabın ismini, yayınevini   ve fiyatını getiren bir sorgu yazınız?*/

SELECT b.book_name, p.publisher_name, b.price
FROM books b
LEFT JOIN publishers p 
		  ON b.publisher_id = p.publisher_id

LEFT JOIN book_types bt 
		  ON b.book_type = type_id

WHERE bt.type_id = 3
ORDER BY price ASC
LIMIT 1

/*12) 'Can Yayınları' tarafından basılan en ucuz kitabın ismini ve yazarının adını getiren bir sorgu yazınız?*/

SELECT b.book_name, a.author_name, b.price
FROM books b
LEFT JOIN publishers p
		 ON b.publisher_id = p.publisher_id

LEFT JOIN authors a
		  ON b.author_id = a.author_id
WHERE p.publisher_name like 'Can%'
ORDER BY price ASC
LIMIT 1





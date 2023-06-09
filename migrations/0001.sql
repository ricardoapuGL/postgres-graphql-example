CREATE SCHEMA bookcase;

COMMENT ON SCHEMA bookcase IS '@graphql({"inflect_names": true})';

CREATE TABLE bookcase."Author" (
	author_id smallserial NOT NULL PRIMARY KEY,
	name varchar(127) NOT NULL,
	birthdate date NOT NULL,
	picture varchar(255) NULL
);

COMMENT ON TABLE bookcase."Author" IS '@graphql({"totalCount": {"enabled": true}})';

INSERT INTO
	bookcase."Author" (author_id, name, birthdate, picture)
VALUES
	(
		1,
		'N.K. Jemisin',
		'1972/09/19',
		'https://upload.wikimedia.org/wikipedia/commons/9/95/N._K._Jemisin_%28cropped%29.jpg'
	),
	(
		2,
		'Brandon Sanderson',
		'1975/12/19',
		'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Brandon_Sanderson_-_Lucca_Comics_%26_Games_2016.jpg/440px-Brandon_Sanderson_-_Lucca_Comics_%26_Games_2016.jpg'
	);

CREATE TABLE bookcase."Book" (
	book_id smallserial NOT NULL,
	author_id smallserial NOT NULL REFERENCES bookcase."Author" (author_id),
	title varchar(255) NOT NULL,
	cover varchar(255) NULL,
	publication_date date NOT NULL,
	PRIMARY KEY (book_id)
);

INSERT INTO
	bookcase."Book" (author_id, title, cover, publication_date)
VALUES
	(
		1,
		'The Fifth Season',
		'',
		'2015/08/04'
	),
	(
		2,
		'Mistborn: The Final Empire',
		'',
		'2006/07/17'
	),
	(
		2,
		'The Way of Kings',
		'',
		'2010/08/31'
	);

CREATE TABLE bookcase."BookReview" (
	book_id smallserial NOT NULL REFERENCES bookcase."Book" (book_id),
	review_id smallserial NOT NULL,
	text_review varchar(255) NOT NULL,
	star_review decimal(3, 2) NOT NULL DEFAULT 0 CHECK (star_review >= 0) CHECK(star_review < 5.0),
	PRIMARY KEY (book_id, review_id)
);
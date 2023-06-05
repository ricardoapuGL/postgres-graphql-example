CREATE SCHEMA bookcase;

COMMENT ON SCHEMA bookcase IS '@graphql({"inflect_names": true})';

CREATE TABLE bookcase."Author" (
	name varchar(127) NOT NULL PRIMARY KEY,
	birthdate date NOT NULL,
	picture varchar(255) NULL
);

COMMENT ON TABLE bookcase."Author" IS '@graphql({"totalCount": {"enabled": true}})';

INSERT INTO
	bookcase."Author" (name, birthdate, picture)
VALUES
	(
		'N.K. Jemisin',
		'1972/09/19',
		'https://upload.wikimedia.org/wikipedia/commons/9/95/N._K._Jemisin_%28cropped%29.jpg'
	),
	(
		'Brandon Sanderson',
		'1975/12/19',
		'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Brandon_Sanderson_-_Lucca_Comics_%26_Games_2016.jpg/440px-Brandon_Sanderson_-_Lucca_Comics_%26_Games_2016.jpg'
	);

CREATE TABLE bookcase."Book" (
	author varchar(127) NOT NULL REFERENCES bookcase."Author" (name),
	title varchar(255) NOT NULL,
	cover varchar(255) NULL,
	publication_date date NOT NULL,
	PRIMARY KEY (author, title)
);

INSERT INTO
	bookcase."Book" (author, title, cover, publication_date)
VALUES
	(
		'N.K. Jemisin',
		'The Fifth Season',
		'',
		'2015/08/04'
	),
	(
		'Brandon Sanderson',
		'Mistborn: The Final Empire',
		'',
		'2006/07/17'
	);
CREATE TABLE Musician(
ID varchar2(4),
Name varchar2(40),
BirthPlace varchar2(25),
CONSTRAINT musc_pk PRIMARY KEY(ID)
);

DESC Musician

CREATE TABLE Studio(
Studio_Name varchar2(20),
Address varchar2(50),
Phone Number(10),
CONSTRAINT studio_pk PRIMARY KEY(Studio_Name)
);

DESC Studio

CREATE TABLE Album(
Name varchar2(25),
Album_ID varchar2(4),
Year Number(4),
No_Tracks Number(3),
Studio_Name varchar2(20),
Genre varchar2(10),
ID varchar2(4),
CONSTRAINT album_pk PRIMARY KEY(Album_ID),
CONSTRAINT album_fk FOREIGN KEY(Studio_Name) REFERENCES Studio(Studio_Name),
CONSTRAINT album_fk_mus FOREIGN KEY(ID) REFERENCES Musician(ID)
);

DESC Album

CREATE TABLE Song(
Album_ID varchar2(4),
Track_No Number(3),
Name varchar2(30),
Length varchar2(10),
Genre varchar2(10),
CONSTRAINT song_pk PRIMARY KEY(Album_ID,Track_No),
CONSTRAINT song_fk FOREIGN KEY(Album_ID) REFERENCES Album(Album_ID)
);

DESC Song

CREATE TABLE Artist(
Artist_ID varchar2(4),
Name varchar2(25),
CONSTRAINT artist_pk PRIMARY KEY(Artist_ID)
);

DESC ARTIST

CREATE TABLE SungBy(
Album_ID varchar2(4),
Track_No Number(3),
Artist_ID varchar2(4),
S_Date Date,
CONSTRAINT sungby_pk PRIMARY KEY(Album_ID,Track_No,Artist_ID),
 CONSTRAINT sungby_fk FOREIGN KEY(Album_ID,Track_No) REFERENCES Song(Album_ID,Track_No),
 CONSTRAINT sungby_fk2 FOREIGN KEY(Artist_ID) REFERENCES Artist(Artist_ID)
);

DESC SungBy

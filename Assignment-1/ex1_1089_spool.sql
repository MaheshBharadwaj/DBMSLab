SQL> @ /home/mahesh/Documents/DBMSLab/Assignment-1/ex1_1089.sql
SQL> SET ECHO ON;
SQL> SET PAUSE ON;
SQL> SET LINESIZE 150;
SQL>
SQL> REM: Dropping Existing Tables
SQL>
SQL> 	     drop table sungby;

Table dropped.

SQL> 	     drop table artist;

Table dropped.

SQL> 	     drop table song;

Table dropped.

SQL> 	     drop table album;

Table dropped.

SQL> 	     drop table musician;

Table dropped.

SQL> 	     drop table studio;

Table dropped.

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Creating Musician Table
SQL> 
SQL> 	     CREATE TABLE Musician(
  2  	     M_ID varchar2(4),
  3  	     Name varchar2(40) CONSTRAINT musc_name_not_null NOT NULL,
  4  	     BirthPlace varchar2(25),
  5  	     CONSTRAINT musc_pk PRIMARY KEY(M_ID)
  6  	     );

Table created.

SQL> 
SQL> 	     DESC Musician
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 M_ID                                                                                NOT NULL VARCHAR2(4)
 NAME                                                                                NOT NULL VARCHAR2(40)
 BIRTHPLACE                                                                                   VARCHAR2(25)

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Inserting into Musician Table:
SQL> 
SQL> 	     INSERT INTO Musician VALUES('M01','Niel','Chennai');

1 row created.

SQL> 
SQL> REM: Error due to NULL name:
SQL> 	     INSERT INTO Musician Values('MO2','','Dehradun');
	INSERT INTO Musician Values('MO2','','Dehradun')
	                                  *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("1089"."MUSICIAN"."NAME") 


SQL> 
SQL> REM: Error due to same primary key:
SQL> 	     INSERT INTO Musician VALUES('M01','Test','Bangalore');
	INSERT INTO Musician VALUES('M01','Test','Bangalore')
*
ERROR at line 1:
ORA-00001: unique constraint (1089.MUSC_PK) violated 


SQL> 
SQL> REM: Inserting valid records:
SQL> 	     INSERT INTO Musician VALUES('M02','Tom','Banglaore');

1 row created.

SQL> 	     INSERT INTO Musician VALUES('M03','Anotny','Delhi');

1 row created.

SQL> 	     INSERT INTO Musician VALUES('M04','Kumar','Madurai');

1 row created.

SQL> 	     INSERT INTO Musician VALUES('M05','Raj','Hyderabad');

1 row created.

SQL> 
SQL> REM: Contents of Musician Table
SQL> 
SQL> 	     SELECT * FROM Musician;

M_ID NAME                                     BIRTHPLACE                                                                                              
---- ---------------------------------------- -------------------------                                                                               
M01  Niel                                     Chennai                                                                                                 
M02  Tom                                      Banglaore                                                                                               
M03  Anotny                                   Delhi                                                                                                   
M04  Kumar                                    Madurai                                                                                                 
M05  Raj                                      Hyderabad                                                                                               

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Creating Studio Table
SQL> 
SQL> 	     CREATE TABLE Studio(
  2  	     Studio_Name varchar2(20),
  3  	     Address varchar2(50),
  4  	     Phone Number(10),
  5  	     CONSTRAINT studio_pk PRIMARY KEY(Studio_Name)
  6  	     );

Table created.

SQL> 
SQL> 	     DESC Studio
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 STUDIO_NAME                                                                         NOT NULL VARCHAR2(20)
 ADDRESS                                                                                      VARCHAR2(50)
 PHONE                                                                                        NUMBER(10)

SQL> 
SQL> REM: Inserting into Studio Table;
SQL> 	     INSERT INTO Studio VALUES('U2 Studios','#1, 7th Main Road,Chennai',9988776655);

1 row created.

SQL> 
SQL> 
SQL> REM: Error due to same PRIMARY KEY
SQL> 	     INSERT INTO Studio VALUES('U2 Studios','#2 Anna Nagar',9940043090);
	INSERT INTO Studio VALUES('U2 Studios','#2 Anna Nagar',9940043090)
*
ERROR at line 1:
ORA-00001: unique constraint (1089.STUDIO_PK) violated 


SQL> 
SQL> REM: Inserting Valid Records
SQL> 	     INSERT INTO Studio VALUES('ARM Studios','#1, 7th Main Road,Chennai',9980776655);

1 row created.

SQL> 	     INSERT INTO Studio VALUES('Matthew Records','#13, 8th Cross Road,Chennai',8899776655);

1 row created.

SQL> 	     INSERT INTO Studio VALUES('Precision Studios','#21, 10th Main Road,Chennai',7799886655);

1 row created.

SQL> 	     INSERT INTO Studio VALUES('Sound Lab','#15, 12th Cross Road,Chennai',6699887755);

1 row created.

SQL> 
SQL> REM: Contents of Studio Table
SQL> 	     SELECT * FROM Studio;

STUDIO_NAME          ADDRESS                                                 PHONE                                                                    
-------------------- -------------------------------------------------- ----------                                                                    
U2 Studios           #1, 7th Main Road,Chennai                          9988776655                                                                    
ARM Studios          #1, 7th Main Road,Chennai                          9980776655                                                                    
Matthew Records      #13, 8th Cross Road,Chennai                        8899776655                                                                    
Precision Studios    #21, 10th Main Road,Chennai                        7799886655                                                                    
Sound Lab            #15, 12th Cross Road,Chennai                       6699887755                                                                    

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Creating Album Table
SQL> 
SQL> 	     CREATE TABLE Album(
  2  	     Album_Name varchar2(25),
  3  	     Album_ID varchar2(4),
  4  	     Year Number(4),
  5  	     No_Tracks Number(3),
  6  	     Studio_Name varchar2(20),
  7  	     Genre varchar2(10),
  8  	     M_ID varchar2(4),
  9  	     CONSTRAINT album_chk_genre CHECK(Genre IN ('CAR', 'DIV', 'MOV', 'POP')),
 10  	     CONSTRAINT album_chk_year CHECK(Year > 1954),
 11  	     CONSTRAINT album_pk PRIMARY KEY(Album_ID),
 12  	     CONSTRAINT album_fk FOREIGN KEY(Studio_Name) REFERENCES Studio(Studio_Name),
 13  	     CONSTRAINT album_fk_mus FOREIGN KEY(M_ID) REFERENCES Musician(M_ID)
 14  	     );

Table created.

SQL> 
SQL> 	     DESC Album
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ALBUM_NAME                                                                                   VARCHAR2(25)
 ALBUM_ID                                                                            NOT NULL VARCHAR2(4)
 YEAR                                                                                         NUMBER(4)
 NO_TRACKS                                                                                    NUMBER(3)
 STUDIO_NAME                                                                                  VARCHAR2(20)
 GENRE                                                                                        VARCHAR2(10)
 M_ID                                                                                         VARCHAR2(4)

SQL> 
SQL> REM:  Inserting into Album Table
SQL> 
SQL> 	     INSERT INTO Album VALUES('Darbar','ALB1',2019,5,'ARM Studios','CAR','M01');

1 row created.

SQL> 
SQL> REM: Foreign Key Constraint Error(No such studio)
SQL> 	     INSERT INTO Album VALUES('Test','ALB2',2019,4,'XYZ Studios','CAR','M01');
	INSERT INTO Album VALUES('Test','ALB2',2019,4,'XYZ Studios','CAR','M01')
*
ERROR at line 1:
ORA-02291: integrity constraint (1089.ALBUM_FK) violated - parent key not found 


SQL> 
SQL> REM: Foreign Key Constraint Error(No such Musician)
SQL> 	     INSERT INTO Album VALUES('Test','ALB2',2018,5,'ARM Studios','MOV','M100');
	INSERT INTO Album VALUES('Test','ALB2',2018,5,'ARM Studios','MOV','M100')
*
ERROR at line 1:
ORA-02291: integrity constraint (1089.ALBUM_FK_MUS) violated - parent key not found 


SQL> 
SQL> REM: Checking Year of Release
SQL> 	     INSERT INTO Album VALUES('Test','ALB3',1940,5,'ARM Studios','DIV','M01');
	INSERT INTO Album VALUES('Test','ALB3',1940,5,'ARM Studios','DIV','M01')
*
ERROR at line 1:
ORA-02290: check constraint (1089.ALBUM_CHK_YEAR) violated 


SQL> 
SQL> REM: Checking Genre
SQL> 	     INSERT INTO Album VALUES('Test','ALB4',2019,5,'ARM Studios','ELE','M01');
	INSERT INTO Album VALUES('Test','ALB4',2019,5,'ARM Studios','ELE','M01')
*
ERROR at line 1:
ORA-02290: check constraint (1089.ALBUM_CHK_GENRE) violated 


SQL> 
SQL> REM: Inserting Valid Values
SQL> 	     INSERT INTO Album VALUES('Psycho','ALB2',2019,5,'ARM Studios','CAR','M01');

1 row created.

SQL> 	     INSERT INTO Album VALUES('1986','ALB3',2018,3,'Matthew Records','DIV','M02');

1 row created.

SQL> 	     INSERT INTO Album VALUES('Advent','ALB4',2020,8,'Sound Lab','MOV','M02');

1 row created.

SQL> 
SQL> REM: Contents of Album Table
SQL> 	     SELECT * FROM Album;

ALBUM_NAME                ALBU       YEAR  NO_TRACKS STUDIO_NAME          GENRE      M_ID                                                             
------------------------- ---- ---------- ---------- -------------------- ---------- ----                                                             
Darbar                    ALB1       2019          5 ARM Studios          CAR        M01                                                              
Psycho                    ALB2       2019          5 ARM Studios          CAR        M01                                                              
1986                      ALB3       2018          3 Matthew Records      DIV        M02                                                              
Advent                    ALB4       2020          8 Sound Lab            MOV        M02                                                              

SQL> 
SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Creating Song Table
SQL> 
SQL> 	     CREATE TABLE Song(
  2  	     Album_ID varchar2(4),
  3  	     Track_No Number(3),
  4  	     Song_Name varchar2(30) CONSTRAINT song_name_not_null NOT NULL,
  5  	     Length varchar2(10),
  6  	     Genre varchar2(10),
  7  	     CONSTRAINT song_chk_genre CHECK(Genre IN ('PHI', 'REL', 'LOV', 'PAT')),
  8  	     CONSTRAINT song_chk_len CHECK((Genre = 'PAT' and Length > 7) or Genre != 'PAT'),
  9  	     CONSTRAINT song_pk PRIMARY KEY(Album_ID,Track_No),
 10  	     CONSTRAINT song_fk FOREIGN KEY(Album_ID) REFERENCES Album(Album_ID)
 11  	     );

Table created.

SQL> 
SQL> 	     DESC Song
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ALBUM_ID                                                                            NOT NULL VARCHAR2(4)
 TRACK_NO                                                                            NOT NULL NUMBER(3)
 SONG_NAME                                                                           NOT NULL VARCHAR2(30)
 LENGTH                                                                                       VARCHAR2(10)
 GENRE                                                                                        VARCHAR2(10)

SQL> 
SQL> REM: Inserting into Song Table
SQL> 	     INSERT INTO Song VALUES('ALB1',1,'First Track',8,'PHI');

1 row created.

SQL> 
SQL> REM: Checking genre
SQL> 	     INSERT INTO Song VALUES('ALB2',2,'First Track - Reprise',8,'ROCK');
	INSERT INTO Song VALUES('ALB2',2,'First Track - Reprise',8,'ROCK')
*
ERROR at line 1:
ORA-02290: check constraint (1089.SONG_CHK_GENRE) violated 


SQL> 
SQL> REM: Checking Len for PAT songs
SQL> 	     INSERT INTO Song VALUES('ALB2',1,'Nation First',6,'PAT');
	INSERT INTO Song VALUES('ALB2',1,'Nation First',6,'PAT')
*
ERROR at line 1:
ORA-02290: check constraint (1089.SONG_CHK_LEN) violated 


SQL> 
SQL> REM: Inserting Valid Values
SQL> 	     INSERT INTO Song VALUES('ALB2',1,'Nirvana',8,'PHI');

1 row created.

SQL> 	     INSERT INTO Song VALUES('ALB2',2,'Hello',3,'REL');

1 row created.

SQL> 	     INSERT INTO Song VALUES('ALB4',1,'Roses',5,'LOV');

1 row created.

SQL> 
SQL> REM: Contents of Song Table
SQL> 	     SELECT * FROM song;

ALBU   TRACK_NO SONG_NAME                      LENGTH     GENRE                                                                                       
---- ---------- ------------------------------ ---------- ----------                                                                                  
ALB1          1 First Track                    8          PHI                                                                                         
ALB2          1 Nirvana                        8          PHI                                                                                         
ALB2          2 Hello                          3          REL                                                                                         
ALB4          1 Roses                          5          LOV                                                                                         

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Creating Artist Table
SQL> 
SQL> 	     CREATE TABLE Artist(
  2  	     Artist_ID varchar2(4),
  3  	     Artist_Name varchar2(25),
  4  	     CONSTRAINT artist_pk PRIMARY KEY(Artist_ID),
  5  	     CONSTRAINT artist_name_uniq UNIQUE(Artist_Name)
  6  	     );

Table created.

SQL> 
SQL> 	     DESC ARTIST
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ARTIST_ID                                                                           NOT NULL VARCHAR2(4)
 ARTIST_NAME                                                                                  VARCHAR2(25)

SQL> 
SQL> 
SQL> REM: Inserting into Artist Table
SQL> 
SQL> 	     INSERT INTO Artist VALUES('A01','Sid Sriram');

1 row created.

SQL> 
SQL> REM: Checking unique artist name
SQL> 	     INSERT INTO Artist VALUES('A02','Sid Sriram');
	INSERT INTO Artist VALUES('A02','Sid Sriram')
*
ERROR at line 1:
ORA-00001: unique constraint (1089.ARTIST_NAME_UNIQ) violated 


SQL> 
SQL> REM: Inserting valid records:
SQL> 	     INSERT INTO Artist VALUES('A02','Joseph');

1 row created.

SQL> 	     INSERT INTO Artist VALUES('A03','Ani');

1 row created.

SQL> 	     INSERT INTO Artist VALUES('A04','Stephen');

1 row created.

SQL> 
SQL> REM: Contents of Artist
SQL> 
SQL> 	     SELECT * FROM Artist;

ARTI ARTIST_NAME                                                                                                                                      
---- -------------------------                                                                                                                        
A01  Sid Sriram                                                                                                                                       
A02  Joseph                                                                                                                                           
A03  Ani                                                                                                                                              
A04  Stephen                                                                                                                                          

SQL> 
SQL> 
SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Creating SungBy Table
SQL> 
SQL> 	     CREATE TABLE SungBy(
  2  	     Album_ID varchar2(4),
  3  	     Track_No Number(3),
  4  	     Artist_ID varchar2(4),
  5  	     R_Date Date,
  6  	     CONSTRAINT sungby_pk PRIMARY KEY(Album_ID,Track_No,Artist_ID),
  7  	     CONSTRAINT sungby_fk FOREIGN KEY(Album_ID,Track_No) REFERENCES Song(Album_ID,Track_No),
  8  	     CONSTRAINT sungby_fk2 FOREIGN KEY(Artist_ID) REFERENCES Artist(Artist_ID)
  9  	     );

Table created.

SQL> 
SQL> 	     DESC SungBy
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ALBUM_ID                                                                            NOT NULL VARCHAR2(4)
 TRACK_NO                                                                            NOT NULL NUMBER(3)
 ARTIST_ID                                                                           NOT NULL VARCHAR2(4)
 R_DATE                                                                                       DATE

SQL> 
SQL> REM: Inserting into SungBy table
SQL> 	     INSERT INTO SungBy VALUES('ALB1',1,'A01','05Jan2019');

1 row created.

SQL> 
SQL> REM: Checking Foreign Key Constraint
SQL> 	     INSERT INTO SungBy VALUES('ALB1',2,'A01','05Mar2018');
	INSERT INTO SungBy VALUES('ALB1',2,'A01','05Mar2018')
*
ERROR at line 1:
ORA-02291: integrity constraint (1089.SUNGBY_FK) violated - parent key not found 


SQL> 
SQL> REM: Inserting valid records
SQL> 	     INSERT INTO SungBy VALUES('ALB2',1,'A01','05Jan2019');

1 row created.

SQL> 	     INSERT INTO SungBy VALUES('ALB2',2,'A02','17Jul2018');

1 row created.

SQL> 	     INSERT INTO SungBy VALUES('ALB4',1,'A04','23Aug2017');

1 row created.

SQL> 
SQL> REM: Contents of SungBy Table
SQL> 	     SELECT * FROM SungBy;

ALBU   TRACK_NO ARTI R_DATE                                                                                                                           
---- ---------- ---- --------                                                                                                                         
ALB1          1 A01  05-01-19                                                                                                                         
ALB2          1 A01  05-01-19                                                                                                                         
ALB2          2 A02  17-07-18                                                                                                                         
ALB4          1 A04  23-08-17                                                                                                                         

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Adding Attribute Gender to Artist Table
SQL> 
SQL> 	     ALTER TABLE Artist ADD gender varchar2(1);

Table altered.

SQL> 
SQL> REM: Checking the schema
SQL> 
SQL> 	     DESC Artist;
 Name                                                                                Null?    Type
 ----------------------------------------------------------------------------------- -------- --------------------------------------------------------
 ARTIST_ID                                                                           NOT NULL VARCHAR2(4)
 ARTIST_NAME                                                                                  VARCHAR2(25)
 GENDER                                                                                       VARCHAR2(1)

SQL> 
SQL> REM: Adding New Record Into Artist Table
SQL> 
SQL> 	     INSERT INTO Artist VALUES('A05','Ashwin','M');

1 row created.

SQL> 
SQL> REM: Contents of Artist
SQL> 
SQL> 	     SELECT * FROM Artist;

ARTI ARTIST_NAME               G                                                                                                                      
---- ------------------------- -                                                                                                                      
A01  Sid Sriram                                                                                                                                       
A02  Joseph                                                                                                                                           
A03  Ani                                                                                                                                              
A04  Stephen                                                                                                                                          
A05  Ashwin                    M                                                                                                                      

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Adding Phone Number Constraint to Studio table
SQL> 
SQL> 	     ALTER TABLE Studio ADD CONSTRAINT chk_ph_uniq UNIQUE(Phone);

Table altered.

SQL> 
SQL> REM: Checking Phone number Constraint
SQL> 
SQL> 	     INSERT INTO Studio VALUES('Sound Eng Lab','#42, 14th Main Road,Chennai',6699887755);
	INSERT INTO Studio VALUES('Sound Eng Lab','#42, 14th Main Road,Chennai',6699887755)
*
ERROR at line 1:
ORA-00001: unique constraint (1089.CHK_PH_UNIQ) violated 


SQL> 
SQL> REM: Adding Valid Record
SQL> 
SQL> 	     INSERT INTO Studio VALUES('Sound Eng Lab','#42, 14th Main Road,Chennai',6898887755);

1 row created.

SQL> 
SQL> REM: Contents of Studio
SQL> 
SQL> 	     SELECT * FROM Studio;

STUDIO_NAME          ADDRESS                                                 PHONE                                                                    
-------------------- -------------------------------------------------- ----------                                                                    
U2 Studios           #1, 7th Main Road,Chennai                          9988776655                                                                    
ARM Studios          #1, 7th Main Road,Chennai                          9980776655                                                                    
Matthew Records      #13, 8th Cross Road,Chennai                        8899776655                                                                    
Precision Studios    #21, 10th Main Road,Chennai                        7799886655                                                                    
Sound Lab            #15, 12th Cross Road,Chennai                       6699887755                                                                    
Sound Eng Lab        #42, 14th Main Road,Chennai                        6898887755                                                                    

6 rows selected.

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Adding R_Date[Recording Date] NOT NULL constraint to SungBy Table
SQL> 
SQL> 	     ALTER TABLE SungBy MODIFY R_Date CONSTRAINT r_date_not_null NOT NULL;

Table altered.

SQL> 
SQL> REM: Checking  R_Date NOT NULL Constraint
SQL> 
SQL> 	     INSERT INTO SungBy VALUES('ALB2',1,'A01','');
	INSERT INTO SungBy VALUES('ALB2',1,'A01','')
	                                         *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("1089"."SUNGBY"."R_DATE") 


SQL> 
SQL> REM: Adding Valid Record into SungBy
SQL> 
SQL> 	     INSERT INTO SungBy VALUES('ALB2',1,'A02','05Jan2019');

1 row created.

SQL> 
SQL> REM: Contents of SungBy
SQL> 
SQL> 	     SELECT * FROM SungBy;

ALBU   TRACK_NO ARTI R_DATE                                                                                                                           
---- ---------- ---- --------                                                                                                                         
ALB1          1 A01  05-01-19                                                                                                                         
ALB2          1 A01  05-01-19                                                                                                                         
ALB2          2 A02  17-07-18                                                                                                                         
ALB4          1 A04  23-08-17                                                                                                                         
ALB2          1 A02  05-01-19                                                                                                                         

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Adding NAT Genre to song table
SQL> REM: Dropping Existing Constraint
SQL> 
SQL> 	     ALTER TABLE Song DROP CONSTRAINT song_chk_genre;

Table altered.

SQL> 
SQL> REM: Adding Modified CONSTRAINT
SQL> 
SQL> 	     ALTER TABLE Song ADD CONSTRAINT song_chk_genre CHECK(Genre IN('PHI', 'REL', 'LOV', 'PAT','NAT'));

Table altered.

SQL> 
SQL> REM: Checking Genre Constraint
SQL> 
SQL> 	     INSERT INTO Song VALUES('ALB4',2,'Memories',5,'SAD');
	INSERT INTO Song VALUES('ALB4',2,'Memories',5,'SAD')
*
ERROR at line 1:
ORA-02290: check constraint (1089.SONG_CHK_GENRE) violated 


SQL> 
SQL> REM: Adding Valid Record
SQL> 
SQL> 	     INSERT INTO Song VALUES('ALB4',2,'Memories',5,'NAT');

1 row created.

SQL> 
SQL> REM: Contents of Song
SQL> 
SQL> 	     SELECT * FROM Song;

ALBU   TRACK_NO SONG_NAME                      LENGTH     GENRE                                                                                       
---- ---------- ------------------------------ ---------- ----------                                                                                  
ALB1          1 First Track                    8          PHI                                                                                         
ALB2          1 Nirvana                        8          PHI                                                                                         
ALB2          2 Hello                          3          REL                                                                                         
ALB4          1 Roses                          5          LOV                                                                                         
ALB4          2 Memories                       5          NAT                                                                                         

SQL> 
SQL> REM: --------------------------------------------------------------------
> 
SQL> REM: Adding Constraint to delete all corresponding records when Song record is deleted
SQL> REM: Before Adding the constraint..
SQL> 
SQL> 	     DELETE FROM Song WHERE Album_ID = 'ALB1';
	DELETE FROM Song WHERE Album_ID = 'ALB1'
*
ERROR at line 1:
ORA-02292: integrity constraint (1089.SUNGBY_FK) violated - child record found 


SQL> 
SQL> REM: Adding Cascade Constraint
SQL> 
SQL> 	     ALTER TABLE SungBy DROP CONSTRAINT sungby_fk;

Table altered.

SQL> 	     ALTER TABLE SungBy ADD CONSTRAINT sungby_fk FOREIGN KEY(Album_ID,Track_No) REFERENCES Song(Album_ID,Track_No) ON DELETE CASCADE;

Table altered.

SQL> 
SQL> REM: Song Table Before Deletion
SQL> 
SQL> 	     SELECT * FROM Song;

ALBU   TRACK_NO SONG_NAME                      LENGTH     GENRE                                                                                       
---- ---------- ------------------------------ ---------- ----------                                                                                  
ALB1          1 First Track                    8          PHI                                                                                         
ALB2          1 Nirvana                        8          PHI                                                                                         
ALB2          2 Hello                          3          REL                                                                                         
ALB4          1 Roses                          5          LOV                                                                                         
ALB4          2 Memories                       5          NAT                                                                                         

SQL> 
SQL> REM: Deleting A Record
SQL> 
SQL> 	     DELETE FROM Song WHERE Album_ID='ALB1';

1 row deleted.

SQL> 
SQL> REM: Song Table After Deleting
SQL> 
SQL> 	     SELECT * FROM Song;

ALBU   TRACK_NO SONG_NAME                      LENGTH     GENRE                                                                                       
---- ---------- ------------------------------ ---------- ----------                                                                                  
ALB2          1 Nirvana                        8          PHI                                                                                         
ALB2          2 Hello                          3          REL                                                                                         
ALB4          1 Roses                          5          LOV                                                                                         
ALB4          2 Memories                       5          NAT                                                                                         

SQL> 
SQL> 
SQL> REM: --------------------------------------------------------------------;
SQL> spool off;

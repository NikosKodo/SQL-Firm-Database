
CREATE TABLE company
( 
  AFM char(9) NOT NULL,
  DOY VARCHAR(15) NOT NULL,
  NAME VARCHAR(35) NOT NULL,
  PHONE bigint(16) NOT NULL,
  STREET VARCHAR(15) NOT NULL,
  NUM tinyint(4) NOT NULL,
  CITY VARCHAR(15) NOT NULL,
  COUNTRY VARCHAR(15) NOT NULL,
  PRIMARY KEY (AFM)
);

INSERT INTO company VALUES
 ('14674','4334','EBAY', '210874513', 'Ag. Nikolaou', '18', 'Patra', 'Spain'),
 ('14567','5542','TESLA', '210862578', 'Korinthou', '45', 'San Antonio', 'Albania'),
 ('14611','7974','SPACEX', '210922583', 'Padanashs', '10', 'Detroit', 'Poland'),
 ('14590','1542','AMAZON', '210214598', 'Agias sofias', '35', 'NEW YORK', 'Greece'),
('14332','1542','PRWTO', '210214598', 'Zarouxleika', '28', 'Chicago', 'USA');

DROP TABLE IF EXISTS USER;
CREATE TABLE USER
(
  PASSWORD VARCHAR(10) NOT NULL,
  USERNAME VARCHAR(12) NOT NULL,
  NAME VARCHAR(25) NOT NULL,
  SURNAME VARCHAR(35) NOT NULL,
  EMAIL VARCHAR(30) NOT NULL,
  REG_DATE datetime NOT NULL,
  PRIMARY KEY (USERNAME)
);

INSERT INTO USER VALUES
('nickodo','KODOGIORGIS','Nikos','Kodogiorgis','nikoskontogiorgis@upatras.gr','2000-06-22 10:22:47'),
('avramovgiorg','AVRAMOVIC','Giorgos','Avramopoulos','avramgiorgos@upatras.gr','2000-01-18 12:10:32'),
('josh12345','JOSHING','JOSH','Ingaroua','joshingaroua@upatras.gr','1987-01-18 12:05:57'),
('jessicaalba','JESSICAALBA','Jessica','Alban','jessicaalba@upatras.gr','1992-06-12 07:11:32'),
('natasathewd','NATASATHEWD','Natasa','Thewdimiou','natasathewd@upatras.gr','1999-05-03 06:03:38'),
('spilostas','SPILIOSTAS','Spilios','Tasou','spiliostasou@upatras.gr','1998-06-12 07:11:32'),
('gededim','GEDEDIM','Dimitris','Gededopoulos','dimgede@upatras.gr','2019-05-03 06:08:38'),
('skaltsathan','SKLATSAS','Thanashs','Skaltsopoulos', 'skalathana@upatras.gr','2000-05-03 06:08:38'),
('karakoidas1234','KARASKOP','Nikos','Karakoidas','karakoidnik@upatras.gr','1999-05-03 06:08:38'),
('petropskot','PETROPOUL','Kwstas','Petropoulos','kwstapetrop@upatras.gr','1995-05-03 06:08:38'),
('athanasdim','ATHANA','Athanasia','Dimakopoulou','athanadim@upatras.gr','1997-05-03 06:08:38'),
('kwstoulbasil','KWSTBASILIKI','Basilikh','Kwstoula','kwstbasil@upatras.gr','1968-05-03 06:08:38'),
('kostaraanth','ANTHOULAKO','Anthoula','Kostara','anthkost@upatras.gr','1988-05-03 06:08:38'),
('kalidimoumaria','KALIDIMARIA','Maria','Kalidimoy','kalidimaria@upatras.gr','1990-05-03 06:08:38'),
('trasopoulosmixalhs','MIXAHLTRAS','Mixalhs','Trasopoulos','mixalakhs@upatras.gr','1994-05-03 06:08:38'),
('anastasopbasil','ANASTASOP','Basilhs','Anastasopoulos','basilanastasop@upatras.gr','2013-05-03 06:08:38'),
('kanellopoulosantwn','TONYKANELLO','Antwnhs','Kannelopoulos','tonykanello@upatras.gr','2001-05-03 06:08:38');


CREATE TABLE Administrator (
PASSWORD VARCHAR(10) NOT NULL,
ADMINUSR VARCHAR(12) NOT NULL,
NAME VARCHAR(25) NOT NULL,
SURNAME VARCHAR(35) NOT NULL,
EMAIL VARCHAR(30) NOT NULL,
REG_DATE datetime NOT NULL,
PRIMARY KEY (ADMINUSR),
FOREIGN KEY (ADMINUSR) REFERENCES USER(USERNAME)
ON DELETE CASCADE ON UPDATE CASCADE

);

INSERT INTO Administrator VALUES
('nickodo','KODOGIORGIS','Nikos','Kodogiorgis','nikoskontogiorgis@upatras.gr','2000-06-22 10:22:47'),
('avramovgiorg','AVRAMOVIC','Giorgos','Avramopoulos','avramgiorgos@upatras.gr','2000-01-18 12:10:32');



DROP TABLE degree if exists;
CREATE TABLE degree
(
  titlos VARCHAR(50) NOT NULL,
  idryma VARCHAR(40) NOT NULL,
  bathmida enum('LYKEIO','UNIV','MASTER','PHD') NOT NULL,
  PRIMARY KEY (titlos, idryma)
);

INSERT INTO degree VALUES
('Computer Engineering','Narxou','UNIV'),
('Mechanical Engineering','Kolokotroni','PHD'),
('Sience Engineering','Spathi','LYKEIO'),
('Architecture','Themistokleos','UNIV'),
('Omegalul','Niaoulh','LYKEIO'),
('AI','Locationalist','MASTER');

DROP TABLE IF EXISTS Log;
CREATE TABLE Log
(
  Date datetime NOT NULL,
  ektelesh VARCHAR(30) NOT NULL,
  eidos VARCHAR(30) NOT NULL,
  onoma_pinaka VARCHAR(30) NOT NULL,
  USERNAME VARCHAR(30) NOT NULL,
  PRIMARY KEY (USERNAME),
  FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MANAGER
(
  exp_years tinyint(4) NOT NULL,
  firm char(9) NOT NULL,
  MANAGERusername VARCHAR(12) NOT NULL,
  PRIMARY KEY (MANAGERusername),
  FOREIGN KEY (firm) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (MANAGERusername) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO MANAGER VALUES
('47','14674','TONYKANELLO'),
('32','14567','ANASTASOP'),
('27','14611','MIXAHLTRAS'),
('12','14590','KALIDIMARIA'),
('8','14674','ANTHOULAKO');

CREATE TABLE EVALUATOR
(
  EXP_YEARS tinyint(4) NOT NULL,
  USERNAME VARCHAR(12) NOT NULL,
  FIRM char(9) NOT NULL,
  PRIMARY KEY (USERNAME),
  FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (FIRM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO evaluator VALUES

('7','JOSHING','14567'),
('43','NATASATHEWD','14611'),
('11','JESSICAALBA','14567'),
('34','SPILIOSTAS','14611');

CREATE TABLE EMPLOYEE
(
  BIO text NOT NULL,
  SISTATIKES VARCHAR(35) NOT NULL,
  certificates VARCHAR(35) NOT NULL,
  awards VARCHAR(35) NOT NULL,
  USERNAME VARCHAR(12) NOT NULL,
  energeia_employee VARCHAR(69) NOT NULL,
  PRIMARY KEY (USERNAME),
  FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO EMPLOYEE VALUES
('kalos sta maths','well played','Computer','4','GEDEDIM','04-07-2013'),
('good in science','recommend that guy','Physics','4','SKLATSAS','04-07-2011'),
('nice person','favorite person','journalist','4','KARASKOP','04-07-1897'),
('better unemployed','loved this man ','comedy','4','PETROPOUL','03-09-2020');



DROP TABLE IF EXISTS JOB;
CREATE TABLE JOB
(
  ID INT(4) NOT NULL,
  start_date DATE NOT NULL,
  salary float(6,1) NOT NULL,
  EDRA VARCHAR(45) NOT NULL,
  position VARCHAR(40) NOT NULL,
  announce_date datetime NOT NULL,
  submission_date DATE NOT NULL,
  evaluator VARCHAR(12) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (evaluator) REFERENCES EVALUATOR(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO JOB VALUES
('123','2011-04-08','5','edra thessalonikh','position Zarouxleika','2008-12-04','2021-10-10','JOSHING'),
('479','2014-04-12','3','edra America','position NEW YORK','1997-12-04','2021-10-10','NATASATHEWD'),
('102','2019-04-07','2','edra Aigalaio','position NEW ZEALEAN','1987-12-04','2021-10-10','JESSICAALBA'),
('345','2016-04-08','1','edra Karditsa','position ANTARTICA','2012-12-04','2021-10-10','SPILIOSTAS');



DROP TABLE IF EXISTS project;
CREATE TABLE project
(
  NUM tinyint(4) NOT NULL,
  DESCR text NOT NULL,
  url VARCHAR(60) NOT NULL,
  EMPL VARCHAR(12) NOT NULL,
  PRIMARY KEY (NUM),
  FOREIGN KEY (EMPL) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO project VALUES
('11','best project','12345','GEDEDIM'),
('23','best project','12345','SKLATSAS'),
('89','best project','12345','KARASKOP'),
('09','best project','12345','PETROPOUL');


CREATE TABLE has_degree
(
  etos INT NOT NULL,
  grade INT NOT NULL,
  empl_usrname VARCHAR(12) NOT NULL,
  titlos VARCHAR(50) NOT NULL,
  idryma VARCHAR(40) NOT NULL,
  PRIMARY KEY (empl_usrname, titlos, idryma),
  FOREIGN KEY (empl_usrname) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (titlos, idryma) REFERENCES degree(titlos, idryma)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO has_degree VALUES
('2020','18','SKLATSAS','Computer Engineering','Narxou'),
('1999','10','GEDEDIM','Mechanical Engineering','Kolokotroni'),
('1997','8','KARASKOP','AI','Locationalist');


DROP TABLE IF EXISTS evaluation;
CREATE TABLE evaluation
(
  bathmologia_report INT(1) NOT NULL,
  bathmologia_interview INT(1) NOT NULL,
  bathmologia_carrer INT(1) NOT NULL,
  sxolia VARCHAR(255) NOT NULL,
  job_id INT(35) NOT NULL,
  evaluator_usrname VARCHAR(35) NOT NULL,
  empl_usrname VARCHAR(35) NOT NULL,
  manager_username VARCHAR(35) NOT NULL,
  manager_report VARCHAR(35) NOT NULL,
  bathmos_project tinyint(4) NOT NULL,
  PRIMARY KEY (empl_usrname),
  FOREIGN KEY (evaluator_usrname) REFERENCES EVALUATOR(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (bathmos_project) REFERENCES project(NUM)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (manager_username) REFERENCES MANAGER(MANAGERusername)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (empl_usrname) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO evaluation VALUES
('2','3','1', 'Ergatikos', '123','JOSHING','SKLATSAS','TONYKANELLO','eksuphretikos','11'),
('1','2','3', 'Dhmiourgikos','753','NATASATHEWD','GEDEDIM','ANASTASOP','ergatikos ','23'),
('2','2','3', 'Polu kalos tupos','893','JESSICAALBA','KARASKOP','MIXAHLTRAS','kalos anthrwpos','89');


DROP table if exists evaluationresult;
CREATE TABLE evaluationresult
(
  Evld INT(4) NOT NULL,
  grade INT(4) NOT NULL,
  comments VARCHAR(255) NOT NULL,
  empl_usrname VARCHAR(35) NOT NULL,
  job_id INT(4) NOT NULL,
  PRIMARY KEY (empl_usrname),
  FOREIGN KEY (empl_usrname) REFERENCES evaluation(empl_usrname)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (job_id) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO evaluationresult VALUES
('007','3','polu kalos','GEDEDIM','123'),
('356','4','eksairetikos','SKLATSAS','479'),
('444','2','timiotatos','KARASKOP','345');


DROP TABLE IF EXISTS requestevaluation; 
CREATE TABLE requestevaluation
(
  job_id INT(4) NOT NULL,
  empl_usrname VARCHAR(12) NOT NULL,
  PRIMARY KEY (empl_usrname),
  FOREIGN KEY (job_id) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO requestevaluation VALUES
('479','GEDEDIM'),
('123','SKLATSAS'),
('102','KARASKOP');


CREATE TABLE languages
(
  employee VARCHAR(12) NOT NULL,
  lang SET('EN','FR','SP','GR') NOT NULL,
  PRIMARY KEY (employee),
  FOREIGN KEY (employee) REFERENCES requestevaluation(empl_usrname)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO languages VALUES
('GEDEDIM','EN'), 
('SKLATSAS','FR'), 
('KARASKOP','SP');
 

DROP TABLE IF EXISTS Proagwges;
CREATE TABLE Proagwges
(
  theseis_proagwgwn VARCHAR(35) NOT NULL,
  aithseis_proagwgwn VARCHAR(35) NOT NULL,
  AFM_company char(9) NOT NULL,
  job_id INT(4) NOT NULL,
  PRIMARY KEY (AFM_company),
  FOREIGN KEY (AFM_company) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (job_id) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (aithseis_proagwgwn) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Proagwges VALUES
('thesh hlektrologou','GEDEDIM','14674','123'),
('thesh programmatisth','SKLATSAS','14567','479'),
('thesh xhmikou ','KARASKOP','14611','102');

CREATE TABLE ANTIKEIM
(
  TITTLE VARCHAR(36) NOT NULL,
  DESCR text NOT NULL,
  BELONGS_TO VARCHAR(36) NOT NULL,
  PRIMARY KEY (TITTLE),
  FOREIGN KEY (BELONGS_TO) REFERENCES ANTIKEIM(TITTLE)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ANTIKEIM VALUES
('Programmatisths','ergatikos','Programmatisths'),
('hlektrologos','empeiros','hlektrologos'),
('Arxitektonas','Dhmiourgikos','Arxitektonas');

CREATE TABLE NEEDS
(
  JOB_ID INT(4) NOT NULL,
  antikeim_title VARCHAR(36)  NOT NULL,
  PRIMARY KEY (JOB_ID),
  FOREIGN KEY (JOB_ID) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (antikeim_title) REFERENCES ANTIKEIM(TITTLE)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO NEEDS VALUES
('123','Programmatisths'),
('479','hlektrologos'),
('102','Arxitektonas');
);

INSERT INTO degree VALUES
('Computer Engineering','Narxou','UNIV'),
('Mechanical Engineering','Kolokotroni','PHD'),
('Sience Engineering','Spathi','LYKEIO'),
('Architecture','Themistokleos','UNIV'),
('Omegalul','Niaoulh','LYKEIO'),
('AI','Locationalist','MASTER');

DROP TABLE IF EXISTS Log;
CREATE TABLE Log
(
  Date datetime NOT NULL,
  ektelesh VARCHAR(30) NOT NULL,
  eidos VARCHAR(30) NOT NULL,
  onoma_pinaka VARCHAR(30) NOT NULL,
  USERNAME VARCHAR(30) NOT NULL,
  PRIMARY KEY (USERNAME),
  FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MANAGER
(
  exp_years tinyint(4) NOT NULL,
  firm char(9) NOT NULL,
  MANAGERusername VARCHAR(12) NOT NULL,
  PRIMARY KEY (MANAGERusername),
  FOREIGN KEY (firm) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (MANAGERusername) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO MANAGER VALUES
('47','14674','JOSHING'),
('32','14567','JESSICAALBA'),
('27','14611','NATASATHEWD'),
('12','14590','SPILIOSTAS'),
('8','14674','DIMAUGO');

CREATE TABLE EVALUATOR
(
  EXP_YEARS tinyint(4) NOT NULL,
  USERNAME VARCHAR(12) NOT NULL,
  FIRM char(9) NOT NULL,
  PRIMARY KEY (USERNAME),
  FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (FIRM) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO evaluator VALUES

('7','JOSHING','14567'),
('43','NATASATHEWD','14611'),
('11','DIMAUGO','14567'),
('34','SPILIOSTAS','14611');

CREATE TABLE EMPLOYEE
(
  BIO text NOT NULL,
  SISTATIKES VARCHAR(35) NOT NULL,
  certificates VARCHAR(35) NOT NULL,
  awards VARCHAR(35) NOT NULL,
  USERNAME VARCHAR(12) NOT NULL,
  energeia_employee VARCHAR(69) NOT NULL,
  PRIMARY KEY (USERNAME),
  FOREIGN KEY (USERNAME) REFERENCES USER(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO EMPLOYEE VALUES
('kalos sta maths','well played','Computer','4','JOSHING','04-07-2013'),
('good in science','recommend that guy','Physics','4','NATASATHEWD','04-07-2011'),
('nice person','favorite person','journalist','4','DIMAUGO','04-07-1897'),
('better unemployed','loved this man ','comedy','4','SPILIOSTAS','03-09-2020');



DROP TABLE IF EXISTS JOB;
CREATE TABLE JOB
(
  ID INT(4) NOT NULL,
  start_date DATE NOT NULL,
  salary float(6,1) NOT NULL,
  EDRA VARCHAR(45) NOT NULL,
  position VARCHAR(40) NOT NULL,
  announce_date datetime NOT NULL,
  submission_date DATE NOT NULL,
  evaluator VARCHAR(12) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (evaluator) REFERENCES EVALUATOR(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO JOB VALUES
('123','2011-04-08','5','edra thessalonikh','position Zarouxleika','2008-12-04','2021-10-10','JOSHING'),
('479','2014-04-12','3','edra America','position NEW YORK','1997-12-04','2021-10-10','NATASATHEWD'),
('102','2019-04-07','2','edra Aigalaio','position NEW ZEALEAN','1987-12-04','2021-10-10','DIMAUGO'),
('345','2016-04-08','1','edra Karditsa','position ANTARTICA','2012-12-04','2021-10-10','SPILIOSTAS'),
('845','2012-09-13','4','edra Mangester','position AGIA SOFIAS','2010-12-04','2021-10-10','DIMAUGO');


DROP TABLE IF EXISTS project;
CREATE TABLE project
(
  NUM tinyint(4) NOT NULL,
  DESCR text NOT NULL,
  url VARCHAR(60) NOT NULL,
  EMPL VARCHAR(12) NOT NULL,
  PRIMARY KEY (NUM),
  FOREIGN KEY (EMPL) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO project VALUES
('11','best project','12345','JOSHING'),
('23','best project','12345','NATASATHEWD'),
('89','best project','12345','DIMAUGO'),
('37','best project','12345','SPILIOSTAS'),
('09','best project','12345','DIMAUGO');


CREATE TABLE has_degree
(
  etos INT NOT NULL,
  grade INT NOT NULL,
  empl_usrname VARCHAR(12) NOT NULL,
  titlos VARCHAR(50) NOT NULL,
  idryma VARCHAR(40) NOT NULL,
  PRIMARY KEY (empl_usrname, titlos, idryma),
  FOREIGN KEY (empl_usrname) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (titlos, idryma) REFERENCES degree(titlos, idryma)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO has_degree VALUES
('2020','18','NATASATHEWD','Computer Engineering','Narxou'),
('1999','10','DIMAUGO','Mechanical Engineering','Kolokotroni');


DROP TABLE IF EXISTS evaluation;
CREATE TABLE evaluation
(
  bathmologia_report INT(1) NOT NULL,
  bathmologia_interview INT(1) NOT NULL,
  bathmologia_carrer INT(1) NOT NULL,
  sxolia VARCHAR(255) NOT NULL,
  job_id INT(35) NOT NULL,
  evaluator_usrname VARCHAR(35) NOT NULL,
  empl_usrname VARCHAR(35) NOT NULL,
  manager_username VARCHAR(35) NOT NULL,
  manager_report VARCHAR(35) NOT NULL,
  bathmos_project tinyint(4) NOT NULL,
  PRIMARY KEY (empl_usrname),
  FOREIGN KEY (evaluator_usrname) REFERENCES EVALUATOR(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (bathmos_project) REFERENCES project(NUM)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (manager_username) REFERENCES MANAGER(MANAGERusername)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (empl_usrname) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO evaluation VALUES
('2','3','1', 'Ergatikos', '123','JOSHING','SPILIOSTAS','JOSHING','eksuphretikos','23'),
('1','2','3', 'Dhmiourgikos','753','NATASATHEWD','NATASATHEWD','NATASATHEWD','ergatikos ','37'),
('2','2','3', 'Polu kalos tupos','893','DIMAUGO','DIMAUGO','DIMAUGO','kalos anthrwpos','89');


DROP table if exists evaluationresult;
CREATE TABLE evaluationresult
(
  Evld INT(4) NOT NULL,
  grade INT(4) NOT NULL,
  comments VARCHAR(255) NOT NULL,
  empl_usrname VARCHAR(35) NOT NULL,
  job_id INT(4) NOT NULL,
  PRIMARY KEY (empl_usrname),
  FOREIGN KEY (empl_usrname) REFERENCES evaluation(empl_usrname)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (job_id) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO evaluationresult VALUES
('007','3','polu kalos','NATASATHEWD','123'),
('356','4','eksairetikos','SPILIOSTAS','479'),
('444','2','timiotatos','DIMAUGO','345');


DROP TABLE IF EXISTS requestevaluation; 
CREATE TABLE requestevaluation
(
  job_id INT(4) NOT NULL,
  empl_usrname VARCHAR(12) NOT NULL,
  PRIMARY KEY (empl_usrname),
  FOREIGN KEY (job_id) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO requestevaluation VALUES
('479','SPILIOSTAS'),
('123','NATASATHEWD'),
('845','DIMAUGO');


CREATE TABLE languages
(
  employee VARCHAR(12) NOT NULL,
  lang SET('EN','FR','SP','GR') NOT NULL,
  PRIMARY KEY (employee),
  FOREIGN KEY (employee) REFERENCES requestevaluation(empl_usrname)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO languages VALUES
('SPILIOSTAS','EN'), 
('NATASATHEWD','FR'), 
('DIMAUGO','SP');
 

DROP TABLE IF EXISTS Proagwges;
CREATE TABLE Proagwges
(
  theseis_proagwgwn VARCHAR(35) NOT NULL,
  aithseis_proagwgwn VARCHAR(35) NOT NULL,
  AFM_company char(9) NOT NULL,
  job_id INT(4) NOT NULL,
  PRIMARY KEY (AFM_company),
  FOREIGN KEY (AFM_company) REFERENCES company(AFM)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (job_id) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (aithseis_proagwgwn) REFERENCES EMPLOYEE(USERNAME)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Proagwges VALUES
('thesh hlektrologou','JOSHING','14674','123'),
('thesh programmatisth','NATASATHEWD','14567','479'),
('thesh xhmikou ','DIMAUGO','14611','102');

CREATE TABLE ANTIKEIM
(
  TITTLE VARCHAR(36) NOT NULL,
  DESCR text NOT NULL,
  BELONGS_TO VARCHAR(36) NOT NULL,
  PRIMARY KEY (TITTLE),
  FOREIGN KEY (BELONGS_TO) REFERENCES ANTIKEIM(TITTLE)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO ANTIKEIM VALUES
('Programmatisths','ergatikos','Programmatisths'),
('hlektrologos','empeiros','hlektrologos'),
('Arxitektonas','Dhmiourgikos','Arxitektonas');

CREATE TABLE NEEDS
(
  JOB_ID INT(4) NOT NULL,
  antikeim_title VARCHAR(36)  NOT NULL,
  PRIMARY KEY (JOB_ID),
  FOREIGN KEY (JOB_ID) REFERENCES JOB(ID)
  ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (antikeim_title) REFERENCES ANTIKEIM(TITTLE)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO NEEDS VALUES
('123','Programmatisths'),
('479','hlektrologos'),
('845','Arxitektonas');
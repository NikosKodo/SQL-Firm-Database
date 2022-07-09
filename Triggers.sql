@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
TRIGGERS PRWTOU ERWTHMATOS
---------------------------  

DROP TRIGGER IF EXISTS triggerA;

DELIMITER $
CREATE trigger triggerA
AFTER insert on job
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','insert','job','GEDEDIM');


  END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DROP TRIGGER IF EXISTS triggerB;

DELIMITER $
CREATE trigger triggerB
AFTER UPDATE on job
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','UPDATE','job','GEDEDIM');


  END$
DELIMITER ; 

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
DROP TRIGGER IF EXISTS triggerC;

DELIMITER $
CREATE trigger triggerC
AFTER delete on job
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','delete','job','GEDEDIM');


  END$
DELIMITER ;  


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


DROP TRIGGER IF EXISTS triggerD;

DELIMITER $
CREATE trigger triggerD
AFTER insert on employee
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','insert','employee',new.USERNAME);


  END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DROP TRIGGER IF EXISTS triggerE;

DELIMITER $
CREATE trigger triggerE
AFTER UPDATE on employee
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','update','employee',new.USERNAME);


  END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


DROP TRIGGER IF EXISTS triggerF;

DELIMITER $
CREATE trigger triggerF
AFTER DELETE on employee
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','delete','employee',old.USERNAME);


  END$
DELIMITER ;


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DROP TRIGGER IF EXISTS triggerG;

DELIMITER $
CREATE trigger triggerG
AFTER insert on requestevaluation
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','insert','employee','GEDEDIM');


  END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

DROP TRIGGER IF EXISTS triggerH;

DELIMITER $
CREATE trigger triggerH
AFTER UPDATE on requestevaluation
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','update','employee','GEDEDIM');


  END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


DROP TRIGGER IF EXISTS triggerI;

DELIMITER $
CREATE trigger triggerI
AFTER DELETE on requestevaluation
for each row
begin

insert into log(Date,ektelesh,eidos,onoma_pinaka,USERNAME)
values (NOW(),'epituxia','delete','employee','GEDEDIM');


  END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
TRIGGER DEUTEROU ERWTHMATOS
---------------------------

DROP TRIGGER IF EXISTS triggercompany;

DELIMITER $
CREATE trigger triggercompany
before update on company
for each row
begin

declare NAFM INT(30);
declare OAFM INT(30);
declare NDOY INT(30);
declare ODOY INT(30);
declare NNAME VARCHAR(30);
declare ONAME VARCHAR(30);
 


set NAFM = new.AFM;
set OAFM = old.AFM;
set NDOY = new.DOY;
set ODOY = old.DOY;
set NNAME = new.Name;
set ONAME = old.Name;



if (NAFM <> OAFM) then
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = 'DEN GINETAI NA ALLAKSEIS TO AFM ';
END IF;

if (NDOY <> ODOY) then
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = 'DEN GINETAI NA ALLAKSEIS TO DOY ';
END IF;

if (NNAME <> ONAME) then
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = 'DEN GINETAI NA ALLAKSEIS TO NAME ';
END IF;

END$
DELIMITER ;

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
TRIGGER TRITOU ERWTHMATOS
-------------------------

DROP TRIGGER IF EXISTS triggerAdmin;

DELIMITER $
CREATE trigger triggerAdmin
before update on user
for each row
begin

declare NUSER VARCHAR(30);
set NUSER = new.USERNAME;

if (NUSER NOT LIKE 'AVRAMOVIC' OR 'KODOGIORGIS' ) then
SIGNAL SQLSTATE VALUE '45000'
SET MESSAGE_TEXT = 'DEN GINETAI NA KANEIS ALLAGES O XRHSTHS DEN EINAI ADMINISTRATOR';
END IF; 
END$
DELIMITER ;
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
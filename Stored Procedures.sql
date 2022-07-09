@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

1h STORED PROCEDURE
-------------------

DELIMITER $
DROP PROCEDURE IF EXISTS aithseis$

CREATE PROCEDURE aithseis( IN name VARCHAR(55) , surname VARCHAR(128))
BEGIN

select aithseis_proagwgwn, theseis_proagwgwn,evaluator_usrname,grade
from Proagwges p
join EMPLOYEE e on p.aithseis_proagwgwn=e.USERNAME
 join USER u on e.USERNAME = u.USERNAME
 join evaluation ev on ev.empl_usrname = e.USERNAME
 join evaluationresult er on er.empl_usrname = ev.empl_usrname

 where  u.NAME=name and u.SURNAME=surname;

END$
DELIMITER ;

call aithseis('Dimitris','Gededopoulos');


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

2h STORED PROCEDURE
-------------------


DELIMITER $
DROP PROCEDURE IF EXISTS Kodoprocedure$

CREATE PROCEDURE Kodoprocedure(IN idjob INT,IN kodouser VARCHAR(69))


BEGIN

    declare grad int;
    declare Kodo int;
    declare Avra int;
    declare mm int;

        select bathmologia_report,bathmologia_carrer,bathmologia_interview,
        bathmologia_report+bathmologia_carrer+bathmologia_interview AS 'mm' into 
        grad,Kodo,Avra,mm
        from evaluationresult inner join evaluation 
        on evaluationresult.empl_usrname=evaluation.empl_usrname
        inner join project on evaluation.bathmos_project=project.num
        inner join employee on project.EMPL=employee.USERNAME
        inner join proagwges on proagwges.aithseis_proagwgwn=employee.USERNAME
        inner join job on job.ID=proagwges.job_id 
        WHERE job.ID=idjob AND employee.USERNAME=kodouser LIMIT 1;
        if (mm) is null then 
        insert into evaluationresult values ('7','mm','polu kalos','GEDEDIM','123');
        select grad AS 'bathmologia_report',kodo AS 'bathmologia_carrer',
        avra AS 'bathmologia_interview',mm AS 'grade';
        else

        select grad AS 'bathmologia_report',kodo AS 'bathmologia_carrer',
        avra AS 'bathmologia_interview',mm AS 'grade';

       end if;
END$
DELIMITER ;

call Kodoprocedure(123,'GEDEDIM');
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

3h STORED PROCEDURE
-------------------

DELIMITER $
DROP PROCEDURE IF EXISTS gogasprocedure$

CREATE PROCEDURE gogasprocedure(IN idjob INT)

BEGIN
    declare ono VARCHAR(69);
    declare makis int;

  select 'oristikopoihmenoi pinakes';

    select  grade,USERNAME
        from evaluationresult  inner join evaluation 
        on evaluationresult.empl_usrname=evaluation.empl_usrname
        inner join project on evaluation.bathmos_project=project.num
        inner join employee on project.EMPL=employee.USERNAME
        inner join proagwges on proagwges.aithseis_proagwgwn=employee.USERNAME
        inner join job on job.ID=proagwges.job_id 
        WHERE job.ID=idjob;

  select 'mh oristikopoihmenoi pinakes';

  select  e.empl_usrname ,er.grade
        from evaluation e
        left join evaluationresult er  on er.empl_usrname= e.empl_usrname
        inner join project on e.bathmos_project=project.num
        inner join employee on project.EMPL=employee.USERNAME
        inner join proagwges on proagwges.aithseis_proagwgwn=employee.USERNAME
        inner join job on job.ID=proagwges.job_id 
        WHERE job.ID=idjob ;

 END$
delimiter ;

call gogasprocedure('123');
































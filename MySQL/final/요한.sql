/* 더미데이터 boardtype mansearch 삭제 */
delete from mansearch_board;
delete from board where boardtype='mansearch';

update member set corp_status=2 where id='m00151';
update member set corp_status=2 where id='m00152';
update member set corp_status=2 where id='m00153';
update member set corp_status=2 where id='m00154';
update member set corp_status=2 where id='m00155';
update member set corp_status=2 where id='m00156';
update member set corp_status=2 where id='m00157';
update member set corp_status=2 where id='m00158';
update member set corp_status=2 where id='m00159';
update member set corp_status=2 where id='m00160';


/* 구인게시판에 글 작성 가능한 id목록 추가 */
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00151','사업자등록증.png','mansearch_view_corp_logo.png','캐빈시스템','010-1111-1111','corp@outlook.com','담당자이름','010-2222-2222','manager@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00152','사업자등록증.png','mansearch_bluecom.jpg','블루컴','010-1111-1111','bluecom@outlook.com','담당자이름','010-2222-2222','bluecom1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00153','사업자등록증.png','mansearch_dabinnetworks.png','다빈네트웍스','010-1111-1111','dabin@outlook.com','담당자이름','010-2222-2222','dabin1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00154','사업자등록증.png','mansearch_gspec.Jpg','지스펙','010-1111-1111','gspec@outlook.com','담당자이름','010-2222-2222','gspec1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00155','사업자등록증.png','mansearch_itist.jpg','아이티이스트','010-1111-1111','itist@outlook.com','담당자이름','010-2222-2222','itist1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00156','사업자등록증.png','mansearch_pilgrimsoft.png','필그림소프트','010-1111-1111','pilgrimsoft@outlook.com','담당자이름','010-2222-2222','pilgrimsoft1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00157','사업자등록증.png','mansearch_pni.png','피앤아이','010-1111-1111','pni@outlook.com','담당자이름','010-2222-2222','pni1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00158','사업자등록증.png','mansearch_pssoft.png','피에스소프트','010-1111-1111','pssoft@outlook.com','담당자이름','010-2222-2222','pssoft1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00159','사업자등록증.png','mansearch_smartfive.png','스마트파이브','010-1111-1111','smartfive@outlook.com','담당자이름','010-2222-2222','smartfive1@outlook.com');
insert into corperation(id,corp_license,corp_logo,corp_name,corp_phone,corp_email,manager_name,manager_phone,manager_email)
values ('m00160','사업자등록증.png','mansearch_wizinc.png','위즈아이앤씨','010-1111-1111','wizinc@outlook.com','담당자이름','010-2222-2222','wizinc1@outlook.com');

/* 게시글 추가*/
/* mansearch_board table에 추가 */
select * from board where boardtype='mansearch';
select * from mansearch_board;
select * from corperation;
CREATE PROCEDURE board_mansearch_input1()
BEGIN
   DECLARE cnt INT DEFAULT 1;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00151','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
      IF cnt=20 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input1();

CREATE PROCEDURE board_mansearch_input2()
BEGIN
   DECLARE cnt INT DEFAULT 21;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00152','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
      IF cnt=40 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input2();

CREATE PROCEDURE board_mansearch_input3()
BEGIN
   DECLARE cnt INT DEFAULT 41;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00153','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
      IF cnt=60 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input3();

CREATE PROCEDURE board_mansearch_input4()
BEGIN
   DECLARE cnt INT DEFAULT 61;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00154','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
      IF cnt=80 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input4();

CREATE PROCEDURE board_mansearch_input5()
BEGIN
   DECLARE cnt INT DEFAULT 81;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00155','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-02-15',800,'경기 용인시 기흥구 농서동','프론트앤드개발, 팀원','계약직','10년 이상 ~ 무관','학사 이상','협의','매월 12일','javascript, vue.js','2023-02-05','SM','금융');
      IF cnt=100 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input5();

CREATE PROCEDURE board_mansearch_input6()
BEGIN
   DECLARE cnt INT DEFAULT 101;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00156','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');
      IF cnt=120 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input6();

CREATE PROCEDURE board_mansearch_input7()
BEGIN
   DECLARE cnt INT DEFAULT 121;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00157','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');
      IF cnt=140 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input7();

CREATE PROCEDURE board_mansearch_input8()
BEGIN
   DECLARE cnt INT DEFAULT 141;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00158','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');      
      IF cnt=160 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input8();

CREATE PROCEDURE board_mansearch_input9()
BEGIN
   DECLARE cnt INT DEFAULT 161;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00159','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');      
      IF cnt=180 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input9();

CREATE PROCEDURE board_mansearch_input10()
BEGIN
   DECLARE cnt INT DEFAULT 181;
   here:LOOP
      INSERT INTO board(id, boardtype, nal, subject, doc)
      VALUES ('m00160','mansearch',now(),CONCAT('가족같은 분위기에서 일하실 분 구합니다',cnt),'<p><span style="background-color: rgb(255, 255, 0);">구인공고글 작성!!</span></p>');
      INSERT INTO mansearch_board(sno, work_start, pay, corp_location, position, job_type, required_career, education_level, work_type, pay_date, required_skill, deadline, main_task, sub_task)
      VALUES ((select sno from board order by sno desc limit 0,1),'2023-03-24',600,'서울 서초구 서초동','백엔드개발, 팀원','계약직','3년 이상 ~ 무관','학력 무관','상근','매월 25일','java,spring,mysql','2023-03-10','SI','인터넷 / 서비스');      
      IF cnt=200 THEN
         LEAVE here;
      END IF;
      SET cnt=cnt+1;   
   END LOOP;
   
END;

CALL board_mansearch_input10();

ALTER TABLE pixel_history ADD history_detail varchar(255) NOT NULL;

commit;

SELECT * FROM member WHERE id="m00160";
SELECT * FROM pixel_history;
SELECT * FROM pixel_buy_list;

SELECT * FROM member;

                                                               ##id, sno, grp, seq, deep
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0013',3,   0,   0,   0,   sysdate(),'댓글1 id=m0013, sno=3, grp=0, seq=0, deep=0, 좋은글이네요');
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0012',3,   1,   1,   0,   sysdate(),'댓글2 id=m0012, sno=3, grp=1, seq=1, deep=0, 맞아요좋은글입니다');
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0014',3,   1,   2,   1,   sysdate(),'댓글2의 대댓글 id=m0014, sno=3, grp=1, seq=2, deep=1, 입니다.');
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0014',3,   2,   3,   0,   sysdate(),'댓글3 id=m0014, sno=3, grp=2, seq=3, deep=0, 뉴진스 하입보이요0');
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0014',3,   3,   4,   0,   sysdate(),'댓글4 id=m0014 sno=3, grp=3, seq=4, deep=0, 뉴진스 하입보이요1');
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0014',3,   4,   5,   0,   sysdate(),'댓글5 id=m0014, sno=3, grp=4, seq=5, deep=0, 뉴진스 하입보이요2');
insert into repl(id,sno,grp,seq,deep,repl_nal,repl_doc) values('m0014',3,   2,   6,   1,   sysdate(),'댓글3의 대댓글 id=m0014, sno=3, grp=2, seq=6, deep=1, 입니다');

select * from repl;
delete from repl;
commit;

##시연용 픽셀환전수수료 더미데이터
insert into pixel_exchange_rate values(60,70,80,90);





select * from repl;
commit;

##픽셀 히스토리 마이너스
drop PROCEDURE minushistory;
CREATE PROCEDURE minushistory()
BEGIN 
    declare cnt int default 1;
    here : LOOP 
       insert into pixel_history(id,pixel_log,history_date,history_detail)
        values((select id from member order by rand() limit 1),FLOOR(RAND() * 10)*-1000,
        FROM_UNIXTIME(FLOOR(unix_timestamp('2022-01-25 00:00:00')+(RAND()*(unix_timestamp('2023-01-25 00:00:00')-unix_timestamp('2022-01-25 00:00:00')))))
        ,"픽셀환전");
       IF cnt = 20000 THEN
           LEAVE here;
       END IF;
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL minushistory();
select * from pixel_history;
##픽셀히스토리 플러스
drop PROCEDURE plushistory;
CREATE PROCEDURE plushistory()
BEGIN 
    declare cnt int default 1;
    here : LOOP 
       insert into pixel_history(id,pixel_log,history_date,history_detail)
        values((select id from member order by rand() limit 1),FLOOR(RAND() * 10)*3000,
        FROM_UNIXTIME(FLOOR(unix_timestamp('2022-01-25 00:00:00')+(RAND()*(unix_timestamp('2023-01-25 00:00:00')-unix_timestamp('2022-01-25 00:00:00')))))
        ,"픽셀구매");
       IF cnt = 20000 THEN
           LEAVE here;
       END IF;
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL plushistory();

rollback;
select count(*) from pixel_history;
SHOW TABLE STATUS WHERE name = 'pixel_history';
ALTER TABLE pixel_history AUTO_INCREMENT=1;
commit;


ALTER TABLE pixel_exchange_list AUTO_INCREMENT=1;
select * from pixel_exchange_list;
delete from pixel_exchange_list;
drop PROCEDURE aaa;
CREATE PROCEDURE aaa()
BEGIN 
    declare cnt int default 0;
    here : LOOP 
       INSERT INTO pixel_exchange_list(id, apply_date, apply_pixel, pixel_exchange_status)
       VALUES( (select id from member order by rand() limit 1),
       FROM_UNIXTIME(FLOOR(unix_timestamp('2022-01-25 00:00:00')+(RAND()*(unix_timestamp('2023-01-25 00:00:00')-unix_timestamp('2022-01-25 00:00:00'))))),
        (FLOOR(RAND()*10)+1)*5000,0);
       IF cnt = 30000 THEN
           LEAVE here;
       END IF;
       SET cnt = cnt + 1;
    END LOOP;
END;
CALL aaa();
select * from pixel_exchange_list order by pixel_exchange_list_sno asc;
update pixel_exchange_list set pixel_exchange_status=0;
commit;
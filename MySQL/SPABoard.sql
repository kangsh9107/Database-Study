use mydb;

drop table board;

CREATE TABLE board(
   sno int,
   grp int,
   seq int,
   deep int,
   hit int,
   nal date,
   id varchar(30),
   subject varchar(200),
   doc longtext
);

commit;

desc board;

drop table boardAtt;
CREATE TABLE boardAtt(
   sno int,
   pSno int,
   oriFile varchar(200),
   sysFile varchar(200)
);

desc boardAtt;

drop table serial;

CREATE TABLE serial( sno int );

desc serial;

TRUNCATE board;
INSERT INTO board(sno, grp,seq, deep, hit, nal, id, doc, subject)
values(1, 1, 0, 0, 0, sysdate(), 'hong', '방가1', '제목 방가1');

INSERT INTO board(sno, grp,seq, deep, hit, nal, id, doc, subject)
values(2, 2, 0, 0, 0, sysdate(), 'hong', '방가2', '제목 방가2');
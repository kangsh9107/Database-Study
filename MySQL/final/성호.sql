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
CREATE TABLE member (
	id	varchar(255)	NOT NULL,
	pwd	varchar(255)	NULL,
	email	varchar(255)	NOT NULL,
	nickname	varchar(255)	NULL,
	gender	varchar(50)	NULL,
	age	int	NULL,
	profile_img	varchar(255)	NULL	DEFAULT 'default.png',
	account_type	int	NULL,
	ban_status	int	NULL,
	pixel	int	NULL,
	grade	int	NULL,
	join_date	date	NULL
);

INSERT INTO member(id,pwd,email,nickname,gender,age,profile_img,account_type,ban_status,pixel,grade,join_date)
values('c003','1111','ghi@naver.com','park','m','50','park.jpg',0,0,200,0,now());
SELECT * FROM member;
commit;

CREATE TABLE board (
	sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	boardtype	varchar(100)	NOT NULL,
	nal	datetime	NOT NULL	DEFAULT NOW(),
	subject	varchar(255)	NOT NULL,
	doc	longtext	NULL,
	hashtag	varchar(255)	NULL,
	viewcount	int	NULL	DEFAULT 0,
	thumbup	int	NULL	DEFAULT 0,
	thumbdown	int	NULL	DEFAULT 0
);

INSERT INTO board(sno,id,boardtype,nal,subject,doc,hashtag)
values(1,'a001','QnA',now(),'테스트입니다.','내용','#java#mysql');
SELECT * FROM board;
commit;

CREATE TABLE QnA_board (
	qna_sno	int	NOT NULL,
	sno	int	NOT NULL,
	pixel_reward	int	NOT NULL
);

INSERT INTO QnA_board(qna_sno,sno,pixel_reward)
values(1,1,2000);
SELECT * FROM QnA_board;
commit;

CREATE TABLE repl (
	repl_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	sno	int	NOT NULL,
	grp	int	NOT NULL,
	seq	int	NOT NULL	DEFAULT 0,
	deep	int	NOT NULL	DEFAULT 0,
	repl_nal	datetime	NOT NULL	DEFAULT NOW(),
	repl_doc	longtext	NOT NULL,
	thumbup	int	NULL	DEFAULT 0,
	thumbdown	int	NULL	DEFAULT 0
);

/*
sno가 1인 원본글은 a001이 작성
sno가 1인 원본글의 첫번째 리플은 b002가 작성
sno가 1인 원본글의 두번째 리플은 c003이 작성
sno가 1인 원본글의 채택댓글은 두번째 리플
*/
INSERT INTO repl(repl_sno,id,sno,grp,repl_doc)
values(1,'b002',1,1,'b002댓글');
INSERT INTO repl(repl_sno,id,sno,grp,repl_doc)
values(2,'c003',1,2,'c003댓글 채택');
INSERT INTO repl(repl_sno,id,sno,grp,seq,deep,repl_doc)
values(3,'a001',1,2,0,1,'a001 댓글에 댓글');
INSERT INTO repl(repl_sno,id,sno,grp,seq,deep,repl_doc)
values(4,'c003',1,2,1,1,'c003 댓글에 댓글');
INSERT INTO repl(repl_sno,id,sno,grp,seq,deep,repl_doc)
values(5,'a001',1,2,0,2,'a001 댓글에 댓글 멘션');
INSERT INTO repl(repl_sno,id,sno,grp,seq,deep,repl_doc)
values(6,'b002',1,1,0,1,'b002 댓글에 댓글');
SELECT * FROM repl;

CREATE TABLE repl_status (
	repl_sno	int	NOT NULL,
	repl_status	int	NOT NULL	DEFAULT 0
);

INSERT INTO repl_status(repl_sno,repl_status)
values(1,0);
INSERT INTO repl_status(repl_sno,repl_status)
values(2,1);
INSERT INTO repl_status(repl_sno,repl_status)
values(3,0);
INSERT INTO repl_status(repl_sno,repl_status)
values(4,0);
INSERT INTO repl_status(repl_sno,repl_status)
values(5,0);
INSERT INTO repl_status(repl_sno,repl_status)
values(6,0);
SELECT * FROM repl_status;

commit;

select * from repl r join repl_status rs on r.repl_sno=rs.repl_sno
order BY rs.repl_status desc, r.grp desc, r.deep asc, r.seq asc;

##채택된 경우 채택된 댓글의 grp와 동일한 grp를 갖는 대댓글 들은 repl_status=1로 UPDATE 된다.
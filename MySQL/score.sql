/* 1) SERIAL 컬럼에 PRIMARY key와 AUTO_INCREMENT 속성 추가 */
CREATE TABLE score(
	SERIAL  INT                 ,
	id      varchar(30) NOT NULL,
	SUBJECT varchar(30)         ,
	score   decimal(10, 2)      ,
	mdate   datetime
);
ALTER TABLE score ADD CONSTRAINT score_pk PRIMARY key(serial);
ALTER TABLE score MODIFY SERIAL INT auto_increment;
SET GLOBAL log_bin_trust_function_creators = 1;

/* 2) id, subject, score를 파라메터로 전달받아 score 테이블에
      INSERT 하는 함수 scoreInsert를 작성하시오.
      (단, mdate는 SQL 실행되는 시점의 시간을 사용) */
DROP FUNCTION scoreInsert;
CREATE FUNCTION scoreInsert(m_id varchar(30),
							m_subject varchar(30),
							m_score decimal(10, 2))
RETURNS varchar(10)
begin
	INSERT INTO score(id, subject, score, mdate)
		   values(m_id, m_subject, m_score, sysdate());
	RETURN 'success';
end;

SELECT scoreInsert('c001', 'math', 100);
SELECT * FROM score;

/* 3) SERIAL 번호를 파라메터로 입력받아 해당 행을 삭제하는
      함수 scoreDelete를 작성 하시오. */
DROP FUNCTION scoreDelete;
CREATE FUNCTION scoreDelete(m_serial int)
RETURNS varchar(10)
begin
	DELETE FROM score WHERE SERIAL = m_serial;
	RETURN 'success';
end;

SELECT scoreDelete(1);
SELECT * FROM score;

/* 4) serial, id, subject, score를 파라메터로 전달 받아 serial에
      해당하는 값을 파라메터로 수정하는 함수 scoreUpdae를 작성 하시오. */
DROP FUNCTION scoreUpdate;
CREATE FUNCTION scoreUpdate(m_serial int,
							m_id varchar(30),
							m_subject varchar(30),
							m_score decimal(10, 2))
RETURNS varchar(10)
begin
	UPDATE score SET id = m_id,
					 SUBJECT = m_subject,
		   			 score = m_score
	WHERE SERIAL = m_id;
	RETURN 'success';
end;

SELECT scoreUpdate(1, 'b001', 'eng', 100);
SELECT * FROM score;

/* 5) id를 파라메터로 전달받아 해당 성적 정보를 출력하는
      프로시져 scoreList를 작성하시오. */
/* SELECT 자체는 묵시적 커서라서 변수에 담아서
   셀렉트를 다시 해줘야 화면에 보임 */
DROP PROCEDURE scoreList;
CREATE PROCEDURE scoreList(m_serial int)
begin
	DECLARE m_id varchar(30);
	DECLARE m_subject varchar(30);
	DECLARE m_score decimal(10, 2);
	DECLARE m_date datetime;

	SELECT id, subject, score, mdate
	INTO m_id, m_subject, m_score, m_date
	FROM score
	WHERE SERIAL = m_serial;
	
	SELECT m_serial, m_id, m_subject, m_score, m_date;
end;

CALL scoreList(1);
SELECT * FROM score;









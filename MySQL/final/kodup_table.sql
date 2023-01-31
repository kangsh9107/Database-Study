DROP DATABASE kodup;
CREATE DATABASE kodup;
USE kodup;



## 테이블
CREATE TABLE `member` (
	`id`	varchar(255)	NOT NULL,
	`pwd`	varchar(255)	NULL,
	`email`	varchar(255)	NOT NULL,
	`nickname`	varchar(255)	NOT NULL,
	`gender`	varchar(50)	NOT NULL,
	`age`	int	NOT NULL,
	`profile_img`	varchar(255)	NOT NULL	DEFAULT 'default.png',
	`account_type`	int	NOT NULL	DEFAULT 0,
	`ban_status`	int	NOT NULL	DEFAULT 0,
	`pixel`	int	NOT NULL	DEFAULT 0,
	`grade`	int	NOT NULL	DEFAULT 0,
	`join_date`	datetime	NOT NULL	DEFAULT NOW(),
	`email_status`	int	NOT NULL	DEFAULT 0,
	`mento_status`	int	NOT NULL	DEFAULT 0,
	`corp_status`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `board` (
	`sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`boardtype`	varchar(100)	NOT NULL,
	`nal`	datetime	NOT NULL	DEFAULT NOW(),
	`subject`	varchar(255)	NOT NULL,
	`doc`	longtext	NOT NULL,
	`hashtag`	varchar(255)	NULL,
	`viewcount`	int	NOT NULL	DEFAULT 0,
	`thumbup`	int	NOT NULL	DEFAULT 0,
	`thumbdown`	int	NOT NULL	DEFAULT 0,
	`board_delete`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `qna_board` (
	`qna_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`qna_pixel_reward`	int	NOT NULL,
	`qna_horsehead`	varchar(255)	NOT NULL,
	`qna_status`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `mansearch_board` (
	`mansearch_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`work_start`	date	NOT NULL,
	`pay`	int	NOT NULL,
	`corp_location`	varchar(255)	NOT NULL,
	`position`	varchar(100)	NOT NULL,
	`job_type`	varchar(100)	NOT NULL,
	`required_career`	varchar(100)	NOT NULL,
	`education_level`	varchar(255)	NOT NULL,
	`work_type`	varchar(255)	NOT NULL,
	`pay_date`	varchar(255)	NOT NULL,
	`required_skill`	varchar(255)	NOT NULL,
	`deadline`	date	NOT NULL,
	`main_task`	varchar(255)	NOT NULL,
	`sub_task`	varchar(255)	NOT NULL
);

CREATE TABLE `freetalking_board` (
	`freetalking_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`freetalking_horsehead`	varchar(255)	NOT NULL
);

CREATE TABLE `corperation` (
	`id`	varchar(255)	NOT NULL,
	`corp_license`	varchar(255)	NOT NULL,
	`corp_logo`	varchar(255)	NOT NULL,
	`corp_name`	varchar(255)	NOT NULL,
	`corp_phone`	varchar(255)	NOT NULL,
	`corp_email`	varchar(255)	NOT NULL,
	`manager_name`	varchar(255)	NOT NULL,
	`manager_phone`	varchar(255)	NOT NULL,
	`manager_email`	varchar(255)	NOT NULL
);

CREATE TABLE `member_introduce` (
	`id`	varchar(255)	NOT NULL,
	`introduce`	longtext	NULL
);

CREATE TABLE `repl` (
	`repl_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`sno`	int	NOT NULL,
	`grp`	int	NOT NULL	DEFAULT 0,
	`seq`	int	NOT NULL	DEFAULT 0,
	`deep`	int	NOT NULL	DEFAULT 0,
	`repl_nal`	datetime	NOT NULL	DEFAULT NOW(),
	`repl_doc`	longtext	NOT NULL,
	`thumbup`	int	NOT NULL	DEFAULT 0,
	`thumbdown`	int	NOT NULL	DEFAULT 0,
	`repl_delete`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `repl_selected` (
	`repl_sno`	int	NOT NULL,
	`repl_status`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `premium_review` (
	`premium_review_sno`	int	NOT NULL,
	`mansearch_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`review`	longtext	NOT NULL
);

CREATE TABLE `premium_review_buylist` (
	`id`	varchar(255)	NOT NULL,
	`premium_review_sno`	int	NOT NULL
);

CREATE TABLE `infoshare_board` (
	`infoshare_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`infoshare_horsehead`	varchar(255)	NOT NULL
);

CREATE TABLE `pixel_exchange_rate` (
	`normal`	decimal(10,2)	NOT NULL,
	`personal`	decimal(10,2)	NOT NULL,
	`plus`	decimal(10,2)	NOT NULL,
	`partner`	decimal(10,2)	NOT NULL
);

CREATE TABLE `pixel_price` (
	`pixel_1_price`	int	NOT NULL	DEFAULT 1000,
	`pixel_1_amount`	int	NOT NULL	DEFAULT 100,
	`pixel_2_price`	int	NOT NULL	DEFAULT 2700,
	`pixel_2_amount`	int	NOT NULL	DEFAULT 300,
	`pixel_3_price`	int	NOT NULL	DEFAULT 4500,
	`pixel_3_amount`	int	NOT NULL	DEFAULT 500,
	`pixel_4_price`	int	NOT NULL	DEFAULT 9000,
	`pixel_4_amount`	int	NOT NULL	DEFAULT 1000,
	`pixel_5_price`	int	NOT NULL	DEFAULT 27000,
	`pixel_5_amount`	int	NOT NULL	DEFAULT 3000,
	`pixel_6_price`	int	NOT NULL	DEFAULT 45000,
	`pixel_6_amount`	int	NOT NULL	DEFAULT 5000
);
INSERT INTO pixel_price VALUES(1000,100,2700,300,4500,500,9000,1000,27000,3000,45000,5000);

CREATE TABLE `notification_board` (
	`notification_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`notification_horsehead`	varchar(255)	NOT NULL
);

CREATE TABLE `jobsearch_board` (
	`jobsearch_sno`	int	NOT NULL,
	`sno`	int	NOT NULL,
	`jobsearch_horsehead`	varchar(255)	NOT NULL
);

CREATE TABLE `bank` (
	`bank_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`bank_name`	varchar(255)	NOT NULL,
	`account_holder`	varchar(255)	NOT NULL,
	`account`	varchar(255)	NOT NULL
);

CREATE TABLE `pixel_history` (
	`pixel_history_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`pixel_log`	int	NOT NULL,
	`history_date`	datetime	NOT NULL	DEFAULT NOW(),
	`history_detail`	varchar(255)	NOT NULL
);

CREATE TABLE `pixel_exchange_list` (
	`pixel_exchange_list_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`apply_date`	datetime	NOT NULL	DEFAULT NOW(),
	`apply_pixel`	int	NOT NULL,
	`pixel_exchange_status`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `pixel_buy_list` (
	`id`	varchar(255)	NOT NULL,
	`pixel_buy_date`	datetime	NOT NULL	DEFAULT NOW(),
	`pixel_buy_amount`	int	NOT NULL
);

CREATE TABLE `chat` (
	`chat_sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`chat_status`	int	NOT NULL	DEFAULT 0,
	`grade`	int	NOT NULL	DEFAULT 0
);

CREATE TABLE `career_certification` (
	`id`	varchar(255)	NOT NULL,
	`career_certificate`	varchar(255)	NOT NULL
);

CREATE TABLE `ban_history` (
	`id`	varchar(255)	NOT NULL,
	`ban_number`	int	NOT NULL	DEFAULT 0,
	`ban_date`	datetime	NOT NULL	DEFAULT NOW()
);

CREATE TABLE `mantoman_att` (
	`roomCode`	varchar(255)	NOT NULL,
	`sysfile`	varchar(255)	NOT NULL
);

CREATE TABLE `mantoman` (
	`roomCode`	varchar(255)	NOT NULL,
	`id`	varchar(255)	NOT NULL,
	`your_id`	varchar(255)	NOT NULL
);

CREATE TABLE `mantoman_room` (
	`roomCode`	varchar(255)	NOT NULL,
	`doc`	longtext,
	`last_talktime`	datetime	NOT NULL	DEFAULT NOW(),
	`last_talk`	varchar(255),
	`mantoman_pixel_reward`	int	NOT NULL
);

CREATE TABLE `view_board` (
	`sno`	int	NOT NULL,
	`id`	varchar(255)	NOT NULL
);

CREATE TABLE `kodupbudget` (
	`budget`	int	NULL
);
INSERT INTO kodupbudget VALUE(900000000);

CREATE TABLE `countvisitors` (
	`id`	varchar(255)	NOT NULL,
	`nal`	datetime	NULL
);

CREATE TABLE `certification_date` (
	`id`	varchar(255)	NOT NULL,
	`certification_category`	varchar(255)	NOT NULL,
	`apply_date`	datetime	NOT NULL	DEFAULT NOW()
);




## 프라이머리키
ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`sno`
);

ALTER TABLE `qna_board` ADD CONSTRAINT `PK_QNA_BOARD` PRIMARY KEY (
	`qna_sno`
);

ALTER TABLE `mansearch_board` ADD CONSTRAINT `PK_MANSEARCH_BOARD` PRIMARY KEY (
	`mansearch_sno`
);

ALTER TABLE `freetalking_board` ADD CONSTRAINT `PK_FREETALKING_BOARD` PRIMARY KEY (
	`freetalking_sno`
);

ALTER TABLE `repl` ADD CONSTRAINT `PK_REPL` PRIMARY KEY (
	`repl_sno`
);

ALTER TABLE `premium_review` ADD CONSTRAINT `PK_PREMIUM_REVIEW` PRIMARY KEY (
	`premium_review_sno`
);

ALTER TABLE `infoshare_board` ADD CONSTRAINT `PK_INFOSHARE_BOARD` PRIMARY KEY (
	`infoshare_sno`
);

ALTER TABLE `notification_board` ADD CONSTRAINT `PK_NOTIFICATION_BOARD` PRIMARY KEY (
	`notification_sno`
);

ALTER TABLE `jobsearch_board` ADD CONSTRAINT `PK_JOBSEARCH_BOARD` PRIMARY KEY (
	`jobsearch_sno`
);

ALTER TABLE `bank` ADD CONSTRAINT `PK_BANK` PRIMARY KEY (
	`bank_sno`
);

ALTER TABLE `pixel_history` ADD CONSTRAINT `PK_PIXEL_HISTORY` PRIMARY KEY (
	`pixel_history_sno`
);

ALTER TABLE `pixel_exchange_list` ADD CONSTRAINT `PK_PIXEL_EXCHANGE_LIST` PRIMARY KEY (
	`pixel_exchange_list_sno`
);

ALTER TABLE `chat` ADD CONSTRAINT `PK_CHAT` PRIMARY KEY (
	`chat_sno`
);

ALTER TABLE `mantoman_room` ADD CONSTRAINT `PK_MANTOMAN_ROOM` PRIMARY KEY (
	`roomCode`
);



## 오토인크리먼트
ALTER TABLE repl MODIFY repl_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE qna_board MODIFY qna_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE freetalking_board MODIFY freetalking_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE infoshare_board MODIFY infoshare_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE jobsearch_board MODIFY jobsearch_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE notification_board MODIFY notification_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE board MODIFY sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE mansearch_board MODIFY mansearch_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE premium_review MODIFY premium_review_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE chat MODIFY chat_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pixel_exchange_list MODIFY pixel_exchange_list_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pixel_history MODIFY pixel_history_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE bank MODIFY bank_sno INT NOT NULL AUTO_INCREMENT;



## 포린키
ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `qna_board` ADD CONSTRAINT `FK_board_TO_qna_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `mansearch_board` ADD CONSTRAINT `FK_board_TO_mansearch_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `freetalking_board` ADD CONSTRAINT `FK_board_TO_freetalking_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `corperation` ADD CONSTRAINT `FK_member_TO_corperation_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `member_introduce` ADD CONSTRAINT `FK_member_TO_member_introduce_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `repl` ADD CONSTRAINT `FK_member_TO_repl_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `repl` ADD CONSTRAINT `FK_board_TO_repl_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `repl_selected` ADD CONSTRAINT `FK_repl_TO_repl_selected_1` FOREIGN KEY (
	`repl_sno`
)
REFERENCES `repl` (
	`repl_sno`
);

ALTER TABLE `premium_review` ADD CONSTRAINT `FK_mansearch_board_TO_premium_review_1` FOREIGN KEY (
	`mansearch_sno`
)
REFERENCES `mansearch_board` (
	`mansearch_sno`
);

ALTER TABLE `premium_review` ADD CONSTRAINT `FK_member_TO_premium_review_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `premium_review_buylist` ADD CONSTRAINT `FK_member_TO_premium_review_buylist_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `premium_review_buylist` ADD CONSTRAINT `FK_premium_review_TO_premium_review_buylist_1` FOREIGN KEY (
	`premium_review_sno`
)
REFERENCES `premium_review` (
	`premium_review_sno`
);

ALTER TABLE `infoshare_board` ADD CONSTRAINT `FK_board_TO_infoshare_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `notification_board` ADD CONSTRAINT `FK_board_TO_notification_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `jobsearch_board` ADD CONSTRAINT `FK_board_TO_jobsearch_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `bank` ADD CONSTRAINT `FK_member_TO_bank_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `pixel_history` ADD CONSTRAINT `FK_member_TO_pixel_history_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `pixel_exchange_list` ADD CONSTRAINT `FK_member_TO_pixel_exchange_list_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `pixel_buy_list` ADD CONSTRAINT `FK_member_TO_pixel_buy_list_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `chat` ADD CONSTRAINT `FK_member_TO_chat_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `career_certification` ADD CONSTRAINT `FK_member_TO_career_certification_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `ban_history` ADD CONSTRAINT `FK_member_TO_ban_history_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `mantoman_att` ADD CONSTRAINT `FK_mantoman_room_TO_mantoman_att_1` FOREIGN KEY (
	`roomCode`
)
REFERENCES `mantoman_room` (
	`roomCode`
);

ALTER TABLE `mantoman` ADD CONSTRAINT `FK_mantoman_room_TO_mantoman_1` FOREIGN KEY (
	`roomCode`
)
REFERENCES `mantoman_room` (
	`roomCode`
);

ALTER TABLE `mantoman` ADD CONSTRAINT `FK_member_TO_mantoman_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `view_board` ADD CONSTRAINT `FK_board_TO_view_board_1` FOREIGN KEY (
	`sno`
)
REFERENCES `board` (
	`sno`
);

ALTER TABLE `view_board` ADD CONSTRAINT `FK_board_TO_view_board_2` FOREIGN KEY (
	`id`
)
REFERENCES `board` (
	`id`
);

ALTER TABLE `countvisitors` ADD CONSTRAINT `FK_member_TO_countvisitors_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `certification_date` ADD CONSTRAINT `FK_member_TO_certification_date_1` FOREIGN KEY (
	`id`
)
REFERENCES `member` (
	`id`
);



## 유니크
ALTER TABLE member ADD CONSTRAINT `UQ_member_email` UNIQUE(email);
ALTER TABLE member ADD CONSTRAINT `UQ_member_nickname` UNIQUE(nickname);
ALTER TABLE bank ADD CONSTRAINT `UQ_bank_account` UNIQUE(account);
ALTER TABLE chat ADD CONSTRAINT `UQ_chat_id` UNIQUE(id);

## 댓글오류 수정
DELETE FROM repl_selected;
DELETE FROM repl;
COMMIT;

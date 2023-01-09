# SET GLOBAL log_bin_trust_function_creators = 1;

#DROP DATABASE kodup;
#CREATE DATABASE kodup;
#USE kodup;

CREATE TABLE member (
	id	varchar(255)	NOT NULL,
	pwd	varchar(255)	NULL,
	email	varchar(255)	NOT NULL,
	nickname	varchar(255)	NULL,
	gender	varchar(50)	NULL,
	age	int	NULL,
	profile_img	varchar(255)	NOT NULL	DEFAULT 'default.png',
	account_type	int	NULL,
	ban_status	int	NOT NULL	DEFAULT 0,
	pixel	int	NOT NULL	DEFAULT 0,
	grade	varchar(255)	NOT NULL	DEFAULT 'normal',
	join_date	date	NULL,
	email_status	int	NOT NULL	DEFAULT 0,
	mento_status	int	NOT NULL	DEFAULT 0
);

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

CREATE TABLE QnA_board (
	qna_sno	int	NOT NULL,
	sno	int	NOT NULL,
	qna_pixel_reward	int	NOT NULL,
	qna_horsehead	varchar(255)	NOT NULL
);

CREATE TABLE board_att (
	board_att_sno	int	NOT NULL,
	sno	int	NOT NULL,
	sysfile	varchar(255)	NULL,
	orifile	varchar(255)	NULL
);

CREATE TABLE mansearch_board (
	mansearch_sno	int	NOT NULL,
	sno	int	NOT NULL,
	work_start	date	NOT NULL,
	pay	int	NOT NULL,
	corp_location	varchar(255)	NOT NULL,
	position	varchar(100)	NULL,
	job_type	varchar(100)	NULL,
	required_career	varchar(100)	NULL,
	education_level	varchar(255)	NULL,
	work_type	varchar(255)	NULL,
	pay_date	varchar(255)	NULL,
	required_skill	varchar(255)	NULL,
	deadline	date	NULL
);

ALTER TABLE member ADD corp_status INT NOT NULL;
ALTER TABLE member MODIFY corp_status INT DEFAULT 0;
ALTER TABLE mansearch_board ADD main_task VARCHAR(255);
ALTER TABLE mansearch_board ADD sub_task VARCHAR(255);

CREATE TABLE freetalking_board (
	freetalking_sno	int	NOT NULL,
	sno	int	NOT NULL,
	freetalking_horsehead	varchar(255)	NOT NULL
);

CREATE TABLE corperation (
	id	varchar(255)	NOT NULL,
	corp_license	varchar(255)	NOT NULL,
	corp_logo	varchar(255)	NOT NULL,
	corp_name	varchar(255)	NOT NULL,
	corp_phone	varchar(255)	NOT NULL,
	corp_email	varchar(255)	NOT NULL,
	manager_name	varchar(255)	NOT NULL,
	manager_phone	varchar(255)	NOT NULL,
	manager_email	varchar(255)	NOT NULL
);

CREATE TABLE member_introduce (
	id	varchar(255)	NOT NULL,
	introduce	longtext	NULL
);

CREATE TABLE repl (
	repl_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	sno	int	NOT NULL,
	grp	int	NOT NULL	DEFAULT 0,
	seq	int	NOT NULL	DEFAULT 0,
	deep	int	NOT NULL	DEFAULT 0,
	repl_nal	datetime	NOT NULL	DEFAULT NOW(),
	repl_doc	longtext	NOT NULL,
	thumbup	int	NULL	DEFAULT 0,
	thumbdown	int	NULL	DEFAULT 0
);

CREATE TABLE repl_selected (
	repl_sno	int	NOT NULL,
	repl_status	int	NOT NULL	DEFAULT 0
);

CREATE TABLE premium_review (
	premium_review_sno	int	NOT NULL,
	mansearch_sno	int	NOT NULL,
	review	longtext	NULL
);

CREATE TABLE premium_review_buylist (
	id	varchar(255)	NOT NULL,
	review_sno	int	NULL
);

CREATE TABLE infoshare_board (
	infoshare_sno	int	NOT NULL,
	sno	int	NOT NULL,
	infoshare_horsehead	varchar(255)	NOT NULL
);

CREATE TABLE pixel_exchange_rate (
	normal	decimal(10,2)	NULL,
	personal	decimal(10,2)	NULL,
	plus	decimal(10,2)	NULL,
	partner	decimal(10,2)	NULL
);

CREATE TABLE mantoman (
	mantoman_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	your_id	varchar(255)	NOT NULL,
	docfile	varchar(255)	NULL,
	filetime	datetime	NOT NULL	DEFAULT NOW(),
	mantoman_pixel_reward	int	NOT NULL
);

CREATE TABLE pixel_price (
	pixel_1_price	int	NULL,
	pixel_1_amount	int	NULL,
	pixel_2_price	int	NULL,
	pixel_2_amount	int	NULL,
	pixel_3_price	int	NULL,
	pixel_3_amount	int	NULL,
	pixel_4_price	int	NULL,
	pixel_4_amount	int	NULL,
	pixel_5_price	int	NULL,
	pixel_5_amount	int	NULL,
	pixel_6_price	int	NULL,
	pixel_6_amount	int	NULL
);

CREATE TABLE mantoman_att (
	mantoman_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	sysfile	varchar(255)	NULL,
	orifile	varchar(255)	NULL
);

CREATE TABLE notification_board (
	notification_sno	int	NOT NULL,
	sno	int	NOT NULL,
	notification_horsehead	varchar(255)	NOT NULL
);

CREATE TABLE jobsearch_board (
	jobsearch_sno	int	NOT NULL,
	sno	int	NOT NULL,
	jobsearch_horsehead	varchar(255)	NOT NULL
);

CREATE TABLE bank (
	bank_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	bank_name	varchar(255)	NOT NULL,
	account_holder	varchar(255)	NOT NULL,
	account	varchar(255)	NOT NULL
);

CREATE TABLE pixel_history (
	pixel_history_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	pixel_log	int	NULL,
	history_date	datetime	NOT NULL	DEFAULT NOW()
);

CREATE TABLE pixel_exchange_list (
	pixel_exchange_list_sno	int	NOT NULL,
	id	varchar(255)	NOT NULL,
	apply_date	datetime	NOT NULL	DEFAULT NOW(),
	apply_pixel	int	NOT NULL,
	pixel_exchange_status	int	NOT NULL	DEFAULT 0
);

CREATE TABLE pixel_buy_list (
	id	varchar(255)	NOT NULL,
	pixel_buy_date	datetime	NOT NULL	DEFAULT NOW(),
	pixel_buy_amount	int	NOT NULL
);



ALTER TABLE member ADD CONSTRAINT PK_MEMBER PRIMARY KEY (
	id
);

ALTER TABLE board ADD CONSTRAINT PK_BOARD PRIMARY KEY (
	sno
);

ALTER TABLE QnA_board ADD CONSTRAINT PK_QNA_BOARD PRIMARY KEY (
	qna_sno
);

ALTER TABLE board_att ADD CONSTRAINT PK_BOARD_ATT PRIMARY KEY (
	board_att_sno
);

ALTER TABLE mansearch_board ADD CONSTRAINT PK_MANSEARCH_BOARD PRIMARY KEY (
	mansearch_sno
);

ALTER TABLE freetalking_board ADD CONSTRAINT PK_FREETALKING_BOARD PRIMARY KEY (
	freetalking_sno
);

ALTER TABLE repl ADD CONSTRAINT PK_REPL PRIMARY KEY (
	repl_sno
);

ALTER TABLE premium_review ADD CONSTRAINT PK_PREMIUM_REVIEW PRIMARY KEY (
	premium_review_sno
);

ALTER TABLE premium_review_buylist ADD CONSTRAINT PK_PREMIUM_REVIEW_BUYLIST PRIMARY KEY (
	review_sno
);

ALTER TABLE infoshare_board ADD CONSTRAINT PK_INFOSHARE_BOARD PRIMARY KEY (
	infoshare_sno
);

ALTER TABLE mantoman ADD CONSTRAINT PK_MANTOMAN PRIMARY KEY (
	mantoman_sno
);

ALTER TABLE mantoman_att ADD CONSTRAINT PK_MANTOMAN_ATT PRIMARY KEY (
	mantoman_sno
);

ALTER TABLE notification_board ADD CONSTRAINT PK_NOTIFICATION_BOARD PRIMARY KEY (
	notification_sno
);

ALTER TABLE jobsearch_board ADD CONSTRAINT PK_JOBSEARCH_BOARD PRIMARY KEY (
	jobsearch_sno
);

ALTER TABLE bank ADD CONSTRAINT PK_BANK PRIMARY KEY (
	bank_sno
);

ALTER TABLE pixel_history ADD CONSTRAINT PK_PIXEL_HISTORY PRIMARY KEY (
	pixel_history_sno
);

ALTER TABLE pixel_exchange_list ADD CONSTRAINT PK_PIXEL_EXCHANGE_LIST PRIMARY KEY (
	pixel_exchange_list_sno
);



ALTER TABLE notification_board MODIFY notification_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE QnA_board MODIFY qna_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE freetalking_board MODIFY freetalking_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE repl MODIFY repl_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE mansearch_board MODIFY mansearch_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE jobsearch_board MODIFY jobsearch_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE premium_review MODIFY premium_review_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pixel_history MODIFY  pixel_history_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE pixel_exchange_list MODIFY pixel_exchange_list_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE mantoman MODIFY mantoman_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE bank MODIFY bank_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE board_att MODIFY board_att_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE infoshare_board MODIFY infoshare_sno INT NOT NULL AUTO_INCREMENT;
ALTER TABLE board MODIFY sno INT NOT NULL AUTO_INCREMENT;



ALTER TABLE board ADD CONSTRAINT FK_member_TO_board_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE QnA_board ADD CONSTRAINT FK_board_TO_QnA_board_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE board_att ADD CONSTRAINT FK_board_TO_board_att_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE mansearch_board ADD CONSTRAINT FK_board_TO_mansearch_board_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE freetalking_board ADD CONSTRAINT FK_board_TO_freetalking_board_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE corperation ADD CONSTRAINT FK_member_TO_corperation_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE member_introduce ADD CONSTRAINT FK_member_TO_member_introduce_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE repl ADD CONSTRAINT FK_member_TO_repl_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE repl ADD CONSTRAINT FK_board_TO_repl_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE repl_selected ADD CONSTRAINT FK_repl_TO_repl_selected_1 FOREIGN KEY (
	repl_sno
)
REFERENCES repl (
	repl_sno
);

ALTER TABLE premium_review ADD CONSTRAINT FK_mansearch_board_TO_premium_review_1 FOREIGN KEY (
	mansearch_sno
)
REFERENCES mansearch_board (
	mansearch_sno
);

ALTER TABLE premium_review_buylist ADD CONSTRAINT FK_member_TO_premium_review_buylist_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE premium_review_buylist ADD CONSTRAINT FK_premium_review_TO_premium_review_buylist_1 FOREIGN KEY (
	review_sno
)
REFERENCES premium_review (
	premium_review_sno
);

ALTER TABLE infoshare_board ADD CONSTRAINT FK_board_TO_infoshare_board_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE mantoman ADD CONSTRAINT FK_member_TO_mantoman_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE mantoman_att ADD CONSTRAINT FK_mantoman_TO_mantoman_att_1 FOREIGN KEY (
	mantoman_sno
)
REFERENCES mantoman (
	mantoman_sno
);

ALTER TABLE mantoman_att ADD CONSTRAINT FK_mantoman_TO_mantoman_att_2 FOREIGN KEY (
	id
)
REFERENCES mantoman (
	id
);

ALTER TABLE notification_board ADD CONSTRAINT FK_board_TO_notification_board_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE jobsearch_board ADD CONSTRAINT FK_board_TO_jobsearch_board_1 FOREIGN KEY (
	sno
)
REFERENCES board (
	sno
);

ALTER TABLE bank ADD CONSTRAINT FK_member_TO_bank_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE pixel_history ADD CONSTRAINT FK_member_TO_pixel_history_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE pixel_exchange_list ADD CONSTRAINT FK_member_TO_pixel_exchange_list_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

ALTER TABLE pixel_buy_list ADD CONSTRAINT FK_member_TO_pixel_buy_list_1 FOREIGN KEY (
	id
)
REFERENCES member (
	id
);

COMMIT;

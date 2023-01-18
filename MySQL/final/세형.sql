

ALTER TABLE mantoman CHANGE docfile doc LONGTEXT; 

ALTER TABLE mantoman CHANGE filetime last_talktime DATETIME;

ALTER TABLE mantoman ADD last_talk LONGTEXT NULL;

ALTER TABLE mantoman ADD roomCode varchar(255) NOT NULL;

DESC mantoman;

DESC mantoman_att;

select * from mantoman;


DELETE FROM mantoman;

ALTER TABLE mantoman AUTO_INCREMENT=1;

DROP TABLE mantoman_att;

CREATE TABLE `mantoman_att` (
   `roomCode`   varchar(255)   NOT NULL,
   `file_sno`   int   NOT NULL,
   `sysfile`   varchar(255)   NOT NULL,
   `orifile`   varchar(255)   NOT NULL
);

commit;
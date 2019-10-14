/* 예약가능날짜 */
DROP TABLE monthSchedule 
	CASCADE CONSTRAINTS;

/* 예약가능날짜 */
CREATE TABLE monthSchedule (
	addDate DATE NOT NULL, /* 예약가능날짜추가 */
	shopNum NUMBER /* 샵넘버 */
);

ALTER TABLE monthSchedule
	ADD
		CONSTRAINT PK_monthSchedule
		PRIMARY KEY (
			addDate
		);

ALTER TABLE monthSchedule
	ADD
		CONSTRAINT FK_shopInfo_TO_monthSchedule
		FOREIGN KEY (
			shopNum
		)
		REFERENCES shopInfo (
			shopNum
		);




/* 예약가능시간 */
DROP TABLE timeSchedule 
	CASCADE CONSTRAINTS;

/* 예약가능시간 */
CREATE TABLE timeSchedule (
	shopNum NUMBER, /* 샵넘버 */
	addDate DATE, /* 예약가능날짜추가 */
	startTime DATE NOT NULL, /* 예약가능시간시작 */
	endTime DATE NOT NULL, /* 예약마감시간 */
	arranged NUMBER NOT NULL /* 예약여부 */
);

ALTER TABLE timeSchedule
	ADD
		CONSTRAINT FK_shopInfo_TO_timeSchedule
		FOREIGN KEY (
			shopNum
		)
		REFERENCES shopInfo (
			shopNum
		);

ALTER TABLE timeSchedule
	ADD
		CONSTRAINT FK_monthScheduleToTimeSchedule
		FOREIGN KEY (
			addDate
		)
		REFERENCES monthSchedule (
			addDate
		);
		
		
select * from shopInfo;
insert into monthSchedule(addDate, shopNum) values ('2019-10-14', 10);
select * from monthSchedule;   
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (10, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (10, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);


select info.shopName, info.shopIntro from
        (select shopNum 
         from timeSchedule 
         where (startTime between to_date('2019-10-14 12:00','yyyy-mm-dd hh24:mi') and to_date('2019-10-14 12:00','yyyy-mm-dd hh24:mi')+29/(24*60))
         and arranged=1) time join (select shopNum,shopName,shopIntro from shopInfo where shopAddr LIKE '%서초구%') info on time.shopNum=info.shopNum
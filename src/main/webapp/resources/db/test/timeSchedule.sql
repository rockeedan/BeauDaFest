/* 예약가능날짜 */
DROP TABLE monthSchedule 
	CASCADE CONSTRAINTS;

/* 예약가능날짜 */
CREATE TABLE monthSchedule (
	addDate DATE NOT NULL, /* 예약가능날짜추가 */
	shopNum NUMBER NOT NULL /* 샵넘버 */
);

ALTER TABLE monthSchedule
	ADD
		CONSTRAINT PK_monthSchedule
		PRIMARY KEY (
			addDate,
			shopNum
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
			addDate,
			shopNum
		)
		REFERENCES monthSchedule (
			addDate,
			shopNum
		);
		
		
select * from shopInfo;
insert into monthSchedule(addDate, shopNum) values ('2019-10-14', 1);
insert into monthSchedule(addDate, shopNum) values ('2019-10-14', 2);
insert into monthSchedule(addDate, shopNum) values ('2019-10-14', 3);

select * from monthSchedule;
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);


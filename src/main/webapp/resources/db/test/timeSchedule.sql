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

select * from timeSchedule where shopNum=1;
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-10-14', to_date('2019-10-14 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:59', 'yyyy-MM-dd hh24-mi'), 1);


select
	CASE (select count(*) from timeSchedule t2 where startTime between t1.startTime and t1.startTime+(60-1)/(24*60)) when 60/30 then '예약가능' else '예약불가' end as title,
	to_char(startTime,'YYYY-MM-DD"T"HH24:MI') as "start",to_char(endTime,'YYYY-MM-DD"T"HH24:MI') as "end"
	from timeSchedule t1 where shopNum=1;

select
	(select count(*) from timeSchedule t2 where shopNum=1 and startTime between t1.startTime and t1.startTime+(60-1)/(24*60)),
	to_char(startTime,'YYYY-MM-DD"T"HH24:MI') as "start",to_char(endTime,'YYYY-MM-DD"T"HH24:MI') as "end",
	t1.startTime+(60-1)/(24*60)
	from timeSchedule t1 where shopNum=1;
	
select count(*) from timeSchedule t2 where startTime between t2.startTime and t2.startTime+(60-1)/(24*60);
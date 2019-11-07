/* memberList */
/* 멤버리스트 */
--일반회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gosolb','고솔비','1234qwer','gosolb@gmail.com','010-1234-5678',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gildong','길동','1234qwer','gildong@gmail.com','010-1111-2222',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('lime','라임','1234qwer','lime@gmail.com','010-3333-4444',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('ddoock','뚝딱이','1234qwer','ddoock@gmail.com','010-4444-5555',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('thunder','번개맨','1234qwer','thunder@gmail.com','010-1212-2323',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('bboong','뿡뿡이','1234qwer','bboong@gmail.com','010-1313-2424',0);
--오너회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('juwon','주원','1234qwer','juwon@gmail.com','010-5555-6666',1);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('yoosin','유신','1234qwer','yoosin@gmail.com','010-4444-2222',1);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gamchan','감찬','1234qwer','gamchan@gmail.com','010-9999-1111',1);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('pengsu','펭수','1234qwer','pengsu@gmail.com','010-5555-8888',1);


/*shopInfo*/
/* 샵정보 */
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','첫번째주원샵','02-5555-6666','서울시|서초구|서초동|12번지','11:00','20:00', '월,화','2019/10/14/uuid_2019846505481.png','첫번째주원샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','두번째주원샵','02-5555-6667','서울시|서초구|서초동|13번지','12:00','18:00', '월,화','2019/10/14/uuid_2019846505481.png','두번째주원샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'pengsu','펭수샵','02-5555-8888','서울시|서초구|서초2동|13번지','10:30','19:30', '월,수', '2019/10/14/uuid_2019846722751.jpg','펭펭펭',0,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'yoosin','유신샵','02-4444-2222','서울시|강남구|강남동|11번지','09:30','20:00', '목,금','2019/10/14/uuid_cute.jpg','유신샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'gamchan','감찬샵','02-9999-1111','서울시|마포구|마포동|13번지','10:00','18:30', '일', '2019/10/14/uuid_2019846722751.jpg','감찬샵입니다.',0,'취소정책');



/* monthSchedule */
/* 예약가능날짜 */
/* timeSchedule */
/* 예약가능시간 */
insert into monthSchedule(addDate, shopNum) values ('2019-11-02', 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 11:59', 'yyyy-MM-dd hh24-mi'), 0); --solbi
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 12:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 12:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-02', to_date('2019-11-02 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-02 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-03', 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 11:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 12:59', 'yyyy-MM-dd hh24-mi'), 0); --gildong
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 13:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 13:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-03', to_date('2019-11-03 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-21', 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 11:59', 'yyyy-MM-dd hh24-mi'), 0); --thunder
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 12:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-21', to_date('2019-11-21 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-22', 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 11:59', 'yyyy-MM-dd hh24-mi'), 0); --ddock
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 12:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 12:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 13:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-22', to_date('2019-11-22 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 14:59', 'yyyy-MM-dd hh24-mi'), 1);

insert into monthSchedule(addDate, shopNum) values ('2019-11-03', 2);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 12:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 12:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 14:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 14:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 15:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 15:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-03', to_date('2019-11-03 15:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 15:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into monthSchedule(addDate, shopNum) values ('2019-11-21', 2);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-21', to_date('2019-11-21 15:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 15:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-22', 2);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 15:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 15:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (2, '2019-11-22', to_date('2019-11-22 15:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 15:59', 'yyyy-MM-dd hh24-mi'), 1);

insert into monthSchedule(addDate, shopNum) values ('2019-11-03', 3);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 10:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 10:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 11:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 14:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-03', to_date('2019-11-03 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-03 14:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into monthSchedule(addDate, shopNum) values ('2019-11-21', 3);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 10:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 10:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 11:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 12:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 12:59', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 13:29', 'yyyy-MM-dd hh24-mi'), 0);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-21', to_date('2019-11-21 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-21 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-22', 3);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 10:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 10:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 11:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (3, '2019-11-22', to_date('2019-11-22 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-22 14:59', 'yyyy-MM-dd hh24-mi'), 1);


/* 샵디자인 */
/* 샵디자인 */
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '원컬러 젤네일1', '네일', 'ND', 40000, 60, '사진1'); 
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '포인트 젤네일1', '네일', 'ND', 50000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '오늘의 네일1', '네일', 'ND', 49000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '오늘의 페디1', '페디', 'PD', 49000, 60, '사진1');  -- 4
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '속눈썹연장1', '속눈썹', 'LD', 50000, 60, '사진1'); -- 5
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '페디off1', '페디', 'PO', 30000, 30, '사진1');		  -- 6
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '네일off1', '네일', 'NO', 40000, 30, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 1, '속눈썹off1', '속눈썹', 'LO', 55000, 30, '사진1');

--8
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '원컬러 젤네일2', '네일', 'ND', 40000, 60, '사진1'); 
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '포인트 젤네일2', '네일', 'ND', 50000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '오늘의 네일2', '네일', 'ND', 49000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '오늘의 페디2', '페디', 'PD', 49000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '속눈썹연장2', '속눈썹', 'LD', 50000, 60, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '페디off2', '페디', 'PO', 30000, 30, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '네일off2', '네일', 'NO', 40000, 30, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 2, '속눈썹off2', '속눈썹', 'LO', 55000, 30, '사진1');

--15
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '원컬러 젤네일3', '네일', 'ND', 42000, 60, '사진1'); 
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '포인트 젤네일3', '네일', 'ND', 55000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '오늘의 네일3', '네일', 'ND', 19000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '오늘의 페디3', '페디', 'PD', 49000, 90, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '속눈썹연장3', '속눈썹', 'LD', 25000, 60, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '페디off3', '페디', 'PO', 25000, 30, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '네일off3', '네일', 'NO', 46000, 30, '사진1');
insert into shopDesign(designId, shopNum, designName, designType, designOption, designPrice, designTime, designPhoto) values(shopDesign_seq.nextval, 3, '속눈썹off3', '속눈썹', 'LO', 51400, 60, '사진1');



--예약
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 1, 4, TO_DATE('2019-11-22 11:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-03 14:00','YYYY-MM-DD HH24:MI'), 60, 1);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 1, 4, TO_DATE('2019-10-22 11:02','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-02 11:30','YYYY-MM-DD HH24:MI'), 90, 6, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'gildong', 1, 1, TO_DATE('2019-11-01 11:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-03 12:30','YYYY-MM-DD HH24:MI'), 60, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'lime', 1, 2, TO_DATE('2019-11-02 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-02 11:30','YYYY-MM-DD HH24:MI'), 90, 7, 2);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'ddoock', 1, 4, TO_DATE('2019-11-02 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 11:30','YYYY-MM-DD HH24:MI'), 120, 6, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'thunder', 1, 4, TO_DATE('2019-11-02 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-22 11:30','YYYY-MM-DD HH24:MI'), 90, 0);

insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'gildong', 2, 8, TO_DATE('2019-10-22 11:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-03 12:00','YYYY-MM-DD HH24:MI'), 60, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 2, 9, TO_DATE('2019-11-01 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-03 14:00','YYYY-MM-DD HH24:MI'), 120, 14, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 2, 10, TO_DATE('2019-11-01 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 14:00','YYYY-MM-DD HH24:MI'), 120, 14, 1);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'yoosin', 2, 12, TO_DATE('2019-11-02 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-07 11:30','YYYY-MM-DD HH24:MI'), 90, 15, 2);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'gildong', 2, 8, TO_DATE('2019-11-02 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-07 11:30','YYYY-MM-DD HH24:MI'), 60, 0);

insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'bboong', 3, 15, TO_DATE('2019-10-21 11:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-03 14:00','YYYY-MM-DD HH24:MI'), 60, 2);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'thunder', 3, 15, TO_DATE('2019-10-22 11:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-03 14:00','YYYY-MM-DD HH24:MI'), 90, 21, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'thunder', 3, 16, TO_DATE('2019-11-01 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 14:00','YYYY-MM-DD HH24:MI'), 90, 1);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, rsvnstatus) values(reservation_seq.nextval, 'thunder', 3, 19, TO_DATE('2019-11-01 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 14:00','YYYY-MM-DD HH24:MI'), 60, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 3, 18, TO_DATE('2019-11-02 15:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 11:30','YYYY-MM-DD HH24:MI'), 120, 20, 1);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 3, 17, TO_DATE('2019-11-02 14:00','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 11:30','YYYY-MM-DD HH24:MI'), 120, 21, 0);
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2, rsvnstatus) values(reservation_seq.nextval, 'gosolb', 3, 4, TO_DATE('2019-11-02 15:30','YYYY-MM-DD HH24:MI'), TO_DATE('2019-11-21 11:30','YYYY-MM-DD HH24:MI'), 120, 6, 0);

---- 리뷰
----주원샵1
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'gosolb', 1, 1, 5, '너무 마음에 들어요', 0, 1, TO_DATE('2019-11-02 21:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'juwon', 1, 0, 0, '감사합니다 또 와주세요:)', 1, 1, TO_DATE('2019-10-31 23:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'ddoock', 1, 2, 3, '그냥 그랬어요', 0, 2, TO_DATE('2019-11-02 21:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'lime', 1, 3, 4, '괜찮았어요', 0, 3, TO_DATE('2019-11-03 11:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'juwon', 1, 0, 0, '감사합니다:)', 1, 3, TO_DATE('2019-11-03 21:00','YYYY-MM-DD HH24:MI'));
----주원샵2
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'bboong', 2, 4, 5, '너무 마음에 들어요', 0, 1, TO_DATE('2019-11-01 21:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'juwon', 2, 0, 0, '감사합니다! :)', 1, 1, TO_DATE('2019-11-03 21:00','YYYY-MM-DD HH24:MI'));
----펭수샵
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'ddoock', 3, 5, 3, '뚝딱뚝딱', 0, 1, TO_DATE('2019-10-31 21:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'pengsu', 3, 0, 0, '감사합니다 또 와주세요:)', 1, 1, TO_DATE('2019-10-31 23:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'bboong', 3, 6, 1, '뿡뿡이', 0, 2, TO_DATE('2019-11-02 21:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'thunder', 3, 7, 4, '번개맨', 0, 3, TO_DATE('2019-11-03 11:00','YYYY-MM-DD HH24:MI'));
--insert into review(reviewNum, memberId, shopNum, rsvnNum, reviewScore, reviewComment, reviewDepth, reviewGroup, reviewDate) values(review_seq.nextval, 'pengsu', 3, 0, 0, '감사합니다:)', 1, 3, TO_DATE('2019-11-03 21:00','YYYY-MM-DD HH24:MI'));
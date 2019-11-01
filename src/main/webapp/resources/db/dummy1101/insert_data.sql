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
values (shopInfo_seq.nextval,'yoosin','유신샵','02-4444-2222','서울시|강남구|강남동|11번지','09:30','20:00', '목,금','2019/10/14/uuid_cute.jpg','유신샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'gamchan','감찬샵','02-9999-1111','서울시|마포구|마포동|13번지','10:00','18:30', '일', '2019/10/14/uuid_2019846722751.jpg','감찬샵입니다.',0,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'pengsu','펭수샵','02-5555-8888','서울시|서초구|서초2동|13번지','10:30','19:30', '월,수', '2019/10/14/uuid_2019846722751.jpg','펭펭펭',0,'취소정책');



/* monthSchedule */
/* 예약가능날짜 */
insert into monthSchedule(addDate, shopNum) values ('2019-10-31', 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 11:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 11:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 11:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 11:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 12:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 12:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 12:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 13:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 13:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 13:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 13:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 14:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 14:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 14:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 14:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 15:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 15:29', 'yyyy-MM-dd hh24-mi'), 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-31', to_date('2019-10-31 15:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-31 15:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-01', 1);
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-11-01', to_date('2019-11-01 15:30', 'yyyy-MM-dd hh24-mi'), to_date('2019-11-01 15:59', 'yyyy-MM-dd hh24-mi'), 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-02', 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-03', 1);
insert into monthSchedule(addDate, shopNum) values ('2019-11-01', 2);
insert into monthSchedule(addDate, shopNum) values ('2019-11-02', 2);
insert into monthSchedule(addDate, shopNum) values ('2019-11-03', 2);
insert into monthSchedule(addDate, shopNum) values ('2019-11-06', 2);
insert into monthSchedule(addDate, shopNum) values ('2019-10-30', 3);
insert into monthSchedule(addDate, shopNum) values ('2019-11-02', 3);
insert into monthSchedule(addDate, shopNum) values ('2019-11-03', 3);
insert into monthSchedule(addDate, shopNum) values ('2019-11-04', 3);
insert into monthSchedule(addDate, shopNum) values ('2019-10-30', 4);
insert into monthSchedule(addDate, shopNum) values ('2019-10-31', 4);
insert into monthSchedule(addDate, shopNum) values ('2019-11-01', 4);
insert into monthSchedule(addDate, shopNum) values ('2019-11-02', 4);
insert into monthSchedule(addDate, shopNum) values ('2019-10-29', 5);
insert into monthSchedule(addDate, shopNum) values ('2019-10-31', 5);
insert into monthSchedule(addDate, shopNum) values ('2019-11-01', 5);
insert into monthSchedule(addDate, shopNum) values ('2019-11-02', 5);


/* timeSchedule */
/* 예약가능시간 */
insert into timeSchedule(shopNum, addDate, startTime, endTime, arranged) values (1, '2019-10-14', to_date('2019-10-14 12:00', 'yyyy-MM-dd hh24-mi'), to_date('2019-10-14 12:29', 'yyyy-MM-dd hh24-mi'), 1);

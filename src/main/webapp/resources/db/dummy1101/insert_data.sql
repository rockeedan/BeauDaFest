/* memberList */
--일반회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gosolb','고솔비','1234qwer','gosolb@gmail.com','010-1234-5678',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gildong','길동','1234qwer','gildong@gmail.com','010-1111-2222',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('lime','라임','1234qwer','lime@gmail.com','010-3333-4444',0);
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('ddoock','뚝딱이','1234qwer','ddoock@gmail.com','010-4444-5555',0);
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
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','주원샵','02-5555-6666','서울시|서초구|서초동|12번지','10:00','18:00', '월,화','2019/10/14/uuid_2019846505481.png','주원샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'juwon','주원샵2','02-5555-6667','서울시|서초구|서초동|13번지','10:00','18:00', '월,화','2019/10/14/uuid_2019846505481.png','주원샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'yoosin','유신샵','02-4444-2222','서울시|강남구|강남동|11번지','10:00','18:00', '목,금','2019/10/14/uuid_cute.jpg','유신샵입니다.',1,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'gamchan','감찬샵','02-9999-1111','서울시|마포구|마포동|13번지','10:00','18:00', '토,일,월', '2019/10/14/uuid_2019846722751.jpg','감찬샵입니다.',0,'취소정책');
insert into shopInfo(shopNum, memberId, shopName, shopPhone, shopAddr, shopOpen, shopClose, shopOff, shopPhoto, shopIntro, shopParking, shopPolicy)
values (shopInfo_seq.nextval,'pengsu','펭수샵','02-5555-8888','서울시|서초구|서초2동|13번지','10:00','18:00', '월,수', '2019/10/14/uuid_2019846722751.jpg','펭펭펭',0,'취소정책');



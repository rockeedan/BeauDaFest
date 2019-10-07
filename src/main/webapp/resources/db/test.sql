

--일반회원
insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gosolb','고솔비','1234qwer','gosolb@gmail.com','010-1234-5678',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('gildong','길동','1234qwer','gildong@gmail.com','010-1111-2222',0);

insert into memberList(memberId, memberName, memberPass, memberEmail, memberPhone, memberStatus)
values ('lime','라임','1234qwer','lime@gmail.com','010-3333-4444',0);


--예약
insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(1, 'gosolb', 1111, 1, sysdate, TO_DATE('2019-10-10 15:20','YYYY-MM-DD HH24:MI'), 120);

insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(2, 'gildong', 1111, 2, sysdate, TO_DATE('2019-10-10 17:20','YYYY-MM-DD HH24:MI'), 60);


insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(3, 'lime', 2222, 3, sysdate, TO_DATE('2019-10-10 13:00','YYYY-MM-DD HH24:MI'), 90);


insert into reservation(rsvnNum, memberId, shopNum, designId, bookingDate, rsvnDate, rsvnTime, designId2)
values(4, 'gosolb', 2222, 4, sysdate, TO_DATE('2019-10-10 15:00','YYYY-MM-DD HH24:MI'), 60);


--rsvnTime : 60,90,120

select * from memberList;




--insert into shopDesign
--values(1, 1111, "" );



--조회
-- 1. # 2. 예약자명  3. 예약날짜  4. 시술명(디자인명) 5. 옵션 6. 합계

select rsvnnum, 
from reservation r, memberList m
where r.memberid = m.member


--조회
-- 1. # 2. 예약자명  3. 예약날짜  4. 시술명(디자인명) 5. 옵션 6. 금액합계

select * from reservation
select * from memberlist
select * from shopdesign


/* 
  
 --조회할 데이터 
rsvnnum, memberid, membername, designname, designid2 optionname, 
designprice, bookingdate, rsvndate, memberphone, shopnum ,designname, designprice


--memberList
memberid, memberName

--reservation
rsvnnum, bookingDate, rsvnDate, designId, designId2

--shopDesign
designName, designId, designName,designPrice


 */


--내 샵번호 찾기
select shopnum
from SHOPINFO
where memberid = 'hana1'


select rsvnnum, memberid, membername, memberphone, 
		RESERVATION2.designname designname, SHOPDESIGN2.designname optionname,
		RESERVATION2.designprice + SHOPDESIGN2.designprice designprice, 
		 bookingdate, rsvndate, RESERVATION2.shopnum

from
	(select rsvnnum, memberid, membername, shopdesign.designname designname, optionnum,
			 shopdesign.designprice designprice, 
			bookingdate, rsvndate, memberphone, RESERVATION.shopnum shopnum
			
	 from
		(select rsvnnum, memberid, membername, designid, designid2 optionnum, 
				bookingdate, rsvndate, memberphone, shopnum
	 	 from reservation  inner join memberList 
	 	 using(memberid)
	 	 ) RESERVATION,  SHOPDESIGN
	where RESERVATION.designid = shopdesign.designid
	and RESERVATION.shopnum = 1111

	) 
	reservation2 left outer join SHOPDESIGN SHOPDESIGN2
ON reservation2.optionnum = SHOPDESIGN2.designid
order by rsvnnum;







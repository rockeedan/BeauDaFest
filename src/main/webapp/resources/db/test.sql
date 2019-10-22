
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
		RESERVATION2.designname designname, nvl(SHOPDESIGN2.designname,'X') optionname,
		RESERVATION2.designprice + nvl(SHOPDESIGN2.designprice,0) designprice, 
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


-------------------------------------------------------------------------------------------------------
--월별 예약 조회
--예약없는 달까지 조회 
--outer join


--예약 있는 달만 조회
select to_char(rsvndate, 'yyyy-mm') ym, count(*)
from reservation  
where shopnum=1111
group by to_char(rsvndate, 'yyyy-mm')


--select to_char(rsvndate, 'yyyy-mm'), count(*)
--from reservation  
--where shopnum=#{shopnum}
--group by to_char(rsvndate, 'yyyy-mm')



--전체 월 조회
select to_char(add_months(to_date('201901', 'YYYYMM'),(level - 1)), 'yyyy-mm') ym
from dual
connect by add_months(to_date('201901', 'YYYYMM'),(level - 1)) <= to_date('201912', 'YYYYMM')


--select to_char(add_months(to_date(#{fromDate}, 'YYYYMM'),(level - 1)), 'yyyy-mm') ym
--from dual
--connect by add_months(to_date(#{fromDate}, 'YYYYMM'),(level - 1)) <= to_date(#{toDate}, 'YYYYMM')


select yearmonth.ym ym, nvl(cnt,0) cnt

from (select to_char(add_months(to_date('201901', 'YYYYMM'),(level - 1)), 'yyyy-mm') ym
 	 from dual
	 connect by add_months(to_date('201901', 'YYYYMM'),(level - 1)) <= to_date('201901', 'YYYYMM')+364) yearmonth
	
	 left outer join 
	 
	(select to_char(rsvndate, 'yyyy-mm') ym, count(*) cnt
	 from reservation  
	 where shopnum=1111
	 group by to_char(rsvndate, 'yyyy-mm')) reservation
	 
on yearmonth.ym = reservation.ym

order by yearmonth.ym






select yearmonth.ym, nvl(cnt,0) cnt

from (select to_char(add_months(to_date(#{fromDate}, 'YYYYMM'),(level - 1)), 'yyyy-mm') ym
 	 from dual
	 connect by add_months(to_date(#{fromDate}, 'YYYYMM'),(level - 1)) <= to_date(#{toDate}, 'YYYYMM')) yearmonth
	
	 left outer join 
	 
	(select to_char(rsvndate, 'yyyy-mm') ym, count(*) cnt
	 from reservation  
	 where shopnum=#{shopnum}
	 group by to_char(rsvndate, 'yyyy-mm')) reservation
	 
on yearmonth.ym = reservation.ym
order by yearmonth.ym


-------------------------------------------------------------------------------------------------------
--월별 예약 총 금액 조회

--reservation - designid,designid2가져와서
--designid의 , designid2의 금액

select * from reservation
select * from shopdesign

--예약 있는 달만 조회
select to_char(rsvndate, 'yyyy-mm') ym, sum(reservation2.designprice+nvl(SHOPDESIGN2.designprice,0)) totalPrice
		-- to_char(rsvndate, 'yyyy-mm') ym, reservation2.designprice, nvl(SHOPDESIGN2.designprice,0)
from
	(select RESERVATION.rsvndate rsvndate, 
			RESERVATION.designid designid, RESERVATION.designid2 optionnum, 
			shopdesign.designprice designprice
	from RESERVATION,  SHOPDESIGN
	where RESERVATION.designid = shopdesign.designid 
	and RESERVATION.shopnum = 1111
	) 
	reservation2 left outer join SHOPDESIGN SHOPDESIGN2
ON reservation2.optionnum = SHOPDESIGN2.designid
GROUP BY to_char(rsvndate, 'yyyy-mm') 



--월별 예약 총 금액 조회
select yearmonth.ym, nvl(totalprice,0)

from (select to_char(add_months(to_date('201901', 'YYYYMM'),(level - 1)), 'yyyy-mm') ym
 	 from dual
	 connect by add_months(to_date('201901', 'YYYYMM'),(level - 1)) <= to_date('201901', 'YYYYMM')+364) yearmonth
	
left outer join 
	 
	(select to_char(rsvndate, 'yyyy-mm') ym, 
			sum(reservation2.designprice+nvl(SHOPDESIGN2.designprice,0)) totalPrice
	 from
		 (select RESERVATION.rsvndate rsvndate, 
				RESERVATION.designid designid, RESERVATION.designid2 optionnum, 
				shopdesign.designprice designprice
		 from RESERVATION,  SHOPDESIGN
		 where RESERVATION.designid = shopdesign.designid 
		 and RESERVATION.shopnum = 1111
		 ) reservation2 
		 
	left outer join SHOPDESIGN SHOPDESIGN2
	ON reservation2.optionnum = SHOPDESIGN2.designid
	GROUP BY to_char(rsvndate, 'yyyy-mm')) rsvn
	  
on yearmonth.ym = rsvn.ym
order by yearmonth.ym
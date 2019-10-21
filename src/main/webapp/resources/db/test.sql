
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

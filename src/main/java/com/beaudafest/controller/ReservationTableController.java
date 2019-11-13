package com.beaudafest.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.domain.ReservationVO;
import com.beaudafest.domain.newReservationTableVO;
import com.beaudafest.service.ReservationTableService;

@Controller
@RequestMapping("/reservation")
public class ReservationTableController {

	@Autowired
	private ReservationTableService service;
	
	@RequestMapping("/selectReservation")
	public String selectReservation(HttpServletRequest request) {
		request.setAttribute("shopNum", request.getParameter("shopNum"));
		request.setAttribute("designId", request.getParameter("designId"));
		request.setAttribute("designName", request.getParameter("designName"));
		request.setAttribute("designPrice", request.getParameter("designPrice"));
		request.setAttribute("designTime", request.getParameter("designTime"));
		request.setAttribute("optionId", request.getParameter("optionId"));
		request.setAttribute("optionName", request.getParameter("optionName"));
		request.setAttribute("optionPrice", request.getParameter("optionPrice"));
		request.setAttribute("optionTime", request.getParameter("optionTime"));
		return "/reservation/reservationDate";
	}
	
	@RequestMapping("/reservationTable")
	public String tableView(HttpServletRequest request,String addDate) {
		int shopNum = 1;
		if(service.selectMonthSchedule(shopNum, addDate)) {
			request.setAttribute("reservation", 1);
			return "/reservationTest/reservationTable";}
		else {
			request.setAttribute("reservation", 0);
			return "/reservationTest/reservationTable";
		}
	}
	
	@RequestMapping("/insert")
	public @ResponseBody String insert(int shopNum, String addDate, String open[], String close[]) {
		if(service.insertTimeSchedule(shopNum, addDate,open,close)) {
			return "성공!!!!!";
		}
		return "실패";
	}
	
	@RequestMapping("/insertweek")
	public @ResponseBody String insertweek() {//int shopNum,String weekStart,String weekEnd,String open,String close
		if(service.insertWeekSchedule(1, "2019/09/22","2019/09/28", "10:00", "17:00")) {
			return "한 주 성공!!!!!";
		}
		return "한 주 실패";
	}
	
	@RequestMapping("/selectweek")
	public String selectweek(Model model, Date startWeek) throws ParseException {
		Date currentDate = new Date();
		if(startWeek==null) {
			Calendar cal= new GregorianCalendar(Locale.KOREA);
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			cal.setTime(format.parse(format.format(currentDate)));
			cal.add(Calendar.DAY_OF_YEAR, (1-cal.get(Calendar.DAY_OF_WEEK)));
			startWeek=cal.getTime();
		}
		List<ReservationTableVO> list = service.selectWeekScheduleList(1, startWeek);
		String list0 = list.get(0).getStartTime();
		List<String> timeList = new ArrayList<String>();
		for (int i = 0; i < (list.size()/7); i++) {
			timeList.add(new SimpleDateFormat("HH:mm").format(list.get(i).getStartTimeDate()));
		}
		model.addAttribute("currentDate",currentDate);
		model.addAttribute("timeList",timeList);
		model.addAttribute("list",list);
		return "/reservationTest/reservationTable";
	}
	
	@RequestMapping("/newtable")
	public String newtable() {
		return "/reservationTest/newTable";
	}
	
	@RequestMapping("/test")
	public @ResponseBody String test() {
		return "성공";
	}
	@RequestMapping("/eventTest")
	public @ResponseBody List<newReservationTableVO> eventTest(int shopNum){
		return service.event(shopNum);
	}
	@RequestMapping("/eventDelete")
	public @ResponseBody boolean eventDelete(int shopNum, String addDate, String startTime) {
		return service.deleteTimeSchedule(shopNum, addDate, startTime);
	}
	@RequestMapping("/countTimeSchedule")
	public @ResponseBody Integer countTimeSchedule(int shopNum, String addDate, String startTime) {
		return service.countTimeSchedule(shopNum, addDate, startTime);
	}
	@RequestMapping("/reservationEvent")
	public @ResponseBody List<newReservationTableVO> reservationEvent(int shopNum,int rsvnTime){
		return service.reservationEvent(shopNum, rsvnTime);
	}
	@RequestMapping("/createReservation")
	public @ResponseBody boolean createReservation(ReservationVO vo) {
		return service.createReservation(vo);
	}
}

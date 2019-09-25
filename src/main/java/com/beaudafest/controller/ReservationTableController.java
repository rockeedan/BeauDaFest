package com.beaudafest.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beaudafest.domain.ReservationTableVO;
import com.beaudafest.service.ReservationTableService;

@Controller
@RequestMapping("/reservation")
public class ReservationTableController {

	@Autowired
	private ReservationTableService service;
	
	
	@RequestMapping("/")
	public String tableView() {
		return "/reservationTest/reservationTable";
	}
	
	@RequestMapping("/insert")
	public @ResponseBody String insert() {
		if(service.insertTimeSchedule(1, "2019/09/21", "10:00", "17:00")) {
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
}

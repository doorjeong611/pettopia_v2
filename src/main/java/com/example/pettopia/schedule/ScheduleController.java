package com.example.pettopia.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ScheduleController {
	
	// scheduleCalendar Form
	@GetMapping("/schedule/scheduleCalendar")
	public String scheduleCalendar(Model model) {
		return "schedule/scheduleCalendar";
	}
	
	//scheduleList Form
	@GetMapping("/schedule/scheduleList")
	public String scheduleList(Model model) {
		return "schedule/scheduleList";
	}
	

}

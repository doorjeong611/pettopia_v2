package com.example.pettopia.schedule;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@Slf4j
public class ScheduleController {
	
	@GetMapping("/schedule/schedule")
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	

}

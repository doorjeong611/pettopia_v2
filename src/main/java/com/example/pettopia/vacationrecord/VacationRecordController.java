package com.example.pettopia.vacationrecord;

import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
@Slf4j
public class VacationRecordController {

	 @GetMapping("vacation/vacationList")
	 public String getVacationList() {
	 	return "vacation/vacationList";
	 }
	 
}

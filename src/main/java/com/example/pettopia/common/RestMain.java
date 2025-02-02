package com.example.pettopia.common;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestMain {
	
	@Autowired MainService mainService;
	
	@GetMapping("/monthlyReservationStatistics/{year}")
	public List<Map<String, Object>> monthlyReservationStatistics(@PathVariable Integer year) {
		return mainService.getMonthlyReservationStatistics(year);
	}
	
	@GetMapping("/genderSignupStatistics/{year}/{gender}")
	public List<Map<String, Object>> genderSignupStatistics(@PathVariable Integer year, @PathVariable String gender) {
		return mainService.getGenderSignupStatistics(year, gender);
	}

}

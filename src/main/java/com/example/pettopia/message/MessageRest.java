package com.example.pettopia.message;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class MessageRest {
	@Autowired MessageService messageService;
	
	// 오자윤 : 직원검색 모달창
	@GetMapping("message/messageNote/employees")
	public  List<Map<String, Object>> employeeList(@RequestParam(value = "empStatus", defaultValue = "E") String empStatus) {
		return messageService.getEmployeeList(empStatus);
	}
	
}

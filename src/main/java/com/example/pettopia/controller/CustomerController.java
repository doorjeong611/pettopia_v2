package com.example.pettopia.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
	// 
    @GetMapping("/customer/getCustomerList")
    public String getCustomerList(Model model) {
        
        return "customer/customerList"; 
    }
}

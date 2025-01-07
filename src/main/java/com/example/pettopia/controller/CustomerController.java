package com.example.pettopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.pettopia.service.CustomerService;
import com.example.pettopia.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/customer/getCustomerList")
    public String getCustomerList(Model model) {
        List<Customer> customerList = customerService.getCustomerList();
        log.debug("customerList =======> " + customerList.toString());
        model.addAttribute("customerList", customerList);
        
        return "customer/customerList";
    }
}

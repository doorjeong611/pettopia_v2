package com.example.pettopia.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.pettopia.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerController {
    @Autowired
    private CustomerService customerService; 
    
    // 고객 조회, 페이징, 검색
    @GetMapping("/customer/getCustomerList")
    public String getCustomerList(
            Model model,
            @RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "10") int pageSize,
            @RequestParam(required = false) String searchWord) {

        // 검색과 페이징 처리
        List<Customer> customerList = customerService.getCustomerList(searchWord, pageSize, currentPage);
        int totalRecords = customerService.countCustomerList(searchWord);
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        // 데이터 모델에 추가
        model.addAttribute("customerList", customerList); // 고객 리스트
        model.addAttribute("searchWord", searchWord); // 검색어
        model.addAttribute("currentPage", currentPage); // 현재 페이지
        model.addAttribute("totalPages", totalPages); // 전체 페이지 수
        model.addAttribute("totalRecords", totalRecords); 
        model.addAttribute("pageSize", pageSize);

        return "customer/customerList";
    }
}

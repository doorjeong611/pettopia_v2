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
    
    // 객실 조회
    @GetMapping("/customer/getCustomerList")
    public String getCustomerList(Model model,
                                  @RequestParam(defaultValue = "1") int currentPage,
                                  @RequestParam(defaultValue = "10") int pageSize) {
        // 페이징된 고객 리스트 가져오기
        List<Customer> customerList = customerService.getCustomerList(pageSize, currentPage);
        int totalRecords = customerService.countCustomerList(); // 총 고객 수 조회
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        model.addAttribute("customerList", customerList); // 현재 페이지 데이터
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호
        model.addAttribute("totalPages", totalPages); // 총 페이지 수
        model.addAttribute("totalRecords", totalRecords); // 총 고객 수
        model.addAttribute("pageSize", pageSize); // 페이지 크기

        return "customer/customerList"; // 반환할 뷰 이름
    }
}

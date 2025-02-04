package com.example.pettopia.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.pettopia.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CustomerController {
    @Autowired
    private CustomerService customerService;
    
    @ResponseBody
    @GetMapping("/customer/getCustomerNo/{customerName}")
    public Map<String, Object> getCustomerNo(@PathVariable String customerName) {
        Map<String, Object> response = new HashMap<>();
        
        // 서비스에서 고객 번호 조회
        Integer customerNo = customerService.getCustomerNoByName(customerName);
        log.debug(String.valueOf(customerNo));
        
        if (customerNo != null) {
            response.put("success", true);
            response.put("customerNo", customerNo);
        } else {
            response.put("success", false);
            response.put("message", "해당 고객이 존재하지 않습니다.");
        }

        return response; // JSON 응답
    }

    
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

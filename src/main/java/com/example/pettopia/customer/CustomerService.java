package com.example.pettopia.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.Customer;

@Service
public class CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    
    public List<Customer> getCustomerList(String searchWord, int pageSize, int currentPage) {
        int offset = (currentPage - 1) * pageSize;
        Map<String, Object> params = new HashMap<>();
        params.put("searchWord", searchWord);
        params.put("pageSize", pageSize);
        params.put("offset", offset);
        return customerMapper.selectCustomerList(params);
    }

    public int countCustomerList(String searchWord) {
        Map<String, Object> params = new HashMap<>();
        params.put("searchWord", searchWord);
        return customerMapper.countCustomerList(params);
    }

    // 고객 찾기
    public Integer getCustomerNoByName(String customerName) {
        return customerMapper.getCustomerNoByName(customerName);
    }
}

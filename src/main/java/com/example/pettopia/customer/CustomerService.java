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

    // 고객 리스트 조회 + 페이징
    public List<Customer> getCustomerList(int pageSize, int currentPage) {
        int offset = (currentPage - 1) * pageSize; // 시작 위치 계산
        Map<String, Object> params = new HashMap<>();
        params.put("pageSize", pageSize);
        params.put("offset", offset);
        return customerMapper.selectCustomerList(params); // 페이징된 고객 리스트 반환
    }

    // 총 고객 수 조회
    public int countCustomerList() {
        return customerMapper.countCustomerList(); // 전체 고객 수 반환
    }
}

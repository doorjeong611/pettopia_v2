package com.example.pettopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.mapper.CustomerMapper;
import com.example.pettopia.vo.Customer;

@Service
public class CustomerService {
	@Autowired
    private CustomerMapper customerMapper;

	// 전체 고객 조회
    public List<Customer> getCustomerList() {
        return customerMapper.selectCustomerList();
    }
}

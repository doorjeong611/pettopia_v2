package com.example.pettopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Customer;

@Mapper
public interface CustomerMapper {
	// 전체 고객 조회
    List<Customer> selectCustomerList();
}

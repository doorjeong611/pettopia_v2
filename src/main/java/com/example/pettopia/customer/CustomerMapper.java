package com.example.pettopia.customer;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.Customer;

@Mapper
public interface CustomerMapper {
	 // 페이징된 고객 리스트 조회
    List<Customer> selectCustomerList(Map<String, Object> params);

    // 총 고객 수 조회
    int countCustomerList(Map<String, Object> params);
    
    //고객 찾기
    Integer getCustomerNoByName(String customerName);

}

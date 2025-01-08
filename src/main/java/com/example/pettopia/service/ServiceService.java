package com.example.pettopia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.mapper.ServiceMapper;
import com.example.pettopia.vo.PetService;

@Service
public class ServiceService {
	@Autowired
    private ServiceMapper serviceMapper;

	// 서비스 리스트 조회
    public List<PetService> getAllServices() {
        return serviceMapper.selectService();
    }

    // 서비스 등록 (추가)
    public void insertService(PetService service) {
        serviceMapper.insertService(service);
    }
}

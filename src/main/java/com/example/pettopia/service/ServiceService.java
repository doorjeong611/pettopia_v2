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

    public List<PetService> getAllServices() {
        return serviceMapper.selectService();
    }
}

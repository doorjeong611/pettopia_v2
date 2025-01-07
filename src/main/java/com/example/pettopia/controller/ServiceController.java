package com.example.pettopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.pettopia.service.ServiceService;
import com.example.pettopia.vo.PetService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ServiceController {
    
    @Autowired
    private ServiceService serviceService;

    /**
     * JSON 형식으로 PetService 데이터 반환
     */
    @GetMapping("/api/pet-services")
    @ResponseBody
    public List<PetService> getAllPetServices() {
        List<PetService> serviceList = serviceService.getAllServices();
        log.debug("Fetched serviceList: {}", serviceList); // 디버깅 로그
        return serviceList;
    }

    /**
     * PetService View 연결 및 데이터 전달
     */
    @GetMapping("/service/getServiceList")
    public String getServiceList(Model model) {
        List<PetService> serviceList = serviceService.getAllServices();
        log.debug("Adding serviceList to model: {}", serviceList); // 디버깅 로그
        model.addAttribute("serviceList", serviceList);
        return "service/petService"; // View 경로
    }
}

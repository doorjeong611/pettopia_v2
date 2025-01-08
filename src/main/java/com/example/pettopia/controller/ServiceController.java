package com.example.pettopia.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.service.ServiceService;
import com.example.pettopia.vo.PetService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ServiceController {
    
    @Autowired
    private ServiceService serviceService;
    
    // 서비스 등록 페이지
    @GetMapping("/service/addService")
    public String addService() {
        return "service/addService";
    }
    
    // 서비스 등록 처리
    @PostMapping("/service/addService")
    public String addService(@ModelAttribute PetService service, RedirectAttributes redirectAttributes) {
        try {
            serviceService.insertService(service);
            redirectAttributes.addFlashAttribute("successMessage", "서비스가 성공적으로 등록되었습니다!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "서비스 등록 중 오류가 발생했습니다.");
        }
        return "redirect:/service/getServiceList"; // 등록 페이지로 리다이렉트
    }
    

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

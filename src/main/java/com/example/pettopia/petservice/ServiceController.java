package com.example.pettopia.petservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.PetService;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@Slf4j
public class ServiceController {
    
    @Autowired
    private ServiceService serviceService;
    
    // 서비스 삭제
    @PostMapping("/service/deleteService")
    public String deleteService(@RequestParam("serviceNos") String serviceNos) {
        String[] serviceNoArray = serviceNos.split(",");
        for (String serviceNo : serviceNoArray) {
            serviceService.deleteService(serviceNo);  // 서비스 삭제 로직
        }
        return "redirect:/service/getServiceList";  // 삭제 후 서비스 목록 페이지로 리다이렉트
    }
    
    
    
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

    // 펫 서비스 조회, 페이징, 검색
    @GetMapping("/service/getServiceList")
    public String getServiceList(Model model,
    		@RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "10") int pageSize,
            @RequestParam(required = false) String searchWord) {
    	
    	// 검색과 페이징 처리
        List<PetService> serviceList = serviceService.getAllServices(searchWord, pageSize, currentPage);
        int totalRecords = serviceService.countServiceList(searchWord); // 총 고객 수 조회
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        
        
        model.addAttribute("serviceList", serviceList);
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호
        model.addAttribute("totalPages", totalPages); // 총 페이지 수
        model.addAttribute("totalRecords", totalRecords); // 총 고객 수
        model.addAttribute("pageSize", pageSize); // 페이지 크기
        model.addAttribute("searchWord", searchWord); // 검색어
        log.debug(TeamColor.WJ + "검색어 ========> " + searchWord + TeamColor.RESET);
        
        return "service/petService"; // View 경로
    }
}

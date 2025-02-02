package com.example.pettopia.petservice;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    
    @PostMapping("/service/updateRsvStatus")
    public ResponseEntity<?> updateRsvStatus(@RequestBody Map<String, Object> params) {
        try {
            // 요청에서 파라미터 추출
            String rsvNo = (String) params.get("rsvNo");
            String rsvStatus = (String) params.get("rsvStatus");
            String rsvDateStr = (String) params.get("rsvDatetime"); // 예약 날짜 (ISO 형식)

            // ISO 형식으로 LocalDateTime 변환
            LocalDateTime rsvDate = LocalDateTime.parse(rsvDateStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
            LocalDate today = LocalDate.now();

            // 노쇼 여부 판단
            int rsvNoShow = 0; // 기본값: 노쇼 아님
            if (rsvDate.toLocalDate().isBefore(today) && rsvStatus.equals("CF")) {
                rsvNoShow = 1; // 예약일이 지났는데 상태가 '예약완료'면 노쇼 처리
            }

            // 서비스 호출하여 예약 상태 업데이트
            serviceService.updateRsvStatus(rsvNo, rsvStatus, rsvNoShow);

            // 성공 응답
            return ResponseEntity.ok(Map.of("success", true, "rsvNoShow", rsvNoShow));
        } catch (Exception e) {
            // 실패 응답
            return ResponseEntity.badRequest().body(Map.of("success", false, "message", e.getMessage()));
        }
    }


    
    
    // 서비스 예약내역
    @GetMapping("/service/getServiceRsvList")
    public String getServiceRsvList(Model model,
    		@RequestParam(defaultValue = "1") int currentPage,
            @RequestParam(defaultValue = "10") int pageSize,
            @RequestParam(required = false) String searchWord) {
    	
    	// 검색과 페이징 처리
        List<PetService> serviceRsvList = serviceService.getServiceRsvList(searchWord, pageSize, currentPage);
        int totalRecords = serviceService.countServiceRsvList(searchWord); // 총 고객 수 조회
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        
        model.addAttribute("serviceRsvList", serviceRsvList);
        log.debug(TeamColor.WJ + "serviceRsvList 뭐들어있는지 ========> " + serviceRsvList + TeamColor.RESET);
        model.addAttribute("currentPage", currentPage); // 현재 페이지 번호
        model.addAttribute("totalPages", totalPages); // 총 페이지 수
        model.addAttribute("totalRecords", totalRecords); // 총 고객 수
        model.addAttribute("pageSize", pageSize); // 페이지 크기
        model.addAttribute("searchWord", searchWord); // 검색어
        model.addAttribute("formatter", formatter); // 날짜
        log.debug(TeamColor.WJ + "검색어 ========> " + searchWord + TeamColor.RESET);
        
        return "service/serviceRsvList";
    }
    
    
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

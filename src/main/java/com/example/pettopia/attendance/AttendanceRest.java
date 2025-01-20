package com.example.pettopia.attendance;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.vo.Department;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class AttendanceRest {
	@Autowired AttendanceSerivce attendanceService;

    // 오자윤 : 관리자 - 직원 근태조회
    @GetMapping("/api/employee/attendanceList")
    public ResponseEntity<Map<String, Object>> getAttendanceListByAdmin(
            @RequestParam(required = false) String empNo,
            @RequestParam(required = false) String attendanceDate) {
    	 
    	// 출석 목록 조회
        Map<String, Object> params = new HashMap<>();
        params.put("empNo", empNo);
        params.put("attendanceDate", attendanceDate);
        List<Map<String, Object>> attendanceList = attendanceService.selectAttendance(params);

        // 결과를 맵에 담아서 반환
        Map<String, Object> response = new HashMap<>();
        response.put("attendanceList", attendanceList);

        return ResponseEntity.ok(response); // JSON 형태로 응답
    }
}

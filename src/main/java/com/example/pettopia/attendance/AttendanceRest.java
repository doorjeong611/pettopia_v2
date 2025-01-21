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
    @Autowired
    private AttendanceSerivce attendanceService;

    // 직원 검색 API
    @GetMapping("/attendanceSearch")
    public ResponseEntity<Map<String, Object>> searchAttendance(
            @RequestParam(required = false) String empNo,
            @RequestParam(required = false) String attendanceDate) {

        Map<String, Object> params = new HashMap<>();
        params.put("empNo", empNo);
        params.put("attendanceDate", attendanceDate);

        List<Map<String, Object>> attendanceList = attendanceService.selectAttendance(params);

        Map<String, Object> response = new HashMap<>();
        response.put("attendanceList", attendanceList);

        return ResponseEntity.ok(response); // Return as JSON response
    }
}

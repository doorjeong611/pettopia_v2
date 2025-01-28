package com.example.pettopia.department;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Department;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DepartmentService {
	
	@Autowired DepartmentMapper departmentMapper;
	
	
	// 팀 목록 조회 : 직원 등록시 소속 팀 선택 시 사용
	public List<Department> getDepartmentList(String divisionCode) {
		
		return departmentMapper.selectDepartmentList(divisionCode);
		
	}
	
	
	// 조직도 : 팀별 직급, 사원 조회
	public List<Map<String , Object>> getOrgChart(String deptCode){

		log.debug(TeamColor.KMJ + "DepartmentService - getOrgChart");
		log.debug(TeamColor.KMJ + "deptCode : " + deptCode);
		
		// 조직도 작업을 위해 데이터 가공?
		List<Map<String, Object>> orgChartData = departmentMapper.selectOrgChart(deptCode);
			
		log.debug(TeamColor.KMJ + "orgChartData : " + orgChartData);
		
		
		return orgChartData;
	}
	

}

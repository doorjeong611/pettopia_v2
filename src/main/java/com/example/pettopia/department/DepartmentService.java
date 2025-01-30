package com.example.pettopia.department;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
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
		
		// 조직도 작업을 위해 데이터 가공
		List<Map<String, Object>> orgChartData = departmentMapper.selectOrgChart(deptCode);
			
		log.debug(TeamColor.KMJ + "orgChartData : " + orgChartData);
		
		//depth별로 나누어서 데이터를 담아야함.
//		List<Map<String , Object>> orgChart = new ArrayList<>();
//		
//		Integer maxDepth = 0;	// 해당 팀에 최대 depth를 구하기 -> 그 depth만큼 map을 만들어야함 
//
//		for (Map<String, Object> rankData : orgChartData) {
//		    
//			// mysql에서 count() 등으로 반환된 숫자는 BigInteger로 반환되기도 함. 따라서 depth를 BigInteger로 변환한 후, int로 변환해야함
//		    BigInteger depth = (BigInteger) rankData.get("depth");
//		    Integer depthInt = depth.intValue();
//
//		    if (depthInt > maxDepth) {
//		        maxDepth = depthInt;
//		    }
//		}
//		log.debug(TeamColor.KMJ + "maxDepth : " + maxDepth);
//		
//		
//		for(int i = 1; i <= maxDepth; i++) {
//			
//			// maxDepth만큼 map 생성
//			Map<String, Object> depthData = new HashMap<>();
//			
//			
//			for(Map<String, Object> data : orgChartData) { // 계층형으로 가져온 직원리스트에서 depth별로 나누어 담기
//				log.debug(TeamColor.OJY + "----- 디버깅 ----- ");
//				
//				BigInteger depthInt = (BigInteger) data.get("depth");
//				Integer depth = depthInt.intValue();
//
//				if(i == depth) {
//					log.debug(TeamColor.KDH + "i : " + i);
//					log.debug(TeamColor.WJ + "depth : " + depth);
//					
//					
//					// googleOrgChart
//					String name = (String)data.get("empName") + '/' + (String) data.get("empNo") + '/' + (String)data.get("rankName");
//					Integer rank = depth;
//					
//					log.debug(TeamColor.LJH + "name : " + name);
//					log.debug(TeamColor.LJH + "rank : " + rank);
//					
//					
//					
//					
//					
//					
//					depthData.put(name, rank);
//				}
//			
//			}
//			
//			// map을 orgChart 리스트에 추가
//		    if (!depthData.isEmpty()) {
//		        orgChart.add(depthData);
//		    }
//		}
//		
//		log.debug(TeamColor.KMJ + "orgChart : " + orgChart.toString() + TeamColor.RESET);
		

		return orgChartData;
	}
	
	
	
	// 팀명 중복 검사
	public Integer confirmDepartment(String deptName) {
		
		return departmentMapper.selectConfirmDepartment(deptName);
	}
	
	// 마지막 팀코드
	public Department getLastDeptCode(String divisionCode) {
		return departmentMapper.selectLastDeptCode(divisionCode);
	}
	
	// 마지막 내선번호
	public String getLastDeptExt() {
		return departmentMapper.selectLastDeptExt();			
	}
	
	
	// 팀 등록
	public Integer addDepartment(Department department) {
		return departmentMapper.insertDepartment(department);
	}
	
	
	// 팀 수정
	public Integer modifyDepartmentName(Department dept) {
		return departmentMapper.updateDepartmentName(dept);
	}
	
	public Integer deleteDepartment(Department dept) {
		return departmentMapper.deleteDepartment(dept);
	}
	

}

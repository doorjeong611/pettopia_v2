package com.example.pettopia.petservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.PetService;

@Service
public class ServiceService {
	@Autowired
    private ServiceMapper serviceMapper;
	
	// 상태 업데이트
	 public void updateRsvStatus(String rsvNo, String rsvStatus, int rsvNoShow) {
		 serviceMapper.updateRsvStatus(rsvNo, rsvStatus, rsvNoShow);
	    }
	
	// 서비스 예약 리스트 조회
    public List<PetService> getServiceRsvList(String searchWord, int pageSize, int currentPage) {
    	int offset = (currentPage - 1) * pageSize; // 시작 위치 계산
        Map<String, Object> params = new HashMap<>();
        params.put("searchWord", searchWord);
        params.put("pageSize", pageSize);
        params.put("offset", offset);
    	
    	return serviceMapper.selectServiceRsvList(params);
    }
	
	// 서비스 삭제
	public void deleteService(String serviceNo) {
	    serviceMapper.deleteByServiceNo(serviceNo);
	}
	
	// 서비스 리스트 조회
    public List<PetService> getAllServices(String searchWord, int pageSize, int currentPage) {
    	int offset = (currentPage - 1) * pageSize; // 시작 위치 계산
        Map<String, Object> params = new HashMap<>();
        params.put("searchWord", searchWord);
        params.put("pageSize", pageSize);
        params.put("offset", offset);
    	
    	return serviceMapper.selectService(params);
    }
    
 // 총 펫서비스 리스트 갯수 조회
    public int countServiceList(String searchWord) {
    	 Map<String, Object> params = new HashMap<>();
         params.put("searchWord", searchWord);
        return serviceMapper.countServiceList(params); // 전체 고객 수 반환
    }

    // 서비스 등록 (추가)
    public void insertService(PetService service) {
        serviceMapper.insertService(service);
    }

    // 서비스 예약 리스트 갯수
	public int countServiceRsvList(String searchWord) {
		 Map<String, Object> params = new HashMap<>();
         params.put("searchWord", searchWord);
        return serviceMapper.countServiceRsvList(params); // 전체 고객 수 반환
	}
}

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
	
	// 서비스 상세보기 뷰 및 수정
	public void modifyService(PetService petService) {
        serviceMapper.modifyService(petService); // Mapper 호출
    }
	// 서비스 리스트 조회
    public List<PetService> getAllServices(int pageSize, int currentPage) {
    	int offset = (currentPage - 1) * pageSize; // 시작 위치 계산
        Map<String, Object> params = new HashMap<>();
        params.put("pageSize", pageSize);
        params.put("offset", offset);
    	
    	return serviceMapper.selectService(params);
    }
    
 // 총 펫서비스 리스트 갯수 조회
    public int countServiceList() {
        return serviceMapper.countServiceList(); // 전체 고객 수 반환
    }

    // 서비스 등록 (추가)
    public void insertService(PetService service) {
        serviceMapper.insertService(service);
    }
}

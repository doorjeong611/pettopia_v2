package com.example.pettopia.petservice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.PetService;

@Mapper
public interface ServiceMapper {
	
	// 전체 서비스 리스트 조회
	List<PetService> selectService(Map<String, Object> params);
	
	// 서비스 등록 (추가)
	void insertService(PetService service);
	
	// 총 서비스 리스트 조회
    int countServiceList(Map<String, Object> params);

    // 삭제
	void deleteByServiceNo(String serviceNo);

	// 서비스 예약 리스트 조회
	List<PetService> selectServiceRsvList(Map<String, Object> params);

	// 서비스 예약 리스트 갯수 카운트
	int countServiceRsvList(Map<String, Object> params);
}

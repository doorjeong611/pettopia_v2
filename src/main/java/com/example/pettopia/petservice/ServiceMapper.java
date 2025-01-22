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
	
	// 서비스 수정
	void modifyService(PetService petService);
	
	// 총 서비스 리스트 조회
    int countServiceList();
}

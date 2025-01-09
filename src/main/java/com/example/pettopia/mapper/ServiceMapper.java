package com.example.pettopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.PetService;

@Mapper
public interface ServiceMapper {
	
	// 전체 서비스 리스트 조회
	List<PetService> selectService();
	
	// 서비스 등록 (추가)
	void insertService(PetService service);
	
	// 서비스 수정
	void modifyService(PetService petService);
}

package com.example.pettopia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.pettopia.vo.PetService;

@Mapper
public interface ServiceMapper {
	List<PetService> selectService();
	
	void insertService(PetService service);
}

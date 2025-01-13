package com.example.pettopia.rank;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.pettopia.vo.Rank;

@Service
public class RankService {
	
	@Autowired RankMapper rankMapper;
	
	// 직급 목록 : 직원 등록시 직급 선택
	public List<Rank> getRankList() {
		
		return rankMapper.selectRankList();
		
	}
	
	
	
}

package com.example.pettopia.rank;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.example.pettopia.util.TeamColor;
import com.example.pettopia.vo.Rank;

import lombok.extern.slf4j.Slf4j;

import org.springframework.web.bind.annotation.GetMapping;



@RestController
@Slf4j
public class RankRest {
	
	@Autowired RankService rankService;
	
	// 직급 목록 : 직원 등록시 직급 선택
	@GetMapping("/common/rankList")
	public List<Rank> getrankList() {
		log.debug(TeamColor.KMJ + "RankRest - getRankList()");
		log.debug(TeamColor.KMJ + "RankList : " + rankService.getRankList().toString() +TeamColor.RESET);
		
		return rankService.getRankList();
		
		
	}
	
	
	
}

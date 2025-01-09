package com.example.pettopia.boardcomment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	
//	 댓글 삭제 쿼리 /board/removeComment 작업자 : 이준호
	Integer deleteComment(int commentNo); 
	
}

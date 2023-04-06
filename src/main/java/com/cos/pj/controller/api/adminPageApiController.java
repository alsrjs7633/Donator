package com.cos.pj.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.cos.pj.dto.ResponseDto;
import com.cos.pj.service.BoardService;

@RestController
public class adminPageApiController {
	
	@Autowired
	private BoardService boardService;
	
	@DeleteMapping("/api/reply/{replyId}")   //api에 board에 boardId 의 reply에 replyId를 삭제할거라는 뜻이다. boardId는 주소를 만들기 위해 쓴것이다.
	public ResponseDto<Integer>adminReplyDelete(@PathVariable int replyId){   //replyId만 있으면 삭제가 되기에 replyId만 쓴것.
	boardService.댓글삭제(replyId);	
	return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}
}

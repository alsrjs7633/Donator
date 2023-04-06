package com.cos.pj.service;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.pj.model.BoardModal;
import com.cos.pj.model.Boards;
import com.cos.pj.model.Reply;
import com.cos.pj.model.ReplyModal;
import com.cos.pj.model.Users;
import com.cos.pj.repository.BoardRepository;
import com.cos.pj.repository.ReplyRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private ReplyRepository replyRepository;
	
	@Transactional
	public void 글쓰기(Boards board, Users user) {
		board.setCount(0);
		board.setUsers(user);
		boardRepository.save(board);
	}

	@Transactional(readOnly=true)
	public Page<Boards>글목록(Pageable pageable){
		 return boardRepository.findAll(pageable);
	}
	/*
	 * 글이 너무 많아지면 스크롤을 많이 해야하기 때문에 불편하다. 그래서 페이징 처리하도록 하겠습니다
	 */
	
	
	@Transactional(readOnly=true)                     //보드서비스에서 findById 로 Boards를 들고오면 boardController에서 boardService글상세보기가 된다. Boards는 reply를 들고 있기때문에 boardDetail에서 foreach만 하면 된다.
	public Boards 글상세보기(int id) {
		return boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 상세보기 실패: 아이디를 찾을 수 없습니다.");
		});
	}
	
	
	@Transactional
	public void 글삭제하기(int id) {
		boardRepository.deleteById(id);
	}
	
	@Transactional
	public void 글수정하기(int id,Boards requestBoard) {
		Boards board=boardRepository.findById(id).orElseThrow(()->{
			return new IllegalArgumentException("글 찾기 실패 아이디를 찾을 수 없습니다.");
		});  //영속화완료0
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
		//해당합수로 종료시 (Service가 종료될때)트랜젝션이 종료된다.이때 더티체킹(원래있던 데이터가 바뀌어 저장되기에)-자동업데이트된다. db에 커밋이된다.
	}
	
	@Transactional
	public void 댓글쓰기(Users user,int boardId,Reply requestReply) {
		System.out.println("댓글 확인"+requestReply.getContent());
		
		Boards board=boardRepository.findById(boardId).orElseThrow(()->{
			return new IllegalArgumentException("댓글쓰기 실패: 게시글 아이디를 찾을 수 없습니다.");
		});
		
		requestReply.setUsers(user);  //여기에 오브젝트를 넣어준것이다.
		requestReply.setBoards(board);  //여기에 오브젝트를 넣어준것이다.
		
		replyRepository.save(requestReply);
	}
	
	@Transactional
	public void 댓글수정(int replyId,Reply requestReply) {
		Reply reply=replyRepository.findById(replyId).orElseThrow(()->{
			return new IllegalArgumentException("댓글수정 실패: 게시글 아이디를 찾을 수 없습니다."+replyId);
		});
		reply.setContent(requestReply.getContent());
	}
	
	@Transactional
	public void 댓글삭제(int replyId) {
		replyRepository.deleteById(replyId);
	}
	
	@Transactional(readOnly = true)
	public List<BoardModal> findBoardByUser(Long id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
	    List<Boards> boards = boardRepository.findByUserId(id);
	    List<BoardModal> boardModalDtoList = new ArrayList<>();

	    for(int i = 0; i < boards.size(); i++) {
	    	String strTimestamp = sdf.format(boards.get(i).getCreateDate());
	        BoardModal boardModalDto = BoardModal.builder()
	                .id(boards.get(i).getId())
	                .title(boards.get(i).getTitle())
	                .create_date(strTimestamp)
	                .views(boards.get(i).getCount())
	                .build();

	        boardModalDtoList.add(boardModalDto);
	    }
	    System.out.println("++++++++++++++"+boardModalDtoList);
	    return boardModalDtoList;
	}
	@Transactional(readOnly = true)
	public List<ReplyModal> findReplyByUser(Long id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
	    List<Reply> reply = replyRepository.findByUserId(id);
	    List<ReplyModal> replyModalDtoList = new ArrayList<>();

	    for(int i = 0; i < reply.size(); i++) {
	    	String strTimestamp = sdf.format(reply.get(i).getCreateDate());
	        ReplyModal replyModalDto = ReplyModal.builder()
	                .id(reply.get(i).getId())
	                .content(reply.get(i).getContent())
	                .create_date(strTimestamp)
	                .build();

	        replyModalDtoList.add(replyModalDto);
	    }
	    System.out.println("++++++++++++++"+replyModalDtoList);
	    return replyModalDtoList;
	}
	
	
	
	}


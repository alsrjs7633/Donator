package com.cos.pj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.pj.model.Boards;
import com.cos.pj.repository.BoardRepository;
import com.cos.pj.service.BoardService;
import com.cos.pj.specification.BoardSearchSpecification;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardRepository boardRepository;

	/*
	 * @GetMapping("/board/boardIndex") public String boardIndex() { return
	 * "board/boardIndex"; }
	 */

	@GetMapping("/board/boardList")
	public String index(Model model,
			@PageableDefault(size = 6, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		System.out.println(boardService.글목록(pageable));

		Specification<Boards> spec = (root, query, criteriaBuilder) -> null;
		if (searchTitle != null) {
			spec = spec.and(BoardSearchSpecification.searchTitle(searchTitle));
		}
		model.addAttribute("boards", boardRepository.findAll(spec, pageable));
		return "board/boardList";
	}
	/*
	 * @GetMapping("/board/boardList") public String boardList() { return
	 * "board/boardList"; }
	 */
	/*
	 * @GetMapping("/board/{id}/updateForm") public String findById(@PathVariable
	 * int id, Model model) { model.addAttribute("board", boardService.글상세보기(id));
	 * return "board/updateForm"; }
	 */

	@GetMapping("/board/board")
	public String board() {
		return "board/board";
	}

	//
	@GetMapping("/board/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.글상세보기(id));
		return "board/boardDetail";
	}

	
	  //글 수정하기  
	  @GetMapping("/board/{id}/updateForm") 
	  public String updateForm(@PathVariable int id,Model model) { 
      model.addAttribute("board", boardService.글상세보기(id));
	  return "board/updateForm"; //기존에 있던 값을 뿌려주고 그것을 업데이트하는 것이다.
	 }
	 

	@GetMapping("/board/saveForm")
	public String saveForm() {
		return "board/saveForm";
	}
	/*
	 * @GetMapping("/board/boardDetail") public String boardDetail() { return
	 * "board/boardDetail"; }
	 */

	/*
	 * @GetMapping("/board/boardList") public String boardList() { return
	 * "board/boardList"; }
	 */

	/*
	 * @GetMapping("/board/detail") public String detail() { return "board/detail";
	 * }
	 */

}

package com.cos.pj.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.pj.config.auth.PrincipalDetail;
import com.cos.pj.model.BoardModal;
import com.cos.pj.model.DonatorsModal;
import com.cos.pj.model.ReplyModal;
import com.cos.pj.model.RoleType;
import com.cos.pj.repository.UserRepository;
import com.cos.pj.service.BoardService;
import com.cos.pj.service.ProductService;
import com.cos.pj.specification.AdminSpecification;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class AdminController {
	
	private final UserRepository userRepository;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/user/adminPage")
	public String admin(Model model,
			@PageableDefault(size = 12, sort = "id", direction = Sort.Direction.DESC) Pageable pageable,
			@RequestParam(value = "category", defaultValue = "user") String category,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@AuthenticationPrincipal PrincipalDetail principal) {
		
		/* 관리자 권한이 아닌 경우 해당 페이지를 요청하지 못하도록 설정 */
		System.out.println("TTTTTTTTTTTT"+principal.getUser().getRoles());
		System.out.println(searchKeyword);
		if(!principal.getUser().getRoles().equals(RoleType.ADMIN)) {
			return null;
		}
		/* Specification을 사용하여 쿼리 조건 추가 */
		Specification<User> spec = (root, query, criteriaBuilder) -> null;
		spec = spec.and(AdminSpecification.userRole(RoleType.USER));
		System.out.println(searchType);
		if(category.equals("user")) {
			if(!searchType.isEmpty()) {
				if(searchType.equals("username")) {
					spec = spec.and(AdminSpecification.searchTypeUsername(searchKeyword));
				} else if(searchType.equals("name")){
					spec = spec.and(AdminSpecification.searchTypeName(searchKeyword));
				}	else if(searchType.equals("email")){
					spec = spec.and(AdminSpecification.searchTypeEmail(searchKeyword));
				}
			}
			
			model.addAttribute("users", userRepository.findAll(spec, pageable));
		}
		System.out.println(principal.getUser().getRoles().equals(RoleType.ADMIN));
		model.addAttribute("category", category);
		System.out.println(principal.getUser().getRoles().equals(RoleType.ADMIN));
		return "user/adminPage";
	}
	
	@GetMapping("/api/board/{userid}")
	public ResponseEntity<?> findBoardByUser(@PathVariable("userid") Long id) {

	    List<BoardModal> boardModalDtoList = boardService.findBoardByUser(id);

	    return new ResponseEntity<>(boardModalDtoList, HttpStatus.OK);
	}
	@GetMapping("/api/reply/{userid}")
	public ResponseEntity<?> findReplyByUser(@PathVariable("userid") Long id) {

	    List<ReplyModal> replyModalDtoList = boardService.findReplyByUser(id);

	    return new ResponseEntity<>(replyModalDtoList, HttpStatus.OK);
	}
	@GetMapping("/api/product/{userid}")
	public ResponseEntity<?> findDonatorsByUser(@PathVariable("userid") Long id) {

	    List<DonatorsModal> donatorsModalDtoList = productService.findDonatorsByUser(id);

	    return new ResponseEntity<>(donatorsModalDtoList, HttpStatus.OK);
	}
	
	
	
	
	
}

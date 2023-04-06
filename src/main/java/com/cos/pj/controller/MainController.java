package com.cos.pj.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cos.pj.model.UploadFiles;
import com.cos.pj.repository.UploadRepository;
import com.cos.pj.service.UploadService;
import com.cos.pj.specification.SearchSpecification;

@Controller
public class MainController {
	
	/*
	 * @Autowired private ProductRepository productRepository;
	 */
	

	
	@Autowired
	private UploadRepository uploadRepository;
	
	@Autowired
	private UploadService uploadService;
	



	@GetMapping({"","/"})
	//인증이 필요없는 곳에 /auth를 붙인다.
	public String index() {
		return "index";
	}
	
	@GetMapping({"/funding"})
	//인증이 필요없는 곳에 /auth를 붙인다.
	public String funding() {
		return "funding";
	}
	

	@GetMapping("/auth/faq")
	public String faq() {
		return "faq";
	}
	@GetMapping("/information")
	public String information() {
		return "information";
	}
	
	
	

	//https://dev-setung.tistory.com/20
	// @RequestParam(value = "searchKeyword", required = false) String searchKeyword
	
	

	
	
	
	@GetMapping("/myPage")
	public String myPage() {
		return "myPage";
	}

	/*
	 * @GetMapping("/myPurchasedList") public String myPurchasedList(Model model) {
	 * List<Product> product = productRepository.findAll();
	 * 
	 * model.addAttribute("product", product);
	 * 
	 * return "myPurchasedList"; }
	 */
	
	@GetMapping("/auth/findLoc")
	public String findLoc() {
		return "findLoc";
	}
	@GetMapping("/cart")
	public String cart() {
		return "cart";
	}
	@GetMapping("/searchUpload")
	public String searchUpload() {
		return "searchUpload";
	}
	
	
	@GetMapping("/auth/aChildHead")
	//인증이 필요없는 곳에 /auth를 붙인다.
	public String aChildHead() {
		return "aChildHead";
	}
	
	@GetMapping("/auth/seniorCitizen")
	//인증이 필요없는 곳에 /auth를 붙인다.
	public String seniorCitizen() {
		return "seniorCitizen";
	}
	
	@GetMapping("/auth/singleParent")
	//인증이 필요없는 곳에 /auth를 붙인다.
	public String singleParent() {
		return "singleParent";
	}
//	@GetMapping("/user/adminPage")
//	//인증이 필요없는 곳에 /auth를 붙인다.
//	public String adminPage() {
//		return "user/adminPage";
//	}

	
}

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
import com.cos.pj.repository.ProductRepository;
import com.cos.pj.repository.UploadRepository;
import com.cos.pj.service.ProductService;
import com.cos.pj.service.UploadService;
import com.cos.pj.specification.SearchSpecification;

@Controller
public class ProductController {
	@Autowired
	private UploadRepository uploadRepository;
	
	@Autowired
	private UploadService uploadService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductRepository productRepository;
	
	@GetMapping("/payment")
	public String saveBuy(/* Product product,@AuthenticationPrincipal PrincipalDetail principal */) {
		/* productService.구매하기(product,principal.getUser()); */
		return "/payment";
	}
	
	@GetMapping("/search")
	public String search(Model model,@PageableDefault(size=6,sort="id",direction=Sort.Direction.DESC) Pageable pageable,
			@RequestParam(value="genSelect", required = false) String genSelect,
			@RequestParam(value="min_bir", required = false) String min_bir,
			@RequestParam(value="max_bir", required = false) String max_bir,
			@RequestParam(value="area_select", required = false) String area_select) {
		
		Specification<UploadFiles> spec = (root, query, criteriaBuilder) -> null;
		
		if((genSelect!=null)||(max_bir!=null)||(min_bir!=null)||(area_select!=null)) {
			System.out.println(genSelect);
			System.out.println(min_bir);
			System.out.println(max_bir);
			System.out.println(area_select);

		spec=spec.and(SearchSpecification.searchTotal(genSelect,max_bir,min_bir,area_select));		
				}
			
		
		model.addAttribute("uploadFiles", uploadRepository.findAll(spec, pageable));
		return "search";
	}
	
	

}
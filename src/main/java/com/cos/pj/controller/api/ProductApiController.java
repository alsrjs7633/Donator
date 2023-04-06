package com.cos.pj.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.pj.config.auth.PrincipalDetail;
import com.cos.pj.dto.ResponseDto;
import com.cos.pj.model.Product;
import com.cos.pj.service.ProductService;

@RestController
public class ProductApiController {
	@Autowired
	private ProductService productService;
	
	@PostMapping("/payment")
	public ResponseDto<Integer> paymentregister(@RequestBody Product product, @AuthenticationPrincipal PrincipalDetail principal){
		System.out.println("payment pname 호출"+product.getPayName());
		System.out.println("payment pprice 호출"+product.getPayPrice());
		System.out.println("payment pchoice 호출"+product.getPayChoice());
		
		productService.구매하기(product, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(),1);
	}

}

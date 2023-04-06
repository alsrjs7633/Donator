package com.cos.pj.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.pj.model.DonatorsModal;
import com.cos.pj.model.Product;
import com.cos.pj.model.ReplyModal;
import com.cos.pj.model.Users;
import com.cos.pj.repository.ProductRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor 
@Service
public class ProductService {
	@Autowired
	private ProductRepository productRepository;
	
	@Transactional
	public void 구매하기(Product product, Users user) {
		Product products = new Product();
		products.setPayPrice(product.getPayPrice());
		products.setUsers(user);
		products.setPayChoice(product.getPayChoice());
		products.setPayName(product.getPayName());
		
		System.out.println("TTTTTTTTT"+products.getPayPrice());
		System.out.println("TTTTTTTTT"+products.getPayName());
		System.out.println("TTTTTTTTT"+products.getPayChoice());
		productRepository.save(products);
	}
	
	@Transactional(readOnly = true)
	public List<DonatorsModal> findDonatorsByUser(Long id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
	    List<Product> product = productRepository.findByUserId(id);
	    List<DonatorsModal> donatorsModalDtoList = new ArrayList<>();

	    for(int i = 0; i < product.size(); i++) {
	    	String strTimestamp = sdf.format(product.get(i).getCreateDate());
	        DonatorsModal donatorsModalDto = DonatorsModal.builder()
	                .id(product.get(i).getId())
	                .payChoice(product.get(i).getPayChoice())
	                .payName(product.get(i).getPayName())
	                .payPrice(product.get(i).getPayPrice())
	                .create_date(strTimestamp)
	                .build();

	        donatorsModalDtoList.add(donatorsModalDto);
	    }
	    System.out.println("++++++++++++++"+donatorsModalDtoList);
	    return donatorsModalDtoList;
	}

	/*
	 * public Object 구매하기(Pageable pageable) { // TODO Auto-generated method stub
	 * return null; }
	 */


}

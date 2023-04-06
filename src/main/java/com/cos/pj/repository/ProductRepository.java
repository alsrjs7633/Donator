package com.cos.pj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.pj.model.Product;
import com.cos.pj.model.Reply;


public interface ProductRepository extends JpaRepository<Product, Integer> {
	@Query(value = "SELECT * FROM product WHERE userid = :userid ORDER BY id DESC", nativeQuery = true)
	List<Product> findByUserId(Long userid);
}

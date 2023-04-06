package com.cos.pj.specification;

import org.springframework.data.jpa.domain.Specification;

import com.cos.pj.model.Boards;

public class BoardSearchSpecification {
	
	public static Specification<Boards> searchTitle(String title) {//users의 gender와 genSelect 비교
		return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("title"), "%" + title + "%");
    }
	
}

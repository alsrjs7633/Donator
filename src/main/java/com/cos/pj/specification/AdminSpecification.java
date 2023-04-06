package com.cos.pj.specification;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.userdetails.User;

import com.cos.pj.model.RoleType;

public class AdminSpecification {
	public static Specification<User> searchTypeUsername(String searchKeyword) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("username"), "%" + searchKeyword + "%");
    }
	
	public static Specification<User> searchTypeName(String searchKeyword) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("name"), "%" + searchKeyword + "%");
    }
	
	public static Specification<User> searchTypeEmail(String searchKeyword) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("email"), "%" + searchKeyword + "%");
    }
	
	public static Specification<User> userRole(RoleType roles) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get("roles"), roles);
	}
}

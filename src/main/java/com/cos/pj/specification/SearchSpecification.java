package com.cos.pj.specification;




import javax.persistence.criteria.Predicate;

import org.springframework.data.jpa.domain.Specification;

import com.cos.pj.model.UploadFiles;

public class SearchSpecification {
//	public static Specification<UploadFiles> searchTypeGender(String genSelect) {//users의 gender와 genSelect 비교
//        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("users").get("gender"),"%"+genSelect+"%");
//    }
//	public static Specification<UploadFiles> searchTypeMin_Bir(String min_bir) {//users의 gender와 genSelect 비교
//        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThan(root.get("users").get("birth"),min_bir);
//    }
//	public static Specification<UploadFiles> searchTypeMax_Bir(String max_bir) {//users의 gender와 genSelect 비교
//        return (root, query, criteriaBuilder) -> criteriaBuilder.lessThan(root.get("users").get("birth"),max_bir);
//    }
//	public static Specification<UploadFiles> searchTypeArea(String area_select) {//users의 gender와 genSelect 비교
//        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get("users").get("area"),"%"+area_select+"%");
//    }
	public static Specification<UploadFiles> searchTotal(String genSelect,String max_bir,String min_bir,String area_select) {//users의 gender와 genSelect 비교
		return (root, query, criteriaBuilder) -> {
			Predicate searchGender =criteriaBuilder.like(root.get("users").get("gender"),"%"+genSelect+"%");
			Predicate searchMin_Bir =criteriaBuilder.greaterThan(root.get("users").get("birth"),min_bir);
			Predicate searchMax_Bir =criteriaBuilder.lessThan(root.get("users").get("birth"),max_bir);
			Predicate searchArea =criteriaBuilder.like(root.get("users").get("area"),"%"+area_select+"%");
			Predicate searchTotal=criteriaBuilder.and(searchGender,searchMin_Bir,searchMax_Bir,searchArea);
			return searchTotal;

        };
    }

}

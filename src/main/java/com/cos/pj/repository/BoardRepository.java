package com.cos.pj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.cos.pj.model.Boards;


public interface BoardRepository  extends JpaRepository<Boards, Integer>,JpaSpecificationExecutor<Boards>{

//	List<Boards> findByUserId(Long id);
	@Query(value = "SELECT * FROM boards WHERE userid = :userid ORDER BY id DESC", nativeQuery = true)
	List<Boards> findByUserId(Long userid);


}

package com.cos.pj.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.pj.model.Reply;

public interface ReplyRepository  extends JpaRepository<Reply, Integer> {
	@Query(value = "SELECT * FROM reply WHERE userid = :userid ORDER BY id DESC", nativeQuery = true)
	List<Reply> findByUserId(Long userid);
}

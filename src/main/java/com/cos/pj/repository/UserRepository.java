package com.cos.pj.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.security.core.userdetails.User;

import com.cos.pj.model.Users;


//jsp의 DAO
//자동으로 bean 등록


public interface UserRepository extends JpaRepository<Users,Integer>, JpaSpecificationExecutor<User>{

	
	//회원찾기 할 때 쓰이는 것이다.
	Optional<Users> findByUsername(String username);
	boolean existsByUsername(String username);
	


}

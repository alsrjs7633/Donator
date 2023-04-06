package com.cos.pj.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cos.pj.model.RoleType;
import com.cos.pj.model.Users;
import com.cos.pj.repository.UserRepository;

@Service
public class UserService{
	
	@Autowired
	private UserRepository userRepository;
	
	
	
	@Autowired
	private BCryptPasswordEncoder encodeer;
	
	@Transactional(readOnly=true)
	public Users 회원찾기(String username) {
		Users user=userRepository.findByUsername(username).orElseGet(()->{
			return new Users();
		});
		return user;
	}
	
	
	@Transactional
	public void 회원가입(Users user) {
		String rawPassword =user.getPassword();
		String encPassword = encodeer.encode(rawPassword);
		user.setPassword(encPassword);
		user.setRoles(RoleType.ADMIN);
		userRepository.save(user); //하나의 트랜젝션
	}
	@Transactional
	public void 회원삭제(int id) {
		userRepository.deleteById(id);
	}

	
	
	

}

package com.cos.pj.service;

import com.cos.pj.model.Application;
import com.cos.pj.repository.ApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.cos.pj.model.UploadFiles;
import com.cos.pj.model.Users;
import com.cos.pj.repository.UploadRepository;
import com.sun.istack.Nullable;

@Service
public class UploadService {
	
	@Autowired
	private UploadRepository uploadRepository;
	@Autowired
	private ApplicationRepository applicationRepostiory;
	
	@Transactional
	public void 업로드(String saveFile, Users user, MultipartFile multi){//이미지 이름
		UploadFiles uploadfile = new UploadFiles();
		uploadfile.setDbFileName(saveFile);
		uploadfile.setUsers(user);
		uploadfile.setUploadFileName(multi.getOriginalFilename());
		uploadRepository.save(uploadfile);
	}
	@Transactional
	public void 업로드2(String saveFile, Users user, MultipartFile multi,String area_select,String userBirth, String genderch){//이미지 이름
		Application application = new Application();
		application.setDbFileName(saveFile);
		application.setArea(area_select);
		application.setBirth(userBirth);
		application.setGender(genderch);
		application.setUsers(user);
		application.setUploadFileName(multi.getOriginalFilename());
		applicationRepostiory.save(application);
	}
	

	public Page<UploadFiles> 글목록(Pageable pageable){
		
		return uploadRepository.findAll(pageable);
	}
	
		 
		
	
	
}

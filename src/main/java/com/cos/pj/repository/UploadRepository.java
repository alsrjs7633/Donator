package com.cos.pj.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.cos.pj.model.UploadFiles;

public interface UploadRepository extends JpaRepository<UploadFiles,Long>,JpaSpecificationExecutor<UploadFiles>{
	

	
	
	

}

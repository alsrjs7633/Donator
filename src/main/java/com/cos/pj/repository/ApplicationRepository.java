package com.cos.pj.repository;

import com.cos.pj.model.Application;
import com.cos.pj.model.Boards;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApplicationRepository  extends JpaRepository<Application, Integer> {

}

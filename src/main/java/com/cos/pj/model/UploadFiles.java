package com.cos.pj.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="uploadFiles")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder //빌더 패턴
@Entity
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR_F"
	    , sequenceName = "USER_SEQ_F"
	    , initialValue = 1
	    , allocationSize = 1
	)
public class UploadFiles {
	@Id //기본키
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR_F")
	private int id;
	@OneToOne
	@JoinColumn(name="userId")
	private Users users;
	
	private String uploadFileName;
	private String dbFileName;
	
}

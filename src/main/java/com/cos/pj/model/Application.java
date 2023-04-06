package com.cos.pj.model;

import javax.persistence.Column;
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


@Table(name="application")
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR_AP"
	    , sequenceName = "USER_SEQ_AP"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Data//getter,setter,tostring
@AllArgsConstructor//여기 필드의 모든 생성자
@NoArgsConstructor//기본생성자
@Builder //빌더 패턴
@Entity //Users 클래스가 자동으로 DB에 테이블이 생성이 된다.
//@DynamicInsert //insert시에 null인 필드 제외
public class Application {
	
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR_AP")
	//프로젝트에 연결된 DB의 넘버링 전략을 사용
	private int id;//시퀀스
	
	@OneToOne
	@JoinColumn(name="userId")
	private Users users;

	private String uploadFileName;
	private String dbFileName;
	
	@Column( length=20)
	private String birth;
	
	@Column( length=20)
	private String gender;
	
	@Column( length=10)
	private String area;
	
	
	
}

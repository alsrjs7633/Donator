package com.cos.pj.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="users")
@SequenceGenerator(
		name = "USER_SEQ_GENERATOR"
	    , sequenceName = "USER_SEQ"
	    , initialValue = 1
	    , allocationSize = 1
	)
@Data//getter,setter,tostring
@AllArgsConstructor//여기 필드의 모든 생성자
@NoArgsConstructor//기본생성자
@Builder //빌더 패턴
@Entity //Users 클래스가 자동으로 DB에 테이블이 생성이 된다.
//@DynamicInsert //insert시에 null인 필드 제외
public class Users {
	@Id //primary key
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="USER_SEQ_GENERATOR")
	//프로젝트에 연결된 DB의 넘버링 전략을 사용
	private int id;//시퀀스
	

	
	//로그인 방식 확인
	private String oauth;
	
	@Column(length=30,unique = true)
	private String username;//아이디



	@Column( length=100)//해쉬로 변경하여 암호화 length 크게
	private String password; 
	
	@Column(length=20)
	private String name;
	
	@Column( length=20)
	private String birth;
	
	@Column( length=20)
	private int tel;
	
	@Column( length=50)
	private String email;
	
	@Column( length=20)
	private String gender;
	
	@Column(nullable=true, length=1)
	private int phoneagree;
	
	@Column(nullable=true, length=1)
	private int emailagree;

	@Column( length=10)
	private String area;
	
	@JsonIgnoreProperties({"users"})
	@OneToMany(mappedBy = "users", cascade = CascadeType.REMOVE)
	private List<Boards> boards = new ArrayList<>();
	
	@OneToMany(mappedBy = "users", cascade = CascadeType.REMOVE)
	private List<Reply> replys = new ArrayList<>();
	
	@OneToMany(mappedBy = "users", cascade = CascadeType.REMOVE)
	private List<Product> donators = new ArrayList<>();
	
	public int getBoardCount() {
		return boards.size();
	}
	
	public int getReplyCount() {
		return replys.size();
	}
	
	public int getDonatorsCount() {
		return donators.size();
	}
	
	//@ColumnDefault("'user'")
	@Enumerated(EnumType.STRING)
	private RoleType roles; //Enum을 쓰는게 좋다. //도메인 사용해야해서. 
	//예) admin, user, manager (권한) 셋 중 하나만 
	@CreationTimestamp //시간이 자동으로 입력
	private Timestamp createDate;
}

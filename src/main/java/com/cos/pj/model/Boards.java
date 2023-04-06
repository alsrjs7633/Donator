package com.cos.pj.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Table(name="boards")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@SequenceGenerator(
		name="USER_SEQ_GENERATOR2"
		, sequenceName = "USER_SEQ2"
		, initialValue = 1
		, allocationSize = 1
		)
public class Boards {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="USER_SEQ_GENERATOR2")
	
	private int id;
	
	@Column(nullable=false, length=100)
	private String title;
	
	@Lob
	private String content;
	
	private int count; //조회수
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="userid")
	@OrderBy("id desc")
	private Users users;
	
	@OneToMany(mappedBy = "boards",fetch=FetchType.EAGER,cascade=CascadeType.REMOVE)
	@JsonIgnoreProperties({"boards"})  //무한참조를 하지 않게 하기 위해서 쓴다. reply의 board를 또 호출하지 않게 한다.
	private List<Reply> reply;
	
	@CreationTimestamp
	private Timestamp createDate;

}

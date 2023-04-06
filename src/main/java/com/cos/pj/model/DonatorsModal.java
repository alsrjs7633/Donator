package com.cos.pj.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class DonatorsModal {
	private int id;// 시퀀스

	private String payChoice; // 후원방법

	private String payName; // 상품이름

	private String payPrice; // 후원금액
	
	private String create_date;

}

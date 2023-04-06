package com.cos.pj.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardModal {
	private int id;
	private String title;
	private String create_date;
	private Integer views;
}

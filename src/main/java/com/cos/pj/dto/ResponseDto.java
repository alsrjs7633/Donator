package com.cos.pj.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResponseDto<T> {
	int status; //status란 HTTP 상태 코드로써 특정 HTTP 요청이 성공적으로 완료되었는지 확인하기 위한 변수
	T data;
}

package com.uni.domain;

import lombok.Data;

@Data
public class weatherVO {
	private String baseDate;
	private String baseTime;
	private String category;
	private String fcstDate;
	private String fcstTime;
	private String fcstValue;
	private String nx;
	private String ny;
	
}

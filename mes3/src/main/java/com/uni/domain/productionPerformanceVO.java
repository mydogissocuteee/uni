package com.uni.domain;

import java.util.Date;

import lombok.Data;

@Data
public class productionPerformanceVO {

	private int num;
	private Date productionDate;
	private String shift;
	private String process;
	private String facilities;
	private String product_id;
	private String process_routing_id;
	private String performanceQuantity;
	private String goodProductQuantity;
	private String defectQuantity;
	private String defectCode;
	private String department;
	private String writer;
	private String views;
}

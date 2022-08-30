package com.uni.domain;

import lombok.Data;

@Data
public class workOrderVO {
	private String facilities_code;
	private String facilities_name;
	private String operations_no;
	private String prd_schedule_year;
	private String prd_schedule_month;
	private String prd_schedule_day;
	private String product_id;
	private String product_name;
	private String work_order;
	private String planned_quantity;
	private String performance_quantity;
	private String remarks;
	private String order_no;
	private String order_detail_seq;
	private String company;
}

package com.uni.domain;

import lombok.Data;

@Data
public class workOrderVO {
	private String ord_schedule;
	private String ord_code;
	private String ord_name;
	private String ord_count;
	private String ord_product_id;
	private String ord_product_name;
	private String ord_work;
	private String ord_planned_quantity;
	private String ord_performance_quantity;
	private String ord_remarks;
	private String ord_order_no;
	private String company;
}

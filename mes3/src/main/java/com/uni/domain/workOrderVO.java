package com.uni.domain;

import lombok.Data;

@Data
public class workOrderVO {
	private String wo_num;
	///////추가
	private String wo_production_num;
	private String wo_client_order_num;
	private String wo_goodsnum;
	private String wo_goodsname;
	private String wo_unit;
	private String wo_countt;	
	private String wo_production_date;	
	/////////
	private String wo_process;
	private String wo_process_type;
	private String wo_goods_num;
	private String wo_goods_name;
	private String wo_spec_name;
	private String wo_count;
	private String wo_client;
	private String wo_date;
	private String wo_start_date;
	private String wo_end_date;
	private String company;
}

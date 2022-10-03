package com.uni.domain;

import lombok.Data;

@Data
public class goodsOrderVO {
	
	private String go_num;
	private String go_goods_seq;
	private String go_goods_name;
	private String go_goods_count;
	private String go_client;
	private String go_orderDate;
	private String go_dueDate;
	private String go_place;
	private String go_address;
	private String go_price;
	private String go_amount;
	private String go_taxation;
	private String go_now;
	private String company;
}

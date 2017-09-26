package com.project.kanemochi.vo;

import java.math.BigDecimal;

public class ShopVO {
	private String user_id;
	private BigDecimal img_x;
	private BigDecimal img_y;
	private String img_id;
	
	public ShopVO() {
		super();
	}
	
	public ShopVO(String user_id, BigDecimal img_x, BigDecimal img_y, String img_id) {
		super();
		this.user_id = user_id;
		this.img_x = img_x;
		this.img_y = img_y;
		this.img_id = img_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public BigDecimal getImg_x() {
		return img_x;
	}

	public void setImg_x(BigDecimal img_x) {
		this.img_x = img_x;
	}

	public BigDecimal getImg_y() {
		return img_y;
	}

	public void setImg_y(BigDecimal img_y) {
		this.img_y = img_y;
	}

	public String getImg_id() {
		return img_id;
	}

	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}

	@Override
	public String toString() {
		return "ShopVO [user_id=" + user_id + ", img_x=" + img_x + ", img_y=" + img_y + ", img_id=" + img_id + "]";
	}

	
	
}

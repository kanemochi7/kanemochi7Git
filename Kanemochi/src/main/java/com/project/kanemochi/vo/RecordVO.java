package com.project.kanemochi.vo;

public class RecordVO {
	private int record_num;
	private String user_id;
	private String record_date;
	private String category;
	private String record_tag;
	private int record_price;
	private String record_unit;
	private String record_pay;
	
	public RecordVO() {}

	public RecordVO(int record_num, String user_id, String record_date, String category, String record_tag,
			int record_price, String record_unit, String record_pay) {
		super();
		this.record_num = record_num;
		this.user_id = user_id;
		this.record_date = record_date;
		this.category = category;
		this.record_tag = record_tag;
		this.record_price = record_price;
		this.record_unit = record_unit;
		this.record_pay = record_pay;
	}

	public int getRecord_num() {
		return record_num;
	}

	public void setRecord_num(int record_num) {
		this.record_num = record_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRecord_date() {
		return record_date;
	}

	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getRecord_tag() {
		return record_tag;
	}

	public void setRecord_tag(String record_tag) {
		this.record_tag = record_tag;
	}

	public int getRecord_price() {
		return record_price;
	}

	public void setRecord_price(int record_price) {
		this.record_price = record_price;
	}

	public String getRecord_unit() {
		return record_unit;
	}

	public void setRecord_unit(String record_unit) {
		this.record_unit = record_unit;
	}

	public String getRecord_pay() {
		return record_pay;
	}

	public void setRecord_pay(String record_pay) {
		this.record_pay = record_pay;
	}

	@Override
	public String toString() {
		return "RecordVO [record_num=" + record_num + ", user_id=" + user_id + ", record_date=" + record_date
				+ ", category=" + category + ", record_tag=" + record_tag + ", record_price=" + record_price
				+ ", record_unit=" + record_unit + ", record_pay=" + record_pay + "]";
	}

}

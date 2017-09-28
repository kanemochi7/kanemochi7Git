package com.project.kanemochi.vo;

public class DateCategoryVO {
	String id;
	String start_date;
	String end_date;
	String category;
	
	public DateCategoryVO() {
		super();
	}

	public DateCategoryVO(String id, String start_date, String end_date, String category) {
		super();
		this.id = id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "DateCategoryVO [id=" + id + ", start_date=" + start_date + ", end_date=" + end_date + ", category="
				+ category + "]";
	}
	
}

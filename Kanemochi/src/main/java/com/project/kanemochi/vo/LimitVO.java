package com.project.kanemochi.vo;

public class LimitVO {
	private String user_id;
	private String setDate;
	private String category;
	private int times;
	private int amount;
	
	public LimitVO() {
		super();
	}

	public LimitVO(String id, String setDate, String category, int times, int amount) {
		super();
		this.user_id = id;
		this.setDate = setDate;
		this.category = category;
		this.times = times;
		this.amount = amount;
	}

	public String getId() {
		return user_id;
	}

	public void setId(String id) {
		this.user_id = id;
	}

	public String getSetDate() {
		return setDate;
	}

	public void setSetDate(String setDate) {
		this.setDate = setDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "LimitVO [id=" + user_id + ", setDate=" + setDate + ", category=" + category + ", times=" + times
				+ ", amount=" + amount + "]";
	}
	
}

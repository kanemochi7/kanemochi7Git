package com.project.kanemochi.vo;

public class LimitVO {
	private String user_id;
	private String setDate;
	private String category;
	private int times;
	private int amount;
	private int nowTimes;
	private int nowAmounts;
	
	public LimitVO() {
		super();
	}

	public LimitVO(String id, String setDate, String category, int times, int amount,int nowTimes, int nowAmounts) {
		super();
		this.user_id = id;
		this.setDate = setDate;
		this.category = category;
		this.times = times;
		this.amount = amount;
		this.nowTimes = nowTimes;
		this.nowAmounts = nowAmounts;
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

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getNowTimes() {
		return nowTimes;
	}

	public void setNowTimes(int nowTimes) {
		this.nowTimes = nowTimes;
	}

	public int getNowAmounts() {
		return nowAmounts;
	}

	public void setNowAmounts(int nowAmounts) {
		this.nowAmounts = nowAmounts;
	}

	@Override
	public String toString() {
		return "LimitVO [user_id=" + user_id + ", setDate=" + setDate + ", category=" + category + ", times=" + times
				+ ", amount=" + amount + ", nowTimes=" + nowTimes + ", nowAmounts=" + nowAmounts + "]";
	}
	
}

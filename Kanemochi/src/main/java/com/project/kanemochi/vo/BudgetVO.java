package com.project.kanemochi.vo;

public class BudgetVO {
	private int record_num;
	private String user_id;
	private int budget;
	private int monthly;
	private int weekly;
	private int daily;
	
	public BudgetVO() {}

	public BudgetVO(int record_num, String user_id, int budget, int monthly, int weekly, int daily) {
		this.record_num = record_num;
		this.user_id = user_id;
		this.budget = budget;
		this.monthly = monthly;
		this.weekly = weekly;
		this.daily = daily;
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

	public int getBudget() {
		return budget;
	}

	public void setBudget(int budget) {
		this.budget = budget;
	}

	public int getMonthly() {
		return monthly;
	}

	public void setMonthly(int monthly) {
		this.monthly = monthly;
	}

	public int getWeekly() {
		return weekly;
	}

	public void setWeekly(int weekly) {
		this.weekly = weekly;
	}

	public int getDaily() {
		return daily;
	}

	public void setDaily(int daily) {
		this.daily = daily;
	}

	@Override
	public String toString() {
		return "BudgetVO [record_num=" + record_num + ", user_id=" + user_id + ", budget="
				+ budget + ", monthly=" + monthly + ", weekly=" + weekly + ", daily=" + daily + "]";
	}
}

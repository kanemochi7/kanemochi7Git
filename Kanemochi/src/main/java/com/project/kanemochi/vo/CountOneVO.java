package com.project.kanemochi.vo;

public class CountOneVO {
	private String user_id;
	private String category;
	private int count;
	
	public CountOneVO() {
		super();
	}

	public CountOneVO(String user_id, String category, int count) {
		super();
		this.user_id = user_id;
		this.category = category;
		this.count = count;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CountOneVO [user_id=" + user_id + ", category=" + category + ", count=" + count + "]";
	}

}

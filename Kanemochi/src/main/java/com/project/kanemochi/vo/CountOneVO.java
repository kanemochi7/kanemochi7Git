package com.project.kanemochi.vo;

public class CountOneVO {
	private String category;
	private int count;
	
	public CountOneVO() {
		super();
	}

	public CountOneVO(String category, int count) {
		super();
		this.category = category;
		this.count = count;
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
		return "CountOneVO [category=" + category + ", count=" + count + "]";
	}
	
}

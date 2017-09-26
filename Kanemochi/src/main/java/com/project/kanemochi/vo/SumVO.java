package com.project.kanemochi.vo;

public class SumVO {
	private String id;
	private int sum;

	public SumVO() {
		super();
	}
	
	public SumVO(String id, int sum) {
		super();
		this.id = id;
		this.sum = sum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "ExpVO [id=" + id + ", sum=" + sum + "]";
	}
	
}

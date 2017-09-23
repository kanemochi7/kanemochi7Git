package com.project.kanemochi.vo;

public class ExpVO {
	private String id;
	private int exp;

	public ExpVO() {
		super();
	}
	
	public ExpVO(String id, int exp) {
		super();
		this.id = id;
		this.exp = exp;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getExp() {
		return exp;
	}

	public void setExp(int exp) {
		this.exp = exp;
	}

	@Override
	public String toString() {
		return "ExpVO [id=" + id + ", exp=" + exp + "]";
	}
	
}

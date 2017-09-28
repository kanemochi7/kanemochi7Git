package com.project.kanemochi.vo;

public class BubbleVO {
	private String tag; //태그
	private int visit; //방문횟수
	private int avg; //평균가격
	private int sum; //기간총가격(방문횟수visit*avg평균가격)
	
	public BubbleVO() {
		super();
	}

	public BubbleVO(String tag, int visit, int avg, int sum) {
		super();
		this.tag = tag;
		this.visit = visit;
		this.avg = avg;
		this.sum = sum;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public int getVisit() {
		return visit;
	}

	public void setVisit(int visit) {
		this.visit = visit;
	}

	public int getAvg() {
		return avg;
	}

	public void setAvg(int avg) {
		this.avg = avg;
	}

	public int getSum() {
		return sum;
	}

	public void setSum(int sum) {
		this.sum = sum;
	}

	@Override
	public String toString() {
		return "BubbleVO [tag=" + tag + ", visit=" + visit + ", avg=" + avg + ", sum=" + sum + "]";
	}
	
}

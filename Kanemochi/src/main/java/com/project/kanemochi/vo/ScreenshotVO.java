package com.project.kanemochi.vo;

import java.sql.Date;

public class ScreenshotVO {
	private int screenshot_num;
	private String user_id;
	private Date shotdate;
	private String screenshot_url;
	
	public ScreenshotVO() {}

	public ScreenshotVO(int screenshot_num, String user_id, Date shotdate, String screenshot_url) {
		this.screenshot_num = screenshot_num;
		this.user_id = user_id;
		this.shotdate = shotdate;
		this.screenshot_url = screenshot_url;
	}

	public int getScreenshot_num() {
		return screenshot_num;
	}

	public void setScreenshot_num(int screenshot_num) {
		this.screenshot_num = screenshot_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getShotdate() {
		return shotdate;
	}

	public void setShotdate(Date shotdate) {
		this.shotdate = shotdate;
	}

	public String getScreenshot_url() {
		return screenshot_url;
	}

	public void setScreenshot_url(String screenshot_url) {
		this.screenshot_url = screenshot_url;
	}

	@Override
	public String toString() {
		return "ScreenshotVO [screenshot_num=" + screenshot_num + ", user_id=" + user_id + ", shotdate=" + shotdate
				+ ", screenshot_url=" + screenshot_url + "]";
	}
}

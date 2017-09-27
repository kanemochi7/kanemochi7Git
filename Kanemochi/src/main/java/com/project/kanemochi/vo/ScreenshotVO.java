package com.project.kanemochi.vo;

public class ScreenshotVO {
	private int screenshot_num;
	private String user_id;
	private String shotdate;
	private String screenshotData;
	
	public ScreenshotVO() {}

	public ScreenshotVO(int screenshot_num, String user_id, String shotdate, String screenshotData) {
		super();
		this.screenshot_num = screenshot_num;
		this.user_id = user_id;
		this.shotdate = shotdate;
		this.screenshotData = screenshotData;
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

	public String getShotdate() {
		return shotdate;
	}

	public void setShotdate(String shotdate) {
		this.shotdate = shotdate;
	}

	public String getScreenshotData() {
		return screenshotData;
	}

	public void setScreenshotData(String screenshotData) {
		this.screenshotData = screenshotData;
	}

	@Override
	public String toString() {
		return "ScreenshotVO [screenshot_num=" + screenshot_num + ", user_id=" + user_id + ", shotdate=" + shotdate
				+ ", screenshotData=" + screenshotData + "]";
	}
	
}

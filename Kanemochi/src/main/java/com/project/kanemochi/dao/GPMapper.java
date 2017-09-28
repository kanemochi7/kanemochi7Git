package com.project.kanemochi.dao;

import java.util.ArrayList;

import com.project.kanemochi.vo.ScreenshotVO;

public interface GPMapper {
	public void saveScreenshot(ScreenshotVO scVO);
	//public ScreenshotVO printScreenshot();
	public ArrayList<ScreenshotVO>printScreenshotAll(String user_id);
}

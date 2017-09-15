package com.project.kanemochi.dao;

import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.RecordVO;

public interface RecordMapper {
	public void input(RecordVO vo);
	public void upcount(RecordVO vo);
	public void downcount(CountOneVO vo);
	public int getcount(CountOneVO vo);
}

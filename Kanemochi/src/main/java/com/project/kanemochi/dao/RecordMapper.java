package com.project.kanemochi.dao;


import java.util.ArrayList;
import java.util.Map;

import com.project.kanemochi.vo.CountOneVO;
import com.project.kanemochi.vo.MemberVO;
import com.project.kanemochi.vo.RecordVO;


public interface RecordMapper {
	public void input(RecordVO vo);
	public void upcount(RecordVO vo);
	public void downcount(CountOneVO vo);
	public int getcount(RecordVO vo);

}

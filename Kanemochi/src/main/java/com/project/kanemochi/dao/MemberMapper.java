package com.project.kanemochi.dao;


import java.util.ArrayList;
import java.util.Map;

import com.project.kanemochi.vo.MemberVO;


public interface MemberMapper {
	
	public int signUp(MemberVO vo);
	public int charUpdate(Map<String, String> map);
	public MemberVO login(MemberVO vo);
	public MemberVO checkId(String id);
	public ArrayList<MemberVO> memberList();
}

package com.project.kanemochi.dao;


import java.util.ArrayList;
import java.util.Map;

import com.project.kanemochi.vo.MemberVO;


public interface MemberMapper {
	
	public int signUp(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public MemberVO checkId(String id);
	public MemberVO checkEmail(String user_email);
	public MemberVO findPw(MemberVO vo);
	public MemberVO findId(MemberVO vo);
	public ArrayList<MemberVO> memberList();
	public MemberVO getMember(String id);
	public int updateMember(MemberVO vo);
	public int deleteMember(String user_id);
	public void insertCount(MemberVO vo);
	public void insertBudget(MemberVO vo);
	public void insertLogin(MemberVO vo);
	public void insertRecord(MemberVO vo);
}

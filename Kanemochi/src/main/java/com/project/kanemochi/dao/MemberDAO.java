package com.project.kanemochi.dao;

import java.util.ArrayList;
import java.util.Map;

import com.project.kanemochi.vo.MemberVO;


public interface MemberDAO {
	public int signUp(MemberVO vo);
	public MemberVO login(MemberVO vo);
	public MemberVO checkId(String id);
	public MemberVO getMember(String id);
	public MemberVO checkEmail(String user_email);
	public ArrayList<MemberVO> memberList();
	public MemberVO findPw(MemberVO vo);
	public MemberVO findId(MemberVO vo);
	public int updateMember(MemberVO vo);
	public int deleteMember(String user_id);
}

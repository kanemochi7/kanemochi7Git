package com.project.kanemochi.vo;

public class MemberVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_gender;
	private String user_phone;
	private String user_email;
	private int user_authority;
	private String img_id;
	private String level_title;
	
	public MemberVO () {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String user_id, String user_pw, String user_name, String user_gender, String user_phone,
			String user_email, int user_authority, String img_id, String level_title) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_gender = user_gender;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_authority = user_authority;
		this.img_id = img_id;
		this.level_title = level_title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public int getUser_authority() {
		return user_authority;
	}

	public void setUser_authority(int user_authority) {
		this.user_authority = user_authority;
	}

	public String getImg_id() {
		return img_id;
	}

	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}

	public String getLevel_title() {
		return level_title;
	}

	public void setLevel_title(String level_title) {
		this.level_title = level_title;
	}

	@Override
	public String toString() {
		return "MemberVO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_gender="
				+ user_gender + ", user_phone=" + user_phone + ", user_email=" + user_email + ", user_authority="
				+ user_authority + ", img_id=" + img_id + ", level_title=" + level_title + "]";
	}
	
	
	
}

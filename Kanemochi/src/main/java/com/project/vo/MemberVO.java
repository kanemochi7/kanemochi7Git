package com.project.vo;

public class MemberVO {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String phone;
	private String email;
	private int authority;
	private String img_id;
	private String level_title;
	
	public MemberVO () {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberVO (String id, String pwd, String name, String gender, String phone, String email, int authority,
			String img_id, String level_title) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.authority = authority;
		this.img_id = img_id;
		this.level_title = level_title;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}

	@Override
	public String toString() {
		return "member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", phone=" + phone
				+ ", email=" + email + ", authority=" + authority + ", img_id=" + img_id + ", level_title="
				+ level_title + "]";
	}
	
}

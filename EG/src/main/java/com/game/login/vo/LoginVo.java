package com.game.login.vo;

public class LoginVo {

	private String uid;
	private String password;
	private String pwCheck;
	private String kakaoCheck;
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPwCheck() {
		return pwCheck;
	}
	public void setPwCheck(String pwCheck) {
		this.pwCheck = pwCheck;
	}
	public String getKakaoCheck() {
		return kakaoCheck;
	}
	public void setKakaoCheck(String kakaoCheck) {
		this.kakaoCheck = kakaoCheck;
	}

}

package com.kh.meetAgain.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 109L;
	private String userid;
	private String username;
	private String usernwd;
	private String addess1;
	private String address2;
	private String address3;
	private String nickName;
	private Date birthday;
	private char gender;
	private String email;
	private String phone;
	private int mlevel;
	private Date enrolldate;
	private Date wddate;
	private char wd_yn;
	private char out_yn;
	private int warn_cnt;
	private char stop_yna;
	private Date stop_time;
	
	public Member() {}

	public Member(String userid, String username, String usernwd, String addess1, String address2, String address3,
			String nickName, Date birthday, char gender, String email, String phone, int mlevel, Date enrolldate,
			Date wddate, char wd_yn, char out_yn, int warn_cnt, char stop_yna, Date stop_time) {
		super();
		this.userid = userid;
		this.username = username;
		this.usernwd = usernwd;
		this.addess1 = addess1;
		this.address2 = address2;
		this.address3 = address3;
		this.nickName = nickName;
		this.birthday = birthday;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.mlevel = mlevel;
		this.enrolldate = enrolldate;
		this.wddate = wddate;
		this.wd_yn = wd_yn;
		this.out_yn = out_yn;
		this.warn_cnt = warn_cnt;
		this.stop_yna = stop_yna;
		this.stop_time = stop_time;
	}

	@Override
	public String toString() {
		return "Member [userid=" + userid + ", username=" + username + ", usernwd=" + usernwd + ", addess1=" + addess1
				+ ", address2=" + address2 + ", address3=" + address3 + ", nickName=" + nickName + ", birthday="
				+ birthday + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", mlevel=" + mlevel
				+ ", enrolldate=" + enrolldate + ", wddate=" + wddate + ", wd_yn=" + wd_yn + ", out_yn=" + out_yn
				+ ", warn_cnt=" + warn_cnt + ", stop_yna=" + stop_yna + ", stop_time=" + stop_time + "]";
	}

	public String getUserid() {
		return userid;
	}

	public String getUsername() {
		return username;
	}

	public String getUsernwd() {
		return usernwd;
	}

	public String getAddess1() {
		return addess1;
	}

	public String getAddress2() {
		return address2;
	}

	public String getAddress3() {
		return address3;
	}

	public String getNickName() {
		return nickName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public char getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public int getMlevel() {
		return mlevel;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public Date getWddate() {
		return wddate;
	}

	public char getWd_yn() {
		return wd_yn;
	}

	public char getOut_yn() {
		return out_yn;
	}

	public int getWarn_cnt() {
		return warn_cnt;
	}

	public char getStop_yna() {
		return stop_yna;
	}

	public Date getStop_time() {
		return stop_time;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setUsernwd(String usernwd) {
		this.usernwd = usernwd;
	}

	public void setAddess1(String addess1) {
		this.addess1 = addess1;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public void setWddate(Date wddate) {
		this.wddate = wddate;
	}

	public void setWd_yn(char wd_yn) {
		this.wd_yn = wd_yn;
	}

	public void setOut_yn(char out_yn) {
		this.out_yn = out_yn;
	}

	public void setWarn_cnt(int warn_cnt) {
		this.warn_cnt = warn_cnt;
	}

	public void setStop_yna(char stop_yna) {
		this.stop_yna = stop_yna;
	}

	public void setStop_time(Date stop_time) {
		this.stop_time = stop_time;
	}
	
}

package org.jsp.enotes.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer userId;
	@Column(length = 50, nullable = false)
	private String fullName;
	@Column(length = 50, nullable = false, unique = true)
	private String email;
	@Column(length = 10, nullable= false, unique = true)
	private String mobile;
	@Column(length = 50, nullable = false)
	private String education;
	@Column(length = 50, nullable = false)
	private String password;
	
	public User() {
		
	}
	
	public User(Integer userId, String fullName, String email, String mobile, String education, String password) {
		this.userId = userId;
		this.fullName = fullName;
		this.email = email;
		this.mobile = mobile;
		this.education = education;
		this.password = password;
	}



	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", fullName=" + fullName + ", email=" + email + ", mobile=" + mobile
				+ ", education=" + education + ", password=" + password + "]";
	}

}

package com.zhning.cloud.Model;

public class User {
	private int id;
	private String username;
	private String password;
	private String email;
	private String root;
	private int isvip=1;
	private String comment;
	private String role;
	private String port;
	private boolean state;
	private boolean isdelect;
	private boolean isadmin;

	public boolean isIsdelect() {
		return isdelect;
	}

	public void setIsdelect(boolean isdelect) {
		this.isdelect = isdelect;
	}

	public boolean isIsadmin() {
		return isadmin;
	}

	public void setIsadmin(boolean isadmin) {
		this.isadmin = isadmin;
	}

	public int getIsvip() {
		return isvip;
	}

	public void setIsvip(int isvip) {
		this.isvip = isvip;
	}

	public User() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRoot() {
		return root;
	}

	public void setRoot(String root) {
		this.root = root;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", email='" + email + '\'' +
				", root='" + root + '\'' +
				", isvip=" + isvip +
				", comment='" + comment + '\'' +
				", role='" + role + '\'' +
				", port='" + port + '\'' +
				", state=" + state +
				", isdelect=" + isdelect +
				", isadmin=" + isadmin +
				'}';
	}
}

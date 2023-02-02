package com.zhning.cloud.Model;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.sql.Date;

@Component("file")
@Scope("prototype")
public class File {
	
	private int id;
	private String filename;
	private String filepath;
	private String filesize;
	private Date createtime;

	private int canshare;
	private int user_id;
	private int sharenums;
	private boolean  garbage=false;
	private String MD5;

	public int getSharenums() {
		return sharenums;
	}

	public void setSharenums(int sharenums) {
		this.sharenums = sharenums;
	}

	public boolean isGarbage() {
		return garbage;
	}

	public void setGarbage(boolean garbage) {
		this.garbage = garbage;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public int getCanshare() {
		return canshare;
	}
	public void setCanshare(int canshare) {
		this.canshare = canshare;
	}


	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getMD5() {
		return MD5;
	}

	public void setMD5(String MD5) {
		this.MD5 = MD5;
	}

	@Override
	public String toString() {
		return "File{" +
				"id=" + id +
				", filename='" + filename + '\'' +
				", filepath='" + filepath + '\'' +
				", filesize='" + filesize + '\'' +
				", createtime=" + createtime +
				", canshare=" + canshare +
				", user_id=" + user_id +
				", sharenums=" + sharenums +
				", garbage=" + garbage +
				", MD5='" + MD5 + '\'' +
				'}';
	}
}

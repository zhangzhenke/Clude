package com.zhning.cloud.Model;

import java.sql.Date;

public class Apply {
    private int id;
    private String applymanname;
    private String applydesc;
    private String comment;
    private int user_id;
    private Date createtime;
    private  boolean isvip;
    private  boolean isadmin;
    private  boolean isdelect;

    public boolean isIsvip() {
        return isvip;
    }

    public void setIsvip(boolean isvip) {
        this.isvip = isvip;
    }

    public boolean isIsadmin() {
        return isadmin;
    }

    public void setIsadmin(boolean isadmin) {
        this.isadmin = isadmin;
    }

    public boolean isIsdelect() {
        return isdelect;
    }

    public void setIsdelect(boolean isdelect) {
        this.isdelect = isdelect;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApplymanname() {
        return applymanname;
    }

    public void setApplymanname(String applymanname) {
        this.applymanname = applymanname;
    }

    public String getApplydesc() {
        return applydesc;
    }

    public void setApplydesc(String applydesc) {
        this.applydesc = applydesc;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Apply() {
    }

    
}

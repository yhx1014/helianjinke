package org.ht.pojo;

import java.util.Date;

public class User {
    private Integer uid;

    private String username;

    private String password;

    private String avatar;

    private String nickname;

    private String mailbox;

    private String phonenumber;

    private String assetsPwd;

    private Date registerDate;

    private Date lastestLoginTime;

    private String latestLoginIp;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar == null ? null : avatar.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getMailbox() {
        return mailbox;
    }

    public void setMailbox(String mailbox) {
        this.mailbox = mailbox == null ? null : mailbox.trim();
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber == null ? null : phonenumber.trim();
    }

    public String getAssetsPwd() {
        return assetsPwd;
    }

    public void setAssetsPwd(String assetsPwd) {
        this.assetsPwd = assetsPwd == null ? null : assetsPwd.trim();
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public Date getLastestLoginTime() {
        return lastestLoginTime;
    }

    public void setLastestLoginTime(Date lastestLoginTime) {
        this.lastestLoginTime = lastestLoginTime;
    }

    public String getLatestLoginIp() {
        return latestLoginIp;
    }

    public void setLatestLoginIp(String latestLoginIp) {
        this.latestLoginIp = latestLoginIp == null ? null : latestLoginIp.trim();
    }
}
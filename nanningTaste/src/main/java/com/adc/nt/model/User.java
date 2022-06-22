package com.adc.nt.model;

public class User {
    private int u_id;//用户id
    private String userName;
    private String userPwd;
    private String userLocation;//用户地址
    private String userAvatar;//用户头像
    private String userActor;//用户角色

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserLocation() {
        return userLocation;
    }

    public void setUserLocation(String userLocation) {
        this.userLocation = userLocation;
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar;
    }

    public String getUserActor() {
        return userActor;
    }

    public void setUserActor(String userActor) {
        this.userActor = userActor;
    }
}

package cn.lightina.managebooks.pojo;

public class User {
    private int userId;
    private String userName;
    private String passWd;

    public User(String userName, String passWd) {
        this.userName = userName;
        this.passWd = passWd;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWd() {
        return passWd;
    }

    public void setPassWd(String passWd) {
        this.passWd = passWd;
    }
}

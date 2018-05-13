package cn.lightina.managebooks.pojo;

import java.util.Date;

public class ReservationDetail {
    private int reservationId;
    private String bname;
    private int bookId;
    private Date deadline;
    private String userName;
    private int state; //0:处理中 1:预约成功 2:预约失败

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}

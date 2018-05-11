package cn.lightina.managebooks.pojo;

import java.util.Date;

public class Reservation {
    private int REID;
    private int RID;
    private int BID;
    private Date deadline;

    public int getREID() {
        return REID;
    }

    public void setREID(int REID) {
        this.REID = REID;
    }

    public int getRID() {
        return RID;
    }

    public void setRID(int RID) {
        this.RID = RID;
    }

    public int getBID() {
        return BID;
    }

    public void setBID(int BID) {
        this.BID = BID;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}

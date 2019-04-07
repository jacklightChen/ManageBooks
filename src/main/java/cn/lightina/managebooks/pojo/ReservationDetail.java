package cn.lightina.managebooks.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class ReservationDetail {
    private int reservationId;
    private String bname;
    private int bookId;
    private Date deadline;
    private String userName;
}

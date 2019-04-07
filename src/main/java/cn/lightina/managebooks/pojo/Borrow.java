package cn.lightina.managebooks.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Borrow {
    private int borrowId;
    private int bookId;
    private int userId;
    private Date btime;
    private Date deadline;
    private Date rtime;
    private int operator;
}

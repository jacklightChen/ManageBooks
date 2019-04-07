package cn.lightina.managebooks.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class BookList {
    private String isbn;
    private String bname;
    private String publisher;
    private String writer;
    @JsonFormat(locale = "zh", timezone = "GMT+8", pattern = "yyyy-MM-dd")
    private Date ptime;
    private int number;
    private int operator;

    @Override
    public String toString() {
        return "BookList{" +
                "isbn='" + isbn + '\'' +
                ", bname='" + bname + '\'' +
                ", publisher='" + publisher + '\'' +
                ", writer='" + writer + '\'' +
                ", ptime=" + ptime +
                ", number=" + number +
                ", operator=" + operator +
                '}';
    }
}

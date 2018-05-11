package cn.lightina.managebooks.pojo;

import java.util.Date;

public class BookList {
    private String ISBN;
    private String bname;
    private String publisher;
    private String writer;
    private Date ptime;
    private int number;
    private int operator;

    public BookList(String ISBN, String bname, String publisher, String writer, Date ptime, int number, int operator) {
        this.ISBN = ISBN;
        this.bname = bname;
        this.publisher = publisher;
        this.writer = writer;
        this.ptime = ptime;
        this.number = number;
        this.operator = operator;
    }

    public BookList() {}

    public String getISBN() { return ISBN; }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public Date getPtime() {
        return ptime;
    }

    public void setPtime(Date ptime) {
        this.ptime = ptime;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getOperator() {
        return operator;
    }

    public void setOperator(int operator) {
        this.operator = operator;
    }
}

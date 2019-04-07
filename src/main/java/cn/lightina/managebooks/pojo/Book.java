package cn.lightina.managebooks.pojo;

import lombok.Data;

@Data
public class Book {
    private int bookId;
    private String ISBN;
    private String location;
    private int state;
    private int operator;

    public Book(int bookId, String ISBN, String location, int state, int operator) {
        this.bookId = bookId;
        this.ISBN = ISBN;
        this.location = location;
        this.state = state;
        this.operator = operator;
    }
}

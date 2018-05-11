package cn.lightina.managebooks.pojo;

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

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public int getOperator() {
        return operator;
    }

    public void setOperator(int operator) {
        this.operator = operator;
    }
}

package cn.lightina.managebooks.service;

import cn.lightina.managebooks.pojo.*;

import java.util.List;

public interface BookServiceimpl {
    /*user*/
    List<BookList> getlist();
    List<BookList> getlistByQuery(String query);
    List<Book> getlistByuId(int userId);
    int deleteByBId(int bookId);
    Reservation processRes(String ISBN,User user);
    List<ReservationDetail> getResById(User user);

    /*admin*/
    int addBook(Book book,int num);
    Book insertBorrow(BookList booklist,int userId);
    List<Reservation> getResInfo();
    List<Borrow> getBorInfo(User user);
}

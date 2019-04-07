package cn.lightina.managebooks.service;

import cn.lightina.managebooks.pojo.*;

import java.util.List;

public interface BookService {
    // user
    List<BookList> getlist();

    List<BookList> getlistByQuery(String query);

    List<Book> getlistByuId(int userId);

    void processRes(String ISBN, User user);

    List<ReservationDetail> getResById(User user);

    void returnBookById(int borrowId);

    // admin
    void addBookList(BookList booklist,int state);

    void insertBorrow(int reservationId,int operator);

    List<Reservation> getResInfo();

    List<BorrowDetail> getBorInfo(User user);

    List<ReservationDetail> getResList();

    List<BorrowDetail> getBorList();

    int deleteBookList(BookList bookList);
}

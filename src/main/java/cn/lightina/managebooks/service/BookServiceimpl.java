package cn.lightina.managebooks.service;

import cn.lightina.managebooks.pojo.Book;
import cn.lightina.managebooks.pojo.BookList;
import cn.lightina.managebooks.pojo.Borrow;
import cn.lightina.managebooks.pojo.Reservation;

import java.util.List;

public interface BookServiceimpl {
    /*user*/
    List<BookList> getlist();
    List<BookList> getlistByQuery(String query);
    List<Book> getlistByuId(int userId);
    int deleteByBId(int bookId);

    /*admin*/
    int addBook(Book book,int num);
    Book insertBorrow(BookList booklist,int userId);
    List<Reservation> getResInfo();
    List<Borrow> getBorInfo();
}

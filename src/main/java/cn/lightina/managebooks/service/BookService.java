package cn.lightina.managebooks.service;

import cn.lightina.managebooks.dao.BookMapper;
import cn.lightina.managebooks.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookService implements BookServiceimpl {
    @Autowired(required = false)
    BookMapper bookMapper;

    /*user*/
    @Override
    public List<BookList> getlist() {
        return bookMapper.getlist();
    }

    @Override
    public List<BookList> getlistByQuery(String query) {
        return bookMapper.getlistByQuery(query);
    }

    @Override
    public List<Book> getlistByuId(int userId) {
        return null;
    }

    @Override
    public ReservationResult<Reservation> processRes(String ISBN){

    }

    @Override
    public int deleteByBId(int bookId) {
        /*
        * 先根据uid bookid => borrowid
        * upadte borrow enddate
        * */
        return 0;
    }

    /**/

    @Override
    public int addBook(Book book, int num) {
        return 0;
    }

    @Override
    public Book insertBorrow(BookList booklist, int userId) {
        return null;
    }

    @Override
    public List<Reservation> getResInfo() {
        return null;
    }

    @Override
    public List<Borrow> getBorInfo() {
        return null;
    }


}

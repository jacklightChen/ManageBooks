package cn.lightina.managebooks.service;

import cn.lightina.managebooks.Exception.AddBookListException;
import cn.lightina.managebooks.Exception.ReservationException;
import cn.lightina.managebooks.dao.BookMapper;
import cn.lightina.managebooks.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceimpl implements BookService {
    @Autowired(required = false)
    BookMapper bookMapper;

    /*user*/
    @Override
    public List<BookList> getlist() {
        return bookMapper.getList();
    }

    @Override
    public List<BookList> getlistByQuery(String query) {
        return bookMapper.getListByQuery(query);
    }

    @Override
    public List<Book> getlistByuId(int userId) {
        return null;
    }

    @Override
    public void processRes(String ISBN, User user) {
        int count=bookMapper.processRes(ISBN,user);
        if(count==0)throw new ReservationException("预约失败");
    }

    @Override
    public int deleteByBId(int bookId) {
        /*
         * 先根据uid bookid => borrowid
         * update borrow enddate
         * */
        return 0;
    }

    /**/

    @Override
    public int addBookList(BookList bookList) {
        int count = bookMapper.addBookList(bookList);
        if (count <= 0) throw new AddBookListException("添加失败");
        return count;
    }

    @Override
    public Book insertBorrow(BookList booklist, int userId) {
        return null;
    }

    @Override
    public List<ReservationDetail> getResById(User user) {
        return bookMapper.getResById(user);
    }

    @Override
    public List<Reservation> getResInfo() {
        return null;
    }

    @Override
    public List<BorrowDetail> getBorInfo(User user) {
        return bookMapper.getBorById(user);
    }

    @Override
    public List<ReservationDetail> getResList() {
        return bookMapper.getResList();
    }

    @Override
    public List<BorrowDetail> getBorList(){
        return bookMapper.getBorList();
    }
}

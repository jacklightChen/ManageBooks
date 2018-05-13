package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    List<BookList> getList();

    List<BookList> getListByQuery(@Param("query") String query);

    /*得到能被预约的书*/
    List<Book> getRes(@Param("isbn") String ISBN);

    /*插入预约记录 这里是状态0*/
    int insertResInfo(@Param("book") Book book, @Param("user") User user);

    // TODO: 2018/5/13 czc
    /*插入预约记录 这里是状态2 即设deadline为null*/
    int insertResInfoNull(@Param("book") Book book, @Param("user") User user);

    // TODO: 2018/5/13 czc
    /*插入预约时需要改变对应图书的状态*/
    int changeBookState(@Param("book") Book book,@Param("state") Integer state);

    /*获取预约号*/
    Reservation getResId(@Param("book") Book book, @Param("user") User user);

    // 测试成功
    // 根据userid获取预约记录 注意返回值需要的是包装起来的书名和预约号
    List<ReservationDetail> getResById(@Param("user") User user);

    // TODO: 2018/5/13 czc
    // 用户还书
    int returnBookById (@Param("borrowId") Integer borrowId);

    // 测试成功
    // List<BorrowDetail> getBorById(@Param("user")User user);
    // 根据userid获取已借阅记录
    List<BorrowDetail> getBorById(@Param("user") User user);


    // 先不管
    List<Book> getListById(@Param("user") User user);

    /*admin*/
    // TODO: 2018/5/13 czc 管理员添加新的booklist
    int addBookList(@Param("booklist") BookList booklist);

    // 测试成功
    //管理员获取所有预约记录 注意返回值需要的是包装起来的书名和预约号还有用户名
    List<ReservationDetail> getResList();


}

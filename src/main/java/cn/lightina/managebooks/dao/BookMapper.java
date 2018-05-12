package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;
public interface BookMapper {
    List<BookList> getList();
    List<BookList> getListByQuery(@Param("query")String query);
    /*得到能被预约的书*/
    List<Book> getRes(@Param("isbn")String ISBN);
    /*插入预约记录*/
    int insertResInfo(@Param("book")Book book,@Param("user")User user);
    /*获取预约号*/
    Reservation getResId(@Param("book")Book book,@Param("user")User user);

    // TODO: 2018/5/12 czc快写
    // 根据userid获取预约记录
    List<Reservation> getResById();

    // 根据userid获取已借阅记录
    List<Borrow> getBorById();

    List<Book> getListById(@Param("userId")int userId);
}

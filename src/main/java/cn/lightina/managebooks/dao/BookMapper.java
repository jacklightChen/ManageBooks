package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.Book;
import cn.lightina.managebooks.pojo.BookList;
import cn.lightina.managebooks.pojo.Reservation;
import cn.lightina.managebooks.pojo.User;
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

    List<Book> getListById(@Param("userId")int userId);
}

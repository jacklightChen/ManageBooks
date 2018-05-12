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

    // TODO: 2018/5/12 修改！！！
    // 根据userid获取预约记录 注意返回值需要的是包装起来的书名和预约号
    List<ReservationDetail> getResById(@Param("user")User user);

    // 根据userid获取已借阅记录
    List<Borrow> getBorById(@Param("user")User user);


    List<Book> getListById(@Param("user")User user);
}

package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
//    todo：写完了，czh看看能不能用
    //通过username和passwd 验证用户 reader
    User checkUser(@Param("username")String username, @Param("password")String password);

}

package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.User;

public interface UserMapper {
    // TODO: 2018/5/12 czc快写
    //通过username和passwd 验证用户 reader
    User checkUser();

}

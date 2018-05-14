package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.MailDetail;
import cn.lightina.managebooks.pojo.User;

import java.util.List;

public interface MailMapper {
    List<MailDetail> returnReminder();
    List<MailDetail> resReminder();
}

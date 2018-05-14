package cn.lightina.managebooks.dao;

import cn.lightina.managebooks.pojo.MailDetail;
import cn.lightina.managebooks.pojo.User;

import java.util.List;

public interface MailMapper {
    // TODO: 2018/5/14 czh:写完了，测试测试
    List<MailDetail> returnReminder();

    // TODO: 2018/5/14 cah:注意一下这里MailDetail.btime字段为空
    List<MailDetail> resReminder();
}

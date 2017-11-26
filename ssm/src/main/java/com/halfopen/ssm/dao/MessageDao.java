package com.halfopen.ssm.dao;

import com.halfopen.ssm.bean.Message;

import java.util.List;

public interface MessageDao {
    List<Message> getMessages();

    int addMessage(Message message);

    int deleteMessage(int id);
}

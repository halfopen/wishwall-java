package com.halfopen.ssm.service;

import com.halfopen.ssm.bean.Message;

import java.util.List;

public interface MessageService {
    List<Message> getMessages();

    int addMessage(Message message);

    int deleteMessage(int id);
}

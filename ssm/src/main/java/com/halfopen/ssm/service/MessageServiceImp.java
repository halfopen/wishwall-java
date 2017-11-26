package com.halfopen.ssm.service;

import com.halfopen.ssm.bean.Message;
import com.halfopen.ssm.dao.MessageDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("messageService")
public class MessageServiceImp implements MessageService{

    @Resource
    private MessageDao messageDao;

    public List<Message> getMessages() {
        return messageDao.getMessages();
    }

    public int addMessage(Message message) {
        return messageDao.addMessage(message);
    }

    public int deleteMessage(int id) {
        return messageDao.deleteMessage(id);
    }
}

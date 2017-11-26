package com.halfopen.ssm.service;

import com.halfopen.ssm.dao.user.UserDao;
import com.halfopen.ssm.bean.User;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;

@Service("userService")
public class UserServiceImp implements UserService {

    @Resource
    private  UserDao userDao;

    public User getUser(String name, String password) {
        return userDao.getUser(name, password);
    }
}

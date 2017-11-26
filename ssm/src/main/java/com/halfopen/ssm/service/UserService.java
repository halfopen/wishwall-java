package com.halfopen.ssm.service;

import com.halfopen.ssm.bean.User;

public interface UserService {

    public User getUser(String name, String password);
}
package com.halfopen.ssm.dao.user;

import com.halfopen.ssm.bean.User;

public interface UserDao {
    public User getUser(String name, String password);
}

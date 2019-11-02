package com.zz.service;

import com.zz.po.User;

public interface IUserService {

    public User selectUser(long userId);
    public User findUserName(String username);
    void register(User user);
    User login(User user);
    void changeMy(User user);
}
package com.zz.dao;
import com.zz.po.User;
public interface IUserDao {
    User selectUser(long id);
    User findUserName(String username);
    void addUser(User user);
    User login(User user);
    void changeUser(User user);
}
package com.zz.service.impl;

import com.zz.dao.IUserDao;
import com.zz.po.User;
import com.zz.service.IUserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

    @Override
    public User findUserName(String username) {
        return userDao.findUserName(username);
    }

    @Override
    public void register(User user) {
        userDao.addUser(user);
    }

    @Override
    public User login(User user) {
        System.out.println("Service好使了");
        return userDao.login(user);
    }

    @Override
    public void changeMy(User user) {
         System.out.println(user.getUid()+"，Service层=======");
         userDao.changeUser(user);
    }

}
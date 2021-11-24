package com.hou.service;

import com.hou.dao.UserDao;
import com.hou.dao.UserDaoImp;

public class UserServiceImp implements UserService{

    private UserDao userDao;

    public void setUserDao(UserDao userDao){
        this.userDao = userDao;
    }

    public void getUser() {
        userDao.getUser();
    }

}

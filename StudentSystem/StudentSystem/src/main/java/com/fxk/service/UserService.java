package com.fxk.service;

import com.fxk.dao.UserDao;
import com.fxk.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    public int create(User user){
        return userDao.create(user);
    }

}

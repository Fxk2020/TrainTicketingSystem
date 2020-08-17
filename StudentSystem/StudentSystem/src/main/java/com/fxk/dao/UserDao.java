package com.fxk.dao;

import com.fxk.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao {

    public int create(User user);

    public int deleteDao(Map<String,Object> map);

    public int updateDao(Map<String,Object> map);

    public List<User> queryDao(Map<String,Object> map);

    public int countDao(Map<String,Object> map);

    public User detailDao(Map<String,Object> map);

}

package com.fxk.dao;

import com.fxk.entity.User;
import com.fxk.util.PropertiesUtil;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class LoginAuthentication {

    /**文档注释
     *登陆方法
     * @param loginUser 只有用户名和密码
     * @return 包含用户全部数据 使用druid
     */

    //声明JDBCTemplated对象来公用
    private JdbcTemplate template = new JdbcTemplate(PropertiesUtil.getDataSource());

    //登录逻辑
    public User login_check(User loginUser){

        try {
            //1.编写sql语句
            String sql = "SELECT * FROM Users_message where user_name=? and user_password=?";
            //2.调用方法queryForObject获得封装的user对象

//            System.out.println(loginUser.getUserName()+"         "+loginUser.getPassword());

            User user = template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),
                    loginUser.getUser_name(),loginUser.getUser_password());

            return user;
        } catch (DataAccessException e){
//            e.printStackTrace();
            System.out.println("并没有这个人。");
            return null;
        }


    }



}

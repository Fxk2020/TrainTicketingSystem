package com.fxk.test;

import com.fxk.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisTest {

    /**
     *
     * @return
     */
    public SqlSessionFactory getSqlSessionFactory(){

        //1.加载核心配置文件
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 2.读取配置文件的内容
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory = builder.build(inputStream);

        return sqlSessionFactory;

    }

    /**
     * 添加用户（注册）
     * @throws IOException
     */
    public void addUser(){
        // 3.使用sqlSessionFactory对象，创建SqlSession对象，开启自动提交事务
        SqlSession sqlSession = this.getSqlSessionFactory().openSession(true);
        // 调用方法执行
        User user = new User();
        user.setUser_name("老毛桃");
        user.setUser_password("123456");
        user.setName("阿里云开发者");
        user.setIDNumber("37067719770707202X");
        user.setStuStatus(false);
        sqlSession.insert("com.fxk.dao.UserDao.create", user);
        // 事务提交
        // sqlSession.commit();
        // 释放资源
        sqlSession.close();
    }

    public static void main(String[] arg0){

        MybatisTest test = new MybatisTest();

        test.addUser();
    }


}

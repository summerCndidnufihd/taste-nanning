package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@MybatisSqlMapping
public interface UserDao {


    public int countCommon(User user);

    public int addUser(User user);

//    public int addDefaultIntegral(@Param("userId") String userId);

    public List<User> getUserList(@Param("userName") String userName);

    public User login(@Param("userName") String userName);

    User selectByLoginNameAndPassword(@Param("userName")String userName,@Param("userPwd") String userPwd);

    List<User> allUser();

    int delUser(int u_id);
}

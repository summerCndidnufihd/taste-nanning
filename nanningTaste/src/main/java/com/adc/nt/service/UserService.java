package com.adc.nt.service;

import com.adc.nt.dao.UserDao;
import com.adc.nt.model.User;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {
    @Autowired
    private UserDao userDao;

    private JSONObject json = new JSONObject();

    @Transactional
    public String addUser(String userJson) throws Exception {
        ResponseResult result = new ResponseResult();
        User user = json.parseObject(userJson, User.class);
        if (userDao.countCommon(user) > 0) {
            result.setCode("400");
            result.setMsg("用户已存在");
            return json.toJSONString(result);
        }
//        user.genarateID();//设置UUID
        int num = userDao.addUser(user);
//        int numScore = userDao.addDefaultIntegral(user.getId());//注册用户送默认积分
        if (num > 0 ) {
            result.setCode("200");
            result.setMsg("添加成功");
            result.setData(user);
        } else {
            result.setCode("400");
            result.setMsg("添加失败");
        }
        return json.toJSONString(result);
    }

    public String getUserByName(String userName) throws Exception {
        ResponseResult result = new ResponseResult();
        List<User> list = userDao.getUserList(userName);
        result.setCode("200");
        result.setMsg("Ok");
        result.setData(list);
        return json.toJSONString(result);
    }


    public User login(String username, String password) {
        return userDao.selectByLoginNameAndPassword(username, password);
    }

    public List<User> allUser() {
        return userDao.allUser();
    }

    public int delUser(int u_id) {
        return userDao.delUser(u_id);
    }
}
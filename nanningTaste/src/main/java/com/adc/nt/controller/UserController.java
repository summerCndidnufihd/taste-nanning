package com.adc.nt.controller;

import com.adc.nt.model.Food;
import com.adc.nt.model.User;
import com.adc.nt.service.UserService;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
    private JSONObject json = new JSONObject();
    @Autowired
    private UserService userService;

    @RequestMapping(value = "",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String addUser(@RequestBody String userJson) throws Exception{
        String resultInfo = "";
        try{
            resultInfo = userService.addUser(userJson);
            return resultInfo;
        }catch (Exception e){
            throw new Exception(e);
        }
    }

    @RequestMapping(value = "{userName}",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String getUserByName(@PathVariable String userName) throws Exception{
        String resultInfo = "";
        try {
            resultInfo = userService.getUserByName(userName);
            return resultInfo;
        }catch (Exception e){
            throw new Exception(e);
        }
    }

    @RequestMapping(value = "/login",produces = "text/html;charset=UTF-8")
//    @ResponseBody
    public String login(@Param("userName") String userName, @Param("userPwd") String userPwd,Model model) {
        System.out.println(userName);
        User user = userService.login(userName, userPwd);
        System.out.println(user.getUserName());
        System.out.println(user.getUserPwd());
        if (user != null) {
            model.addAttribute("user",user);
            toIndex();
            return "other/index";
        } else {
            return "other/error";
        }
//        return "";
    }
    @RequestMapping(value = "/toIndex")
    public String toIndex(){
        return "other/index";
    }

    @RequestMapping("/allUser")
    public String allUser(Model model){
        List<User> list = userService.allUser();
        System.out.println(list);
        model.addAttribute("list",list);
        return "user/allUser";
    }

    @ResponseBody
    @RequestMapping(value = "/delUser/{u_id}")
    public String delUser(@PathVariable("u_id") int u_id) throws Exception {
        try{
            System.out.println("删除-----");
            int m = userService.delUser(u_id);
            if(m>0){
                return "ok";
            }else{
                return "no";
            }
        }catch (Exception e){
            throw  new Exception(e);
        }
    }
}

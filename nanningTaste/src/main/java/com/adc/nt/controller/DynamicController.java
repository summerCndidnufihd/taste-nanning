package com.adc.nt.controller;

import com.adc.nt.model.Advert;
import com.adc.nt.model.Dynamic;
import com.adc.nt.model.Food;
import com.adc.nt.service.DynamicService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/dynamic")
public class DynamicController {

    @Autowired
    public DynamicService dynamicService;

    @RequestMapping("/allDynamic")
    public String allFood(Model model){
        List<Dynamic> dynamicList = dynamicService.allDynamic();
        System.out.println(dynamicList);
        model.addAttribute("list",dynamicList);
        return "dynamic/allDynamic";
    }


    //按id查找动态
//    @ResponseBody
    @RequestMapping("/getDynamicById")
    public String getDynamicById(Model model,@Param("d_id") int d_id) throws Exception {
        try {
            List<Dynamic> dynamicList = dynamicService.getDynamicById(d_id);
            if(dynamicList != null){
                model.addAttribute("list",dynamicList);
                return "dynamic/allDynamic";
            }else{
                return "dynamic/allDynamic";
            }

        } catch (Exception e) {
            throw new Exception(e);
        }
    }

    /**
     *功能描述: 查找“未审核”状态列表
     * @Date: 2021/12/6 19:57
     **/
    @RequestMapping( "/getDynamicByStatus")
    public String getDynamicByStatus(Model model,@Param("d_status") String d_status)throws Exception{
        try {
            List<Dynamic> dynamicList = dynamicService.getDynamicByStatus(d_status);
            if(dynamicList != null){
                model.addAttribute("list",dynamicList);
                return "dynamic/checkDynamic";
            }else{
                return "dynamic/checkDynamic";
            }

        } catch (Exception e) {
            throw new Exception(e);
        }
    }

    /***
     * 查看审核不通过的列表
     * @param
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping( "/checkNoDynamic")
    public String checkNoDynamic(Model model)throws Exception{
        try {
            List<Dynamic> dynamicList = dynamicService.checkNoDynamic();
            if(dynamicList != null){
                model.addAttribute("list",dynamicList);
                return "dynamic/checkNoDynamic";
            }else{
                return "dynamic/checkNoDynamic";
            }

        } catch (Exception e) {
            throw new Exception(e);
        }
    }

    /**
     * 查看审核通过的
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping( "/checkYesDynamic")
    public String checkYesDynamic(Model model)throws Exception{
        try {
            List<Dynamic> dynamicList = dynamicService.checkYesDynamic();
            if(dynamicList != null){
                model.addAttribute("list",dynamicList);
                return "dynamic/checkYesDynamic";
            }else{
                return "dynamic/checkYesDynamic";
            }

        } catch (Exception e) {
            throw new Exception(e);
        }
    }
//    审核动态
    @RequestMapping( "/checkDynamic")
    public String checkDynamic(HttpServletRequest request,Model model) throws Exception{
        int d_id =Integer.parseInt( request.getParameter("id"));
        String d_status = request.getParameter("power");
        System.out.print(d_status);
        Dynamic d = new Dynamic();
        d.setD_id(d_id);
        d.setD_status(d_status);
        dynamicService.checkDynamic(d);
        System.out.print("动态的id");
        List<Dynamic> list=dynamicService.getDynamicById(d_id);
        model.addAttribute("list",list);
        System.out.println(list);
        return "dynamic/allDynamic";
    }

    @ResponseBody
    @RequestMapping(value = "/delDynamic/{d_id}")
    public String delDynamic(@PathVariable("d_id") int d_id) throws Exception {
        try{
            System.out.println("删除-----");
            int m = dynamicService.delDynamic(d_id);
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

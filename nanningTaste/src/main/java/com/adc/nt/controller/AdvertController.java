package com.adc.nt.controller;

import com.adc.nt.dao.AdvertDao;
import com.adc.nt.model.Advert;
import com.adc.nt.model.Food;
import com.adc.nt.service.AdvertService;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/advert")
public class AdvertController {

    @Autowired
    private AdvertService advertService;
    //按id查找广告
    @RequestMapping("/getAdvertById")
    public String getAdvertById(Model model,@Param("a_id")  int a_id) throws Exception{
        try {
            List<Advert> advertList = advertService.getAdvertById(a_id);
            if(advertList != null){
                model.addAttribute("list",advertList);
                return "advert/allAdvert";
            }else{
                return "advert/allAdvert";
            }

        }catch (Exception e){
            throw new Exception(e);
        }
    }

    @RequestMapping("/allAdvert")
    public String allFood(Model model){
        List<Advert> advertList = advertService.allAdvert();
        System.out.println(advertList);
        model.addAttribute("list",advertList);
        return "advert/allAdvert";
    }
}

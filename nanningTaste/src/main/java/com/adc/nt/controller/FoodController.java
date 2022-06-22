package com.adc.nt.controller;

import com.adc.nt.dao.FoodDao;
import com.adc.nt.model.Food;
import com.adc.nt.model.User;
import com.adc.nt.service.FoodService;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/food")
public class FoodController {

    @Autowired
    private FoodService foodService;

    private JSONObject json = new JSONObject();

    //    根据名称搜索
//    @ResponseBody
    @RequestMapping("/getFoodByName")
    public String getFoodByName(@RequestParam(defaultValue="1") @Param("foodName") String foodName, Map<String,Object> map) {
        System.out.println(foodName);
        List<Food> list=foodService.getFoodByName(foodName);
        map.put("list", list);
        return "food/allFood";
    }
//    根据id搜索
//    @ResponseBody
    @RequestMapping(value = "/getFoodById",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String getFoodById(Model model,@Param("f_id") int f_id) throws Exception {
        try {
            List<Food> foodList = foodService.getFoodById(f_id);
            System.out.println("美食名称："+foodList);
            if(foodList != null){
                model.addAttribute("list",foodList);
                return "food/allFood";
            }else{
                return "other/error";
            }

        }catch (Exception e){
            throw new Exception(e);
        }
    }

    @RequestMapping(value = "/toEditFood/{f_id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String toEditFood( Model model, @PathVariable("f_id") int f_id) throws Exception {
        List<Food> foodList = foodService.getFoodById(f_id);
        model.addAttribute("list",foodList);
        return "food/food-edit";
    }

    @RequestMapping(value = "/editFood",method = RequestMethod.POST)
    public String editFood(Model model,Food food) throws Exception {
        foodService.editFood(food);
        System.out.print("食物的id:" );
        List<Food> list =  foodService.getFoodById(food.getF_id());
        model.addAttribute("list",list);
        System.out.println(food.getF_id() );
        return "food/allFood";
    }

    @RequestMapping("/allFood")
    public String allFood(Model model){
        List<Food> foodList = foodService.allFood();
        System.out.println(foodList);
        model.addAttribute("list",foodList);
        return "food/allFood";
    }


    @RequestMapping( "/toAddFood")
    public String toAddFood() throws Exception {
        return "food/food-add";
    }

    @RequestMapping("/addFood")
    public String addFood(HttpServletRequest request, Food food, MultipartFile upload, Model model) throws IOException {
        System.out.println("-----文件上传------");
        String filename = upload.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println(filename);
        System.out.println(path);
        /**
         *文件上传
         */
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        String uuid = UUID.randomUUID().toString().replace("-","");
        filename = uuid + "_" + filename;
        if (upload != null && !upload.isEmpty()) {
            upload.transferTo(new File(path,filename));
        } else {
            return "other/error";
        }
        System.out.println(food.getFoodName());
        food.setF_img(filename);
//        foodService.editFood(food);
        foodService.addFood(food);
        System.out.println("保存成功！"+food.getF_img());
        System.out.println("保存成功！"+food.getF_id());
        FoodService s = new FoodService();
        try {
            List<Food> list = s.getFoodByName(food.getFoodName());
            model.addAttribute("list",list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "other/success";
    }


    @ResponseBody
    @RequestMapping(value = "/delFood/{f_id}")
    public String delFood(@PathVariable("f_id") int f_id) throws Exception {
        try{
            System.out.println("删除-----");
            int m = foodService.delFood(f_id);
            if(m>0){
                return "ok";
            }else{
                return "no";
            }
        }catch (Exception e){
            throw  new Exception(e);
        }
    }

    @ResponseBody
    @RequestMapping("/getFoodByFoodTag")
    public String getFoodByFoodTag(@RequestParam(defaultValue="1") @Param("foodTag") String foodTag, Map<String,Object> map) {
        System.out.println(foodTag);
        String resultInfo = "";
        resultInfo =foodService.getFoodByFoodTag(foodTag);
        return resultInfo;
    }
}

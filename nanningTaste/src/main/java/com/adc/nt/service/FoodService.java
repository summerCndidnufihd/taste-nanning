package com.adc.nt.service;

import com.adc.nt.dao.FoodDao;
import com.adc.nt.model.Food;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class FoodService {
    @Autowired
    private FoodDao foodDao;
    private JSONObject json = new JSONObject();

    @Transactional
    public int addFood(Food food) {
        ResponseResult result = new ResponseResult();
//        Food food = json.parseObject(foodJson, Food.class);
        int num = foodDao.addFood(food);
//        if(num > 0){
//            result.setCode("200");
//            result.setMsg("添加美食成功！");
//            result.setData(food);
//        }else{
//            result.setCode("400");
//            result.setMsg("添加美食失败！");
//        }
//        return json.toJSONString(result);
        return num;
    }

    public List<Food> getFoodById(int f_id) throws Exception {
//        ResponseResult result = new ResponseResult();
        List<Food> foodList = foodDao.getFoodById(f_id);
//        result.setCode("200");
//        result.setMsg("查看美食成功");
//        result.setData(foodList);
        return foodList;
    }

    /**
     * 删除美食
     * @param f_id
     * @return
     */
    public int delFood(int f_id) {
//        ResponseResult result = new ResponseResult();
        return  foodDao.delFood(f_id);
//        if(num ==1 ){
//            result.setCode("200");
//            result.setMsg("删除成功");
//            result.setData(f_id);
//        }else{
//            result.setCode("400");
//            result.setMsg("删除失败");
//        }
//        return json.toJSONString(result);
    }


    public List<Food> allFood() {
        List<Food> foodList = foodDao.allFood();
        return foodList;
    }

    @Transactional
    public void editFood(Food food) {
         foodDao.editFood(food);
    }

    public List<Food> getFoodByName(String f_foodName) {
        List<Food> foodList = foodDao.getFoodByName(f_foodName);
        return foodList;
    }

    public String getFoodByFoodTag(String foodTag) {
        ResponseResult result = new ResponseResult();
        List<Food> list = foodDao.getFoodByFoodTag(foodTag);
        if(list != null ){
            result.setCode("200");
            result.setMsg("删除成功");
            result.setData(list);
        }else{
            result.setCode("400");
            result.setMsg("删除失败");
        }
        return json.toJSONString(result);
    }
}

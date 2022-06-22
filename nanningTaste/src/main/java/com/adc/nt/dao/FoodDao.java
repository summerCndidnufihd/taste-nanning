package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.Food;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
@MybatisSqlMapping
public interface FoodDao {

    public int countCommon(Food food);

    public List<Food> allFood();

   public List<Food> getFoodById(@Param("f_id") int f_id);

   public int addFood(Food food);

   public int delFood(int f_id);

    @Transactional
   public void editFood(Food food);

    List<Food> getFoodByName(@Param("foodName")String foodName);

    List<Food> getFoodByFoodTag(String foodTag);
}

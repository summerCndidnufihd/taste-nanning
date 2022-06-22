package com.adc.nt.service;

import com.adc.nt.dao.DynamicDao;
import com.adc.nt.model.Dynamic;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DynamicService {
    @Autowired
    private DynamicDao dynamicDao;

    private JSONObject json = new JSONObject();

 /**
  *
  * 功能描述: 按id查找动态
  * @Date: 2021/12/6 20:11
  **/
    @Transactional
    public List<Dynamic> getDynamicById(int d_id) throws Exception {
        List<Dynamic> dynamicList = dynamicDao.getDynamicById(d_id);
        return dynamicList;
    }
    /**
     *功能描述: 未审核动态列表
     * @Date: 2021/12/6 20:08
     **/
    public List<Dynamic> getDynamicByStatus(String d_status)throws Exception {
        List<Dynamic> list = dynamicDao.getDynamicByStatus(d_status);
        return list;

    }
    /**
     * 功能描述: 审核动态
     * @Param: [dynamic]
     * @Return: void
     */
    @Transactional
    public void checkDynamic(Dynamic d){

        dynamicDao.checkDynamic(d);

    }

    public List<Dynamic> allDynamic(){
        List<Dynamic> dynamicList=dynamicDao.allDynamic();
        return dynamicList;
    }
    public int delDynamic(int f_id) {
        return dynamicDao.delDynamic(f_id);
    }

    public List<Dynamic> checkNoDynamic() {
        return dynamicDao.checkNoDynamic();
    }

    public List<Dynamic> checkYesDynamic() {
        return dynamicDao.checkYesDynamic();
    }
}

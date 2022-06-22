package com.adc.nt.service;

import com.adc.nt.dao.AdvertDao;
import com.adc.nt.model.Advert;
import com.adc.nt.model.Food;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdvertService {
    @Autowired
    private AdvertDao advertDao;
//    private JSONObject json = new JSONObject();

    @Transactional
    public List<Advert> getAdvertById(int a_id) throws Exception {
        List<Advert> advertList = advertDao.getAdvertById(a_id);
        return advertList;
    }

    public List<Advert> allAdvert() {
        List<Advert> advertList = advertDao.allAdvert();
        return advertList;
    }

//
    //按id查找广告
/*    public String getAdvertById(int a_id) throws Exception {
        ResponseResult result = new ResponseResult();
        List<Advert> list = advertDao.getAdvertById(a_id);
        result.setCode("200");
        result.setMsg("Ok");
        result.setData(list);
        return json.toJSONString(result);
    }*/


}

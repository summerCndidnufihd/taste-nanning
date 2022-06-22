package com.adc.nt.service;


import com.adc.nt.dao.StoreDao;
import com.adc.nt.model.Store;
import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StoreService {

    @Autowired
    private StoreDao storeDao;
    private JSONObject json = new JSONObject();

    @Transactional
    public int addStore(Store store) {//添加商家
        return storeDao.addStore(store);
    }

    public int deleteStoreById(int s_id) throws Exception {//通过Id删除商家
        return storeDao.deleteStoreById(s_id);
    }

    public List<Store> getAllStoreList() throws Exception {//获取所有商家信息
        return storeDao.getAllStoreList();
    }

    public List<Store> getStoreListByName(String storeName){//通过商家名字模糊查询
         return storeDao.getStoreListByName(storeName);
    }

    public List<Store> getStoreListById(int s_id) throws Exception {//通过商家Id获取信息
        return storeDao.getStoreListById(s_id);
    }

    public List<Store> getStoreListByTag(String storeTag) throws Exception {//通过商家标签查询
         return storeDao.getStoreListByTag(storeTag);
    }

    public void alterStore(Store store){
        storeDao.alterStore(store);
    }
}

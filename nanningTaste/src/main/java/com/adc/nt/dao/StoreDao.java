package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.Store;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@MybatisSqlMapping
public interface StoreDao {

    public int countCommon(Store store);

    public int addStore(Store store);//添加商家

    public int deleteStoreById(int s_id);//通过Id删除商家

    public void alterStore(Store store);//修改商家信息

    public List<Store> getAllStoreList();//获取所有商家信息

    public List<Store> getStoreListByName(@Param("storeName") String storeName);//通过商家名字获取信息

    public List<Store> getStoreListById(@Param("s_id") int s_id);//通过商家Id获取信息

    public List<Store> getStoreListByTag(@Param("storeTag") String storeTag);//通过商家标签查询
}

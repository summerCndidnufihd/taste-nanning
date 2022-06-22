package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.Advert;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@MybatisSqlMapping
public interface AdvertDao {
    public int addAdvert(Advert advert);
    public int countCommon(Advert advert);
    public int deleteAdvert(int a_id);
//    public int alterAdvert(int a_id);
    public List<Advert> getAdvertByTitle(@Param("a_title") String a_title);
    public List<Advert> getAdvertById(@Param("a_id") int a_id);

    public List<Advert> allAdvert();
}

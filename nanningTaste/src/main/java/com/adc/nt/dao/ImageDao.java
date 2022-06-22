package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.Image;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@MybatisSqlMapping
public interface ImageDao {

    public void save(Image image);

    List<Image> getImageById(int i_id);

    List<Image> allImage();

    List<Image> getImageByF_id(@Param("f_id") int f_id);

    int delImage(int f_id);
}

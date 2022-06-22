package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.File;
import org.springframework.stereotype.Repository;

@Repository
@MybatisSqlMapping
public interface FileDao {

    void save(File ff);
}

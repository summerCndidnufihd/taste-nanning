package com.adc.nt.dao;//package com.adc.nt.dao;

import com.adc.nt.anotation.MybatisSqlMapping;
import com.adc.nt.model.Dynamic;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@MybatisSqlMapping
public interface DynamicDao {
    public List<Dynamic> allDynamic();
    public List<Dynamic> getDynamicById(@Param("d_id") int d_id);
    public List<Dynamic> getDynamicByStatus(@Param("d_status") String d_status);

    @Transactional
    void checkDynamic(Dynamic d);

    int delDynamic(int f_id);

    List<Dynamic> checkNoDynamic();

    List<Dynamic> checkYesDynamic();
}

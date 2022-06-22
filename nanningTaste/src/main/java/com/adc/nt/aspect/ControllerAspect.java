package com.adc.nt.aspect;

import com.adc.nt.utils.ResponseResult;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import static java.lang.String.format;

@Aspect
public class ControllerAspect {
    private static final Log log = LogFactory.getLog(ControllerAspect.class);
    private ObjectMapper mapper = new ObjectMapper();

    @Around("execution(public * com.adc.nt..controller.*.*(..))")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable{
        ResponseResult responseResult = new ResponseResult();
        String methodName = joinPoint.getSignature().getName();
        log.debug(format("%s start",methodName));
        String result;
        try{
            result = joinPoint.proceed().toString();
        }catch (Throwable e) {
            String errorMessage = format("%s error. %s", methodName, e.getMessage());
            log.error(errorMessage, e);
            responseResult.setCode("400");
            responseResult.setMsg(e.getMessage());
            result = JSON.toJSONString(responseResult);
        }
        log.debug(format("result: %s", result));
        log.debug(format("%s finish", methodName));
        return result;
    }

}
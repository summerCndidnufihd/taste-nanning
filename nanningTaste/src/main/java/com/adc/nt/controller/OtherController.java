package com.adc.nt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "other")
public class OtherController {

    @RequestMapping(value = "/toWelcome")
    public String toWelcome(){
        return "other/welcome";
    }

    @RequestMapping(value = "/toIndex")
    public String toIndex(){
        return "other/index";
    }

    @RequestMapping(value = "/toSystemLog")
    public String toSystemLog(){
        return "other/system-log";
    }
}

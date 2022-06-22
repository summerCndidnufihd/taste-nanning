package com.adc.nt.controller;

import com.adc.nt.model.Food;
import com.adc.nt.model.Store;
import com.adc.nt.service.FoodService;
import com.adc.nt.service.StoreService;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/store")
public class StoreController {
    private JSONObject json = new JSONObject();
    @Autowired
    private StoreService storeService;

    //添加商家（）
    @RequestMapping("/addStore")
    public String addStore(HttpServletRequest request, Store store, MultipartFile upload, Model model) throws IOException {
        System.out.println("-----文件上传------");
        String filename = upload.getOriginalFilename();
        String path = request.getSession().getServletContext().getRealPath("/upload");
        System.out.println(filename);
        System.out.println(path);
        /**
         *文件上传
         */
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        String uuid = UUID.randomUUID().toString().replace("-","");
        filename = uuid + "_" + filename;
        if (upload != null && !upload.isEmpty()) {
            upload.transferTo(new File(path,filename));
        } else {
            return "other/error";
        }
        System.out.println(store.getStoreName());
        store.setS_img(filename);

        storeService.addStore(store);
        System.out.println("保存成功！"+store.getS_img());
        System.out.println("保存成功！"+store.getS_id());
        StoreService s = new StoreService();
        try {
            List<Store> list = s.getStoreListByName(store.getStoreName());
            model.addAttribute("list",list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "other/success";
    }

    @RequestMapping( "/toAddStore")
    public String toAddStore() throws Exception {
        return "store/store-add";
    }
    //通过Id删除商家

    @RequestMapping(value = "/delStore/{s_id}")
    @ResponseBody
    public String deleteStoreById(@PathVariable int s_id) throws Exception{
        try{
            System.out.println("删除-----");
            int m = storeService.deleteStoreById(s_id);
            if(m>0){
                return "ok";
            }else{
                return "no";
            }
        }catch (Exception e){
            throw  new Exception(e);
        }
    }

    //获取所有商家信息

    @RequestMapping(value = "/allStore",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String getAllStoreList(Model model) throws Exception{
        try {
            List<Store> list =  storeService.getAllStoreList();
            model.addAttribute("list",list);
            return "store/allStore";
        }catch (Exception e){
            throw new Exception(e);
        }
    }

    //通过商家Id获取信息
    @RequestMapping("/getStoreListById")
    public String getStoreListById(@Param("s_id") int s_id, Model model) throws Exception{
        try {
            List<Store> list = storeService.getStoreListById(s_id);
            model.addAttribute("list",list);
            return "store/allStore";
        }catch (Exception e){
            throw new Exception(e);
        }
    }

    //修改商家
    @RequestMapping(value = "/toAlterStore/{s_id}",method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String alterStore(Model model, @PathVariable("s_id") int s_id) throws Exception{
             List<Store> storeList=storeService.getStoreListById(s_id);
             model.addAttribute("list",storeList);
            return "store/store-alter";
    }

    @RequestMapping(value = "/alterStore",method = RequestMethod.POST)
    public String alterStore(Model model,Store store) throws Exception{
            storeService.alterStore(store);
            List<Store> list = storeService.getStoreListById(store.getS_id());
            model.addAttribute("list",list);
            return "store/allStore";
    }
}

package com.adc.nt.controller;

import com.adc.nt.model.Food;
import com.adc.nt.model.Image;
//import com.adc.nt.service.ImageService;
import com.adc.nt.service.FoodService;
import com.adc.nt.service.ImageService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/img")
public class ImageController {

    @Autowired
    private ImageService imageService;


    @RequestMapping("/allImage")
    public String allImage(Model model) {
        List<Image> list =  imageService.allImage();
        System.out.println(list);
        model.addAttribute("list",list);
        return "image/allImage";
    }

    @RequestMapping("/save")
    public String save(MultipartFile file, Image image, ModelMap map) {
//        try {
////            return imageService.save(file, image, map);
////        } catch (IOException e) {
////            e.printStackTrace();
////        }
        return null;
    }

    @RequestMapping( "/toAddFoodImage")
    public String toAddFoodImage() throws Exception {
        return "image/foodImage-add";
    }

    @RequestMapping("/addFoodImage")
    public String addFoodImage(HttpServletRequest request, Image image, @RequestParam("pictureFile") MultipartFile files[], Model model) throws IOException {
        String fileName = null;
        String path = request.getSession().getServletContext().getRealPath("/upload");
        String msg = "";
        System.out.println(image.getI_id());
        if (files != null && files.length >0) {
            for(int i =0 ;i< files.length; i++){
                try {
                    fileName = files[i].getOriginalFilename();
                    String uuid = UUID.randomUUID().toString().replace("-","");
                    fileName = uuid + "_" + fileName;
                    files[i].transferTo(new File(path,fileName));
                    //存入数据库
                    image.setfImg(fileName);
                    imageService.save(image);
                } catch (Exception e) {
                    return "You failed to upload " + fileName + ": " + e.getMessage();
                }
            }
            List<Image> list = imageService.getImageByF_id(image.getF_id());
            model.addAttribute("list",list);
            return "image/allImage";
        } else {
            return "other/error";
        }
    }

    @RequestMapping("/getImageByF_id")
    public String getImageByF_id(Model model,@Param("f_id") int f_id){
        List<Image> list =  imageService.getImageByF_id(f_id);
        System.out.println(list);
        model.addAttribute("list",list);
        return "image/allImage";
    }

    @ResponseBody
    @RequestMapping(value = "/delImage/{i_id}")
    public String delFood(@PathVariable("i_id") int f_id) throws Exception {
        try{
            System.out.println("删除-----");
            int m = imageService.delImage(f_id);
            if(m>0){
                return "ok";
            }else{
                return "no";
            }
        }catch (Exception e){
            throw  new Exception(e);
        }
    }

    @RequestMapping(value = "/checkMoreImage/{f_id}",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String checkMoreImage( Model model, @PathVariable("f_id") int f_id) throws Exception {
        List<Image> list = imageService.getImageByF_id(f_id);
        model.addAttribute("list",list);
        return "image/moreImage";
    }
}

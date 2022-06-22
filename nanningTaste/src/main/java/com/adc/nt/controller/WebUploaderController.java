package com.adc.nt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adc.nt.dao.FileDao;
import com.adc.nt.dao.ImageDao;
import com.adc.nt.model.Image;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.adc.nt.dao.FileDao;

@Controller
@RequestMapping("/webUpload")
public class WebUploaderController {
    // 文件存储的根目录,放在程序运行的发布目录中，一般是在tomcat的安装同目录下
    String rootPath = "/upload/";

    @Autowired
    ImageDao imageDao;

    Map<String, Object> fileIdMap = new HashMap<String, Object>();

    /**
     * 参数定义 CommonsMultipartFile 接收文件上传内容
     * AjaxResult  表示传达的是ajax数据
     * @param // file是不能改变的，因为webuploader是以file参数往后台   传文件的；ff是自定义的文件实体
     * @return
     * @throws IOException
     * @throws IllegalStateException
     */
//    @ResponseBody
//    @RequestMapping(method = RequestMethod.POST, path = "upload/up")
//    public void upload(@RequestParam(name = "modelPath", required = false) String modelPath,
//                             @RequestParam(name = "file", required = false) CommonsMultipartFile file,
//                             @RequestParam(defaultValue = "public") String model,
//                       @RequestParam(defaultValue = "public") int f_id ,HttpServletRequest request,
//                             com.adc.nt.model.File ff) throws IllegalStateException, IOException {
//
//        // 判断是否有文件
//        if (file != null && !file.isEmpty()) {
//            // 获取文件的原始名称
//            String oldName = file.getOriginalFilename();
//            // 获取文件大小
//            Long fileSize = file.getSize();
//            // 获取文件的原始流
//            // f.getInputStream()
//            // 获取文件的类型
//            System.out.println(file.getContentType());
//
//            // 组装文件存储路径
//            SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd");
//            String dateStr = sdf.format(new Date());
//            String filePath = rootPath + model + File.separator + dateStr;
//
//            // 创建目录
//            File f = new File(filePath);
//            if (!f.exists()) {
//                f.mkdirs();
//            }
//
//            // 生成一个新的不会重复的文件名
//            // 1.获取后缀
//            String suffix = FilenameUtils.getExtension(file.getOriginalFilename());
//            // 2.生成新的文件名
//            String newFileName = UUID.randomUUID().toString() + "." + suffix;
//            // 把上传的文件存储指定位置
//            file.transferTo(new File(f, newFileName));
//            String FilePath = rootPath + model + File.separator + dateStr + File.separator + newFileName;
//
////            ff.setFileModel(model);
//            ff.setFileName(oldName);
//            ff.setFilePath(FilePath.replace("\\", "/"));
//            ff.setF_id(f_id);
//            ff.setFileType(suffix);
//            fileDao.save(ff);
//            fileIdMap.put("fileId", ff.getFileId());
//        } else {
//            System.out.println("上传失败！！");
//        }
////        return new AjaxResult(fileIdMap);
//    }

    @RequestMapping(value = "/upload")
    public String updateItem(@RequestParam("pictureFile") MultipartFile[] pictureFile, @RequestParam("u_id") int u_id, HttpServletRequest request) throws IOException {
        //图片上传 //设置图片名称，名称不能重复，可以使用uuid
        String picName = UUID.randomUUID().toString().replace("-","");
        System.out.println("传入图片的数量："+pictureFile.length);
        System.out.println("传入其他的参数或者实体："+u_id);
        //获取文件名
        String oriName = pictureFile[0].getOriginalFilename();
        System.out.println("获取文件名 "+oriName);
        //获取图片后缀
        String extName = oriName.substring(oriName.lastIndexOf("."));
        System.out.println("获取图片后缀"+extName);

        String path = request.getSession().getServletContext().getRealPath("image");
        System.out.println("图片路径"+path);
        File dir = new File(path,picName+extName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        //开始上传
        pictureFile[0].transferTo(dir);
        //存到数据库
        Image image = new Image();
        image.setfImg(path);
        image.setF_id(u_id);
        imageDao.save(image);
        return "food/allFood";
    }

}
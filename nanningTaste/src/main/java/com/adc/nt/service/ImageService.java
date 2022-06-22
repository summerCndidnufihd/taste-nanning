package com.adc.nt.service;

import com.adc.nt.dao.ImageDao;
import com.adc.nt.model.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ImageService {
    @Autowired
    private ImageDao imageDao;

    @Transactional
    public void save( Image image) throws IOException {
        imageDao.save(image);
    }

    public List<Image> getImageById(int i_id) {
        return imageDao.getImageById(i_id);
    }

    public List<Image> allImage() {
        return imageDao.allImage();
    }

    public List<Image> getImageByF_id(int f_id) {
        return imageDao.getImageByF_id(f_id);
    }

    public int delImage(int f_id) {
        return imageDao.delImage(f_id);
    }
}

package com.situ.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.situ.model.productModel;
import com.situ.service.PropicService;

import net.sf.json.JSONObject;
@Controller
@RequestMapping("/prop")
public class proPicController {
	@Autowired
	private PropicService proPicService;
	 private String PATH = "D:/DxOffice/workspace/image/";

	    @RequestMapping("/upload")
	    @ResponseBody
	    public String upload(HttpServletRequest request, String code) throws IllegalStateException, IOException {
	        // 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
	        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
	                request.getSession().getServletContext());
	        // 检查form中是否有enctype="multipart/form-data"
	        if (multipartResolver.isMultipart(request)) {
	            // 将request变成多部分request
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
	            // 获取multiRequest 中所有的文件名
	            Iterator<String> iter = multiRequest.getFileNames();
	            // 一次遍历所有文件
	            while (iter.hasNext()) {
	                MultipartFile file = multiRequest.getFile(iter.next().toString());
	                if (file != null) {
	                    String filename = file.getOriginalFilename();
	                    String saveName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	                    String path = PATH + saveName;
	                    file.transferTo(new File(path));// 上传
	                    proPicService.insert(new productModel(code, saveName, "2"));
	                }
	            }
	        }
	        Map<String, String> result = new HashMap<>();
	        result.put("code", "0");
	        return JSONObject.fromObject(result).toString();
	    }

	    @RequestMapping(value = "/getList", produces = "application/json;charset=utf-8")
	    @ResponseBody
	    private String getList(productModel productPicModel) {
	        productPicModel.setCode("%" + productPicModel.getCode() + "%");
	        productPicModel.setOrderby("type");
	        Map<String, Object> map = new HashMap<>();
	        map.put("list", proPicService.selectAll(productPicModel));
	        return JSONObject.fromObject(map).toString();
	    }

	    @RequestMapping("/del")
	    @ResponseBody
	    public String del(productModel productPicModel) {
	        File file = new File(PATH + productPicModel.getUrl());
	        file.delete();
	        return proPicService.deleteModel(productPicModel) + "";
	    }

	    @RequestMapping("/setMain")
	    @ResponseBody
	    public String setMain(productModel productPicModel) {
	        Integer id = productPicModel.getId();
	        productModel t = new productModel();
	        t.setCode(productPicModel.getCode());
	        List<productModel> list = proPicService.selectAll(t);
	        for (productModel ppm : list) {
	            if (id.equals(ppm.getId())) {
	                ppm.setType("1");
	            } else {
	                ppm.setType("2");
	            }
	            proPicService.updateActive(ppm);
	        }
	        return "1";
	    }
}

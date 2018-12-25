package com.situ.controller;



import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.situ.model.productModel;
import com.situ.service.ProService;


import st.tool.FormatEmpty;

@Controller
@RequestMapping("/pro")
public class ProdController {
	@Autowired
	private ProService proService;
	
	
	@RequestMapping(value = "/getName", produces = "application/json; charset=UTF-8")
	@ResponseBody
	private String getName() {
		
		productModel model = new productModel();
		 List<productModel> list=proService.getListByuser(model);
	     return FormatEmpty.isEmpty(list) ? "" :new JSONArray(list).toString();
	}
	
	@RequestMapping("/delUser")
	@ResponseBody
	private String delUser(String code) {
		
		productModel model = new productModel();
	        model.setCode(code);
	        return proService.deleteModel(model);
	}
	
	
	
	@RequestMapping(value="/upd",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String upd(productModel model) {
		String code=model.getCode();
		String name=model.getName();
		String cost=model.getCost();
		Integer sum=model.getSum();
		String state=model.getState();
		
		String product_type=model.getProduct_type();
		
		productModel model1 = new productModel(code,name,cost,sum,state,product_type);
        
        return proService.updateActive(model1);
    }
	
	
	
	@RequestMapping(value="/getModel",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String getModel(String code) {
        
		productModel modelDB = proService.select(code);
        return modelDB == null ? "" : new JSONObject(modelDB).toString();
    }
	
	
	@RequestMapping("/add")
	@ResponseBody
	private int add(productModel mmo,String parentcode,String parentcode2,HttpServletRequest request) {
		String code=mmo.getCode();
		productModel ss=proService.select(code);
		if(!FormatEmpty.isEmpty(ss)) {
			return 1;
		}
		String name=mmo.getName();
		String cost=mmo.getCost();
		
		Integer sum=mmo.getSum();
		String state=mmo.getState();
		
		String product_type=parentcode2;
		
		productModel model = new productModel(code,name,cost,sum,state,product_type);
        return FormatEmpty.isEmpty(proService.insert(model)) ? 2 : 0;
    }
	@RequestMapping(value = "/getpro", produces = "application/json; charset=UTF-8")
	@ResponseBody
	private String getpro(productModel cate, HttpServletRequest request) throws UnsupportedEncodingException {
		String code=cate.getCode();
		String code1="%"+code+"%";
		String name=cate.getName();
		String name1="%"+name+"%";
		productModel model=new productModel(code1,name1);
		model.setPageOn(true);
		model.setPageIndex(cate.getPageIndex());
		model.setPageLimit(cate.getPageLimit());
		List<productModel> list = proService.getListByuser(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", proService.getCount(model));
		return FormatEmpty.isEmpty(list) ? "" : new JSONObject(map).toString();
	}
}

package com.situ.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mapper.CateMapper;
import com.situ.model.CateModel;
import com.situ.service.CateService;

import st.tool.FormatEmpty;

@Controller
@RequestMapping("/cate")
public class CateController {
	@Autowired
	private CateService cateService;
	@RequestMapping("/delUser")
	@ResponseBody
	private String delUser(String code) {
		
		
		CateModel model = new CateModel(code);
        return cateService.delete(model);
	}
	@RequestMapping(value="/getcctv",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String getUser(String code) {
		
		CateModel model = cateService.getUserByCode(code);
		return model == null ? "" : new JSONObject(model).toString();
	}
	
	
	@RequestMapping(value="/upduser",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String upduser(CateModel model,Integer id) {
		String code = model.getCode();
		String name = model.getName();
		String parentcode = model.getParentcode();
		String note=model.getNote();
		CateModel ui = new CateModel(code, name, parentcode,note);
		ui.setId(id);
		// request.getSession().setAttribute("user", ui);
		String list = cateService.update(ui)+"";
		if (list != "") {
			return "1";
		} else {
			return "2";
		}
	}
	
	
	@RequestMapping(value="/getList",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String getList() {
		CateModel ss = new CateModel();
		ss.setOrderby("parentcode");
		List<CateModel> list = cateService.getListByuser1(ss);
		return new JSONArray(list).toString();
		
	}
	@RequestMapping("/add")
	@ResponseBody
	private String add(CateModel model) {// 1成功 2编码已存在，0失败
		String code = model.getCode();
		String name = model.getName();
		String parentcode = model.getParentcode();
		String note=model.getNote();
		CateModel dd = new CateModel(code, name, parentcode, note);
		return cateService.insert(dd);

	}
	@RequestMapping(value="/getListup",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String getListUp(String up) {
        
		CateModel model = new CateModel();
        model.setParentcode(up);
        model.setOrderby("parentcode,code");
        List<CateModel> list = cateService.getListByuser(model);
        return FormatEmpty.isEmpty(list) ? "" : new JSONArray(list).toString();
    }
	
	@RequestMapping(value="/getCate",produces="application/json; charset=UTF-8")
	@ResponseBody
	private String getUser(CateModel cate,HttpServletRequest request) throws UnsupportedEncodingException {
		
		String code = cate.getCode();
		String code1="%"+code+"%";
		String name = cate.getName();
		String name1="%"+name+"%";
		String parentcode = cate.getParentcode();
		String note = cate.getNote();
		CateModel model = new CateModel(code1, name1, parentcode,note);
		model.setPageOn(true);
		
		model.setPageIndex(cate.getPageIndex());
		model.setPageLimit(cate.getPageLimit());
		List<CateModel> list = cateService.getListByuser(model);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("count", cateService.getCount(model));
		return FormatEmpty.isEmpty(list) ? "" : new JSONObject(map).toString();
	}
	
}

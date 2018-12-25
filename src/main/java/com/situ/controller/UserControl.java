package com.situ.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.model.UserModel;
import com.situ.service.UserService;

import st.tool.FormatEmpty;
import st.tool.MD5;

@Controller
@RequestMapping("/user")
public class UserControl {
	@Autowired
	private UserService userService;

	@RequestMapping("/getListAll")
	@ResponseBody
	private String getListAll() {

		UserModel model = new UserModel();
		model.setOrderby("username");
		List<UserModel> list = userService.getListByuser(model);
		return FormatEmpty.isEmpty(list) ? "" : new JSONArray(list).toString();
	}

	@RequestMapping("/logout")
	
	private String logout() {
		return "back/login";

	}
@RequestMapping("/loginsuc")
	
	private String loginsuc() {
		return "back/index";

	}
	

	@RequestMapping("/delUser")
	@ResponseBody
	private String delUser(UserModel userModel, HttpServletRequest request) {
		String code = userModel.getCode();
		UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");
		if (code.equals(sessionUser.getCode())) {
			return "2"; 
		}
		//UserModel um = new UserModel(code, null, null);
		return userService.delete(code)+"";
	}

	private String pasUser(HttpServletRequest request) {
		return null;
	}

	@RequestMapping("/getList")
	@ResponseBody
	private String getList(UserModel userModel) {
		String code = userModel.getCode();
		if(code==null) {
			code="";
		}
		code = "%" + code + "%";
		String name = userModel.getName();
		if(name==null) {
			name="";
		}
		name = "%" + name + "%";
		String role=userModel.getRole();
		UserModel model = new UserModel(code, name, null,role);
		model.setPageOn(true);
		model.setPageIndex(userModel.getPageIndex());
		model.setPageLimit(userModel.getPageLimit());
		List<UserModel> list = userService.getListByuser(model);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", userService.selectCount(model));
		return FormatEmpty.isEmpty(list) ? "" : new JSONObject(map).toString();
	}

	@RequestMapping("/upduser")
	@ResponseBody
	private String upduser(UserModel model, HttpServletRequest request) {
		String code = model.getCode();
		String name = model.getName();
		UserModel ui = new UserModel(code,name, null);
		UserModel sessionUser = (UserModel) request.getSession().getAttribute("user");

		if (code.equals(sessionUser.getCode())) {
			sessionUser.setName(name);
			request.getSession().setAttribute("user", sessionUser);
		}
		return userService.update(ui);

	}

	@RequestMapping(value="/getUser",method=RequestMethod.POST)
	@ResponseBody
	private String getUser(UserModel userModel) {
		String code = userModel.getCode();
		UserModel model = userService.getUserByCode(code);
		return model == null ? "" : new JSONObject(model).toString();
	}

	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	private String login(String code,String AuthCode,String pass,HttpServletRequest request) {
		String pass1=MD5.encode(pass);
		String authcode=(String)request.getSession().getAttribute("authCode");
		if(!authcode.equals(AuthCode)) {
			return "2";
		}
		UserModel ModelDB = userService.getUserByCode(code);
		if(ModelDB.getRole().equals("putong")) {
			
			return "3";
		}else if (ModelDB != null&& ModelDB.getPass().equals(pass1)) {
			request.getSession().setAttribute("user", ModelDB);
			return "0";
		}else {
			return "1";
		}
		}
		//pass = MD5.encode(pass);
		
		
		

	

	/**
	 * 0-成功-1-账号存在-2-失败
	 */

	@RequestMapping(value="/reg",method=RequestMethod.POST)
	@ResponseBody
	private String reg(UserModel model,HttpServletRequest request) {
		
		model.setPass(MD5.encode(model.getPass()));
		return userService.insert(model);

	}
	@RequestMapping(value="/reg1",method=RequestMethod.POST)
	@ResponseBody
	private String reg1(String username,String password,String role,String usercode,HttpSession session) {
		UserModel model=new UserModel();
		model.setPass(MD5.encode(password));
		model.setName(username);
		model.setRole(role);
		model.setCode(usercode);
		session.setAttribute("userpom", model);
		return userService.insert(model);

	}
}

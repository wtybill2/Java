package com.situ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//import com.situ.mapper.AddrMapper;
import com.situ.model.UserModel;
import com.situ.mapper.UserMapper;

import st.tool.FormatEmpty;

@Service
public class UserService {
	@Autowired
	public UserMapper userMapper;
	/*@Autowired
	public AddrMapper addrMapper;*/
	
	public String insert(UserModel ui) {
		UserModel modelDB = getUserByCode(ui.getCode());
        String res = modelDB == null ? insert2(ui) : null;
        return FormatEmpty.isEmpty(res) ? "0" : "1";
	}
	public String insert2(UserModel um) {
		return userMapper.insert(um)+"";
	}
	public List<UserModel> getListByModel(UserModel um){
		if(um.isPageOn()) {
			return userMapper.selectModel(um);
		}else {
			return userMapper.selectAll(um);
		}
	}
	
	public String update(UserModel ui) {
		return userMapper.updateActive(ui)+"";
	}
	public UserModel getUserByCode(String code) {
		UserModel u1 = new UserModel();
		u1.setCode(code);
		List<UserModel> list = getListByuser(u1);
		return FormatEmpty.isEmpty(list) ? null : list.get(0);
		
	}
	public String getUserBycde(String code) {
		UserModel u1 = new UserModel();
		u1.setCode(code);
		List<UserModel> list = getListByuser(u1);
		return FormatEmpty.isEmpty(list) ? "0" : "1";
		
	}
	public List<UserModel> getListByuser(UserModel ui) {
		
		return userMapper.selectModel(ui);
	}
	public List<UserModel> getListByuser(String code) {
		UserModel ui=new UserModel();
		ui.setCode(code);
		 return userMapper.selectModel(ui);
	}
	/*public String deleteUser(UserModel um) {
		AddrModel addrModel=new AddrModel();
		addrModel.setCode(um.getCode());
		if(addrMapper.selectCount(addrModel)!=0) {
			return userMapper.delete(um)+"";
		}else {
			return "3";
		}
	}*/
	public int delete(String code) {
		UserModel ui=new UserModel();
		ui.setCode(code);
		return userMapper.deleteModel(ui);
	}
	public int selectCount(UserModel model) {
		return userMapper.selectCount(model);
	}
	

}

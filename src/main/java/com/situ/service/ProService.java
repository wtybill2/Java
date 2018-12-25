package com.situ.service;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mapper.ProdMapper;
import com.situ.model.productModel;

import st.tool.FormatEmpty;


@Service
public class ProService {
@Autowired
private ProdMapper prodMapper;
	public List<productModel> getListByuser(productModel model) {
		 return prodMapper.selectModel(model);
	}

	public int getCount(productModel model) {
		 return prodMapper.selectCount(model);
	}

	public int insert(productModel model) {
		
		return prodMapper.insert(model);
	}

	public productModel select(String code) {
		productModel pro=new productModel();
		pro.setCode(code);
		return prodMapper.select(pro);
	}

	public String updateActive(productModel model) {
		return prodMapper.updateActive(model)+"";
	}

	public String deleteModel(productModel model) {
		prodMapper.deleteModel(model.getCode());
		return prodMapper.delete(model.getCode())+"";
	}

	

}

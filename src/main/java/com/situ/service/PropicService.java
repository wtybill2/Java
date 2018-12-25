package com.situ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mapper.ProdMapper;
import com.situ.model.productModel;
@Service
public class PropicService {
	@Autowired
	private ProdMapper proMapper;
	public int insert(productModel productModel) {
		return proMapper.insertmodel(productModel);
	}
	public List<productModel> selectAll(productModel productPicModel) {
		
		return proMapper.selectAll(productPicModel);
	}
	public String deleteModel(productModel productPicModel) {
		
		return proMapper.deleteModel(productPicModel)+"";
	}
	public int updateActive(productModel ppm) {
		return proMapper.update(ppm);
		
		
	}

}

package com.situ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.situ.mapper.CateMapper;
import com.situ.mapper.ProdMapper;
import com.situ.model.CateModel;
import com.situ.model.productModel;

import st.tool.FormatEmpty;

@Service
public class CateService {
	@Autowired
	private CateMapper cateMapper;
@Autowired
	private ProdMapper prodMapper;
	public CateModel getUserByCode(String code) {
		CateModel model = new CateModel();
		model.setCode(code);
		List<CateModel> list = cateMapper.selectModel(model);
		return FormatEmpty.isEmpty(list) ? null : list.get(0);
	}

	public List<CateModel> getListByuser(CateModel model) {
		
		return cateMapper.selectModel(model);
	}
public List<CateModel> getListByuser1(CateModel model) {
		
		return cateMapper.selectAll(model);
	}

	public int getCount(CateModel model) {
		return cateMapper.selectCount(model);
	}

	public String insert(CateModel dd) {
		CateModel d=new CateModel();
		d.setCode(dd.getCode());
		List<CateModel> list=cateMapper.selectModel(d);
		//String s=;
		if(!FormatEmpty.isEmpty(list)) {
			return "0";
		}else if(cateMapper.insert(dd)!=0) {
			return "1";
		}else {
			return "2";
		}
		
	}

	public int update(CateModel ui) {
		return cateMapper.updateActive(ui);
	}

	public String delete(CateModel ui) {
		String code = ui.getCode();
		CateModel dm1 = new CateModel();
        dm1.setParentcode(code);
        if (getCount(dm1) > 0) {
            return "2";
        }
        productModel am1 = new productModel();
        am1.setProduct_type(code);
        if (prodMapper.selectCount(am1) > 0) {
            return "3";
        }
        
		return cateMapper.deleteModel(ui)+"";
	}

	

	public List<CateModel> selectsecond() {
		
		return cateMapper.selectsecond();
	}

	public List<CateModel> selectTop() {
		
		return cateMapper.selectTop();
	}
	
}

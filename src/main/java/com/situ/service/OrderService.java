package com.situ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mapper.OrderMapper;
import com.situ.mapper.ProdMapper;
import com.situ.model.OrderModel;
import com.situ.model.productModel;

@Service

public class OrderService {
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private ProdMapper ProdMapper;

	public List<OrderModel> getListByuser(OrderModel model) {

		return orderMapper.selectModel(model);
	}
	public List<OrderModel> getListByorder(OrderModel model) {

		return orderMapper.selectdel(model);
	}
	public int getcount(OrderModel model) {

		return orderMapper.selectCount(model);
	}

	public String deleteModel(OrderModel model) {
		if(model.getId()!=null) {
			orderMapper.deleteModel(model);
		}
		return orderMapper.deletedao(model)+"";
	}

	public OrderModel select(OrderModel model) {

		return orderMapper.select(model);
	}

	public String insert(OrderModel mm) {

		return orderMapper.insertmodel(mm) + "";
	}

	public String insertorder(OrderModel mm) {

		return orderMapper.insert(mm) + "";
	}

	

	public List<OrderModel> selectdao(OrderModel order) {
		return orderMapper.selectDao(order);
	}

	public String delete(OrderModel model) {
		return orderMapper.delete(model)+"";
	}

	public List<OrderModel> selectAll(OrderModel model) {
		// TODO Auto-generated method stub
		return orderMapper.selectAll(model);
	}

	

}

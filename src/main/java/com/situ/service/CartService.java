package com.situ.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mapper.CartMapper;
import com.situ.model.cartModel;

@Service
public class CartService {
	@Autowired
	private CartMapper cartMapper;
	public int insert(cartModel cart) {
		return cartMapper.insert(cart);
		
	}

	//数据库查询购物车订单
	
	public List<cartModel> selectByUserId(String id) {
		return cartMapper.selectModel(id);
	}
	
	public int update(cartModel cart) {
		
		return cartMapper.update(cart);
	}

	public int updateActive(cartModel cart) {
		
		return cartMapper.updateActive(cart);
	}

	public int delete(String id) {
		// TODO Auto-generated method stub
		return cartMapper.delete(id);
	}

	public List<cartModel> selectAll(cartModel cart) {
		// TODO Auto-generated method stub
		return cartMapper.selectAll(cart);
	}

	public String deleteModel(cartModel cart) {
		return cartMapper.deleteModel(cart)+"";
		
	}

	
	

}

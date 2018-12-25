package com.situ.mapper;

import java.util.List;

import com.situ.model.cartModel;

public interface CartMapper {

	int insert(cartModel cart);

	List<cartModel> selectModel(Object id);
	
	List<cartModel> selectAll(cartModel cart);
	
	int update(cartModel cart);

	int updateActive(cartModel cart);

	int delete(String id);

	int deleteModel(cartModel cart);
	
	
}

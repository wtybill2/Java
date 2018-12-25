package com.situ.mapper;

import java.util.List;

import com.situ.model.OrderModel;



public interface OrderMapper {
	int insert(OrderModel model);

    int delete(Object id);
    
    int deletedao(OrderModel model);
    
    int deleteModel(OrderModel model);

    int update(OrderModel model);

    int updateActive(OrderModel model);

    OrderModel select(OrderModel model);

    
    List<OrderModel> selectdel(OrderModel model);

    List<OrderModel> selectModel(OrderModel model);

    int selectCount(OrderModel model);

	int insertmodel(OrderModel mm);

	List<OrderModel> selectDao(OrderModel order);

	List<OrderModel> selectAll(OrderModel model);


	
}

package com.situ.mapper;

import java.util.List;

import com.situ.model.productModel;



public interface ProdMapper {
	int insert(productModel model);

    int delete(Object id);
    
    int deleteModel(Object id);

    int deleteModel(productModel model);

    int update(productModel model);

    int updateActive(productModel model);

    productModel select(productModel model);

    List<productModel> selectAll(productModel model);

    List<productModel> selectModel(productModel model);

    int selectCount(productModel model);

	int insertmodel(productModel productModel);
	
}

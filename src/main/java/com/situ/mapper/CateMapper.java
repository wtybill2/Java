package com.situ.mapper;

import java.util.List;

import com.situ.model.CateModel;

public interface CateMapper {
	int insert(CateModel model);

    int delete(Object id);

    int deleteModel(CateModel model);

    int update(CateModel model);

    int updateActive(CateModel model);

    CateModel select(CateModel model);

    List<CateModel> selectAll(CateModel model);

    List<CateModel> selectModel(CateModel model);
    
    

    int selectCount(CateModel model);

	List<CateModel> selectsecond();

	List<CateModel> selectTop();
}

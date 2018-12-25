package com.situ.mapper;

import java.util.List;

import com.situ.model.UserModel;

public interface UserMapper {
	  int insert(UserModel model);

	    int delete(Object id);

	    int deleteModel(UserModel model);

	    int update(UserModel model);

	    int updateActive(UserModel model);

	    UserModel select(UserModel model);

	    List<UserModel> selectAll(UserModel model);

	    List<UserModel> selectModel(UserModel model);

	    int selectCount(UserModel model);
}

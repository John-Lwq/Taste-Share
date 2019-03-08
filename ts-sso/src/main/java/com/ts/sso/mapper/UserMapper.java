package com.ts.sso.mapper;

import java.util.List;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.User;

public interface UserMapper extends MyMapper<User>{

	public List<String> findModuleNameByUserId(Long userId);

	public User findUserByUsername(String username);

}

package com.ts.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.User;

public interface UserMapper extends MyMapper<User>{
	
	// 查看所有非管理员
	public List<User> queryUserList(@Param("start") int start,@Param("rows")int rows);

	// 删除用户只是改变status
	public void deleteUser(@Param("userId") Long userId);

	public int selectAllCount();
	
	// 查看所有管理员
	public List<User> queryManager(@Param("start") int start,@Param("rows")int rows);

	public int selectAllManageCount();

	// 通过用户名查用户密码
	public String selectUserByUsername(@Param("username")String username);
	
}

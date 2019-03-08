package com.ts.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.ParameterScriptAssert;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.Desc;

public interface DescMapper extends MyMapper<Desc> {
	// 通过餐厅id获得餐厅评论
	public List<Desc> queryRestaurantDesc(@Param("restaurantId")Long restaurantId, @Param("start")int start,@Param("rows") int rows);

	// 通过用户id获得用户发出的所有评论
	public List<Desc> queryCommentByUserId(@Param("userId") Long userId,@Param("start")int start,@Param("rows") int rows);

	// 通过改变收藏餐厅的状态来‘删除’餐厅
	public int updateCollection(@Param("userId") Long userId, @Param("restaurantId") Long restaurantId);

	public int selectAllCount();

	public int selectCountDesc(@Param("restaurantId") Long restaurantId);

	public int selectDescCountByUserId(@Param("userId") Long userId);
	
	public List<Desc> queryCommentByRestaurantUser(@Param("userId") int userId,@Param("start")int start,@Param("rows") int rows);
	
	public int count(@Param("userId") int userId);
	
}

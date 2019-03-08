package com.ts.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.Recommend;

public interface RecommendMapper extends MyMapper<Recommend> {

	// 根据餐厅id查找该餐厅的推荐菜
	public List<Recommend> queryRecommend ( @Param("restaurant_id") Long restaurantId, @Param("start") int start, @Param("rows") int rows);

	// 查询列表总记录数
	public int selectAllCount(@Param("restaurant_id") Long restaurantId);

}

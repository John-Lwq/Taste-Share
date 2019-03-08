package com.ts.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Restaurant;

public interface RestaurantMapper extends MyMapper<Restaurant> {

	// 分页查询餐厅信息，start起始数据，pageSize查询多少数据
	public List<Restaurant> findRestaurantList(@Param("start") int start, @Param("pageSize") int pageSize);

	// 根据restaurantIds改变餐厅状态
	public void updateByIds(@Param("restaurantId") Long restaurantId);

	// 通过类型获得餐厅列表
	public List<Restaurant> queryRestaurantByType(@Param("typeId") int typeId, @Param("start") int start,
			@Param("rows") int rows);

	// 通过用户收藏热度获得餐厅列表
	public List<Restaurant> queryRestaurantByHot(@Param("start") int start, @Param("rows") int rows);

	// 根据最新创建时间获得餐厅列表
	public List<Restaurant> queryRestaurantByTime(@Param("start") int start, @Param("rows") int rows);

	// 根据用户id获得用户收藏的餐厅所有信息
	public List<Restaurant> queryCollectionRestaurantByUserId(@Param("userId") Long userId, @Param("start") int start,
			@Param("rows") int rows);

	// 商家通过id查询自己拥有的餐厅信息
	public List<Restaurant> queryRestaurantByUserId(@Param("userId") Long userId, @Param("start") int start,
			@Param("rows") int rows);

	// 商家通过自己id查看自己餐厅的评论
	public List<Desc> queryDescByOrderId(@Param("userId") Long userId, @Param("start") int start,
			@Param("rows") int rows);

	public int selectAllCount();

	// 通过榜单查看餐厅
	public List<Restaurant> queryRestaurantByRank(@Param("start") int start,
			@Param("rows") int rows);

	public int selectAllCountByTypeId(@Param("typeId")Integer typeId);

	public Restaurant selectRestaurant2(@Param("userId") Long userId);


}

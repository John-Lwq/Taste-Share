package com.ts.manage.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.manage.mapper.DescMapper;
import com.ts.manage.mapper.RecommendMapper;
import com.ts.manage.mapper.RestaurantMapper;
import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Recommend;
import com.ts.common.pojo.Restaurant;
import com.ts.common.util.PageBean;

@Service
public class RestaurantService {

	@Autowired
	private RestaurantMapper restaurantMapper;

	@Autowired
	private RecommendMapper recommendMapper;

	@Autowired
	private DescMapper descMapper;
	
	
	
	// 查看餐厅总数
	public int restaurantNum(){
		int restaurantNum = restaurantMapper.selectAllCount();
		return restaurantNum;
	}

	// 分页查询餐厅信息
	public PageBean findRestaurantList(Integer currPage, Integer pageSize) {
		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.findRestaurantList(startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;
	}

	// 新增餐厅
	public void addRestaurant(Restaurant restaurant) {
		restaurant.setStatus(1);
		restaurant.setCreated(new Date());
		restaurant.setUpdated(restaurant.getCreated());
		restaurantMapper.insertSelective(restaurant);

	}

	// 通过Id查找餐厅信息
	public Restaurant findRestaurantById(Long restaurantId) {
		Restaurant restaurant = new Restaurant();
		restaurant.setRestaurantId(restaurantId);
		return restaurantMapper.selectByPrimaryKey(restaurant);

	}

	// 删除餐厅，实际操作是更改餐厅状态是启用还是禁用
	public void updateStatusById(Long restaurantId) {
		
		restaurantMapper.updateByIds(restaurantId);

	}

	// 更新餐厅信息
	public int updateRestaurant(Restaurant restaurant) {
		restaurant.setUpdated(new Date());
		return restaurantMapper.updateByPrimaryKeySelective(restaurant);

	}

	// 通过餐厅id查找该餐厅的推荐菜
	public PageBean queryRecommend(Long restaurantId, Integer currPage, Integer pageSize) {
		

		PageBean<Recommend> pageBean = new PageBean<Recommend>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = recommendMapper.selectAllCount(restaurantId);
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Recommend> descList = recommendMapper.queryRecommend(restaurantId,currPage,pageSize);
		pageBean.setPageList(descList);
		return pageBean;
		

	}

	// 通过餐厅id查看该餐厅的评论
	public PageBean queryRestaurantDesc(Long restaurantId,Integer currPage, Integer pageSize) {
		
		PageBean<Desc> pageBean = new PageBean<Desc>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = descMapper.selectCountDesc(restaurantId);
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Desc> descList = descMapper.queryRestaurantDesc(restaurantId,startRow, pageSize);
		pageBean.setPageList(descList);
		return pageBean;
		
	}

	// 通过餐厅类型获得餐厅列表并分页
	public PageBean queryRestaurantByType(Integer typeId, Integer currPage, Integer pageSize) {

		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCountByTypeId(typeId);
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.queryRestaurantByType(typeId,startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;
		
	}

	// 通过热度来获得餐厅列表并分页
	public PageBean queryRestaurantByHot(Integer currPage, Integer pageSize) {
		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.queryRestaurantByHot(startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;
	}

	// 按照最新创建时间获得餐厅列表并分页
	public PageBean queryRestaurantByTime(Integer currPage, Integer pageSize) {
		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.queryRestaurantByTime(startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;
	}

	// 根据用户id获得用户收藏的餐厅所有信息
	public PageBean queryCollectionRestaurantByUserId(Long userId, Integer currPage, Integer pageSize) {
		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.queryCollectionRestaurantByUserId(userId,startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;

	}

	// 商家通过自己id查询自己餐厅
	public PageBean queryRestaurantByUserId(Long userId, Integer currPage, Integer pageSize) {
		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.queryRestaurantByUserId(userId,startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;


	}

	// 查看店主自己的店铺的评论
	public PageBean queryDescByOrderId(Long userId, Integer currPage, Integer pageSize) {
		PageBean<Desc> pageBean = new PageBean<Desc>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = descMapper.selectDescCountByUserId(userId);
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Desc> descList = restaurantMapper.queryDescByOrderId(userId,startRow, pageSize);
		pageBean.setPageList(descList);
		return pageBean;
	}

	public PageBean queryRestaurantByRank(Integer currPage, Integer pageSize) {
		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = restaurantMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Restaurant> restaurantList = restaurantMapper.queryRestaurantByRank(startRow, pageSize);
		pageBean.setPageList(restaurantList);
		return pageBean;
		
	}

	public Restaurant queryRestaurantByUserId2(Long userId) {
		 return restaurantMapper.selectRestaurant2(userId);
		
	}

	public PageBean queryMyRecommend(int userId, Integer currPage, Integer pageSize) {
		PageBean<Desc> pageBean = new PageBean<Desc>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = descMapper.count(userId);
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Desc> descList = descMapper.queryCommentByRestaurantUser(userId, startRow, pageSize);
		pageBean.setPageList(descList);
		return pageBean;
	}

}

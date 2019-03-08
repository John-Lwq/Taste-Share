package com.ts.manage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.common.pojo.Recommend;
import com.ts.common.util.PageBean;
import com.ts.manage.mapper.RecommendMapper;

@Service
public class RecommendService {
	
	@Autowired
	private RecommendMapper recommendMapper;
	

	public PageBean findRestaurantRecommendById(Long restaurantId,Integer currPage,Integer pageSize) {

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
		List<Recommend> recommendList = recommendMapper.queryRecommend(restaurantId,currPage,pageSize);
		pageBean.setPageList(recommendList);
		return pageBean;
		
		
	}

}

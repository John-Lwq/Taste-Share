package com.ts.manage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.common.pojo.Desc;
import com.ts.manage.mapper.DescMapper;

@Service
public class DescService {

	@Autowired
	private DescMapper descMapper;

	// 其实只是改变status状态为0
	public int deleteDescByUserId(Long descId) {
		Desc desc =new Desc();
		desc.setDescId(descId);
		desc.setStatus(0);
		// 返回值市影响到的行数  0更新成功  1更新失败
		return descMapper.updateByPrimaryKeySelective(desc);
	}

	// 改变收藏的餐厅状态为0
	public int deleteCollection(Long userId, Long restaurantId) {
		return descMapper.updateCollection(userId,restaurantId);
	}
	

	
}

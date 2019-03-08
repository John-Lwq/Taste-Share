package com.ts.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.redis.RedisClusterService;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.DescService;

@Controller
public class WebDescController {

	@Autowired
	private DescService descService;

	@Autowired
	private RedisClusterService redis;

	// 根据descId设置desc状态为0
	@RequestMapping("deleteDesc/{descId}")
	@ResponseBody
	public SysResult deleteDescByDescId(@PathVariable Long descId) {
		try {

			String key = "desc_" + descId;
			int i = descService.deleteDescByUserId(descId);
			if (i > 0) {
				if (redis.exists(key)) {
					redis.del(key);
				}
				return SysResult.oK();
			}
			return SysResult.build(201, "删除评论失败");
		} catch (Exception e) {
			return SysResult.build(201, "删除评论失败");
		}
	}

	// 用户删除自己收藏的餐厅
	@RequestMapping("deleteCollection/{userId}/{restaurantId}")
	@ResponseBody
	public SysResult deleteCollection(@PathVariable Long userId, @PathVariable Long restaurantId) {
		try {
			String key = "collection_"+ userId+"_"+restaurantId;
			int i = descService.deleteCollection(userId, restaurantId);
			if (i > 0) {
				if (redis.exists(key)) {
					redis.del(key);
				}
				return SysResult.oK();
			}else{
			return SysResult.build(201, "删除收藏餐厅失败");
			}
		} catch (Exception e) {
			return SysResult.build(201, "删除收藏餐厅失败");
		}
	
	}

}

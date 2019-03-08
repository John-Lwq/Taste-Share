package com.ts.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.Menu;

public interface MenuMapper extends MyMapper<Menu> {
	// 通过热度查询菜谱
	public List<Menu> queryMenuListByHot(@Param("start") int start, @Param("rows") int rows);

	// 通过最新创建时间查看菜谱
	public List<Menu> queryMenuListByTime(@Param("start") int start, @Param("rows") int rows);

	// 查询列表总记录数
	public int selectAllCount();

	// 查看所有menu
	public List<Menu> menuList(@Param("start") int start, @Param("rows") int rows);
}

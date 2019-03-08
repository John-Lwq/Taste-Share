package com.ts.manage.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.common.pojo.Article;
import com.ts.common.pojo.Menu;
import com.ts.common.util.PageBean;
import com.ts.manage.mapper.MenuMapper;

@Service
public class MenuService {

	@Autowired
	private MenuMapper menuMapper;

	// 通过menuId查找菜单
	public Menu queryMenuById(Long menuId) {
		Menu menu = new Menu();
		menu.setMenuId(menuId);
		return menuMapper.selectOne(menu);
	}

	// 通过热度查看菜谱
	public PageBean queryMenuByHot(Integer currPage, Integer pageSize) {

		PageBean<Menu> pageBean = new PageBean<Menu>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = menuMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Menu> menuList = menuMapper.queryMenuListByHot(startRow, pageSize);
		pageBean.setPageList(menuList);
		return pageBean;
	}

	// 通过创建时间查看菜谱
	public PageBean queryMenuByTime(Integer currPage, Integer pageSize) {

		PageBean<Menu> pageBean = new PageBean<Menu>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = menuMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Menu> menuList = menuMapper.queryMenuListByTime(startRow, pageSize);
		pageBean.setPageList(menuList);
		return pageBean;
	}

	// 获取所有menu
	public PageBean menuList(Integer currPage, Integer pageSize) {
		PageBean<Menu> pageBean = new PageBean<Menu>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = menuMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Menu> menuList = menuMapper.menuList(startRow, pageSize);
		pageBean.setPageList(menuList);
		return pageBean;
	}

	// 更新menu
	public void updateMenu(Menu menu) {
		menu.setUpdated(new Date());
		menuMapper.updateByPrimaryKeySelective(menu);
	}

	public int menuNum() {
		int menuNum = menuMapper.selectAllCount();
		return menuNum;
	}

	public void deleteMenu(Long menuId) {

		menuMapper.deleteByPrimaryKey(menuId);
	}
}

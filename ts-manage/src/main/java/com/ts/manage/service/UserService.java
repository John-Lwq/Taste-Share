package com.ts.manage.service;

import java.util.Date;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.tomcat.util.digester.Digester;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ts.common.pojo.Desc;
import com.ts.common.pojo.Menu;
import com.ts.common.pojo.User;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.PageBean;
import com.ts.manage.mapper.DescMapper;
import com.ts.manage.mapper.UserMapper;

@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;

	@Autowired
	private DescMapper descMapper;

	@Autowired
	private RedisClusterService redis;

	// 获取所有管理员数量
	public int managerNum() {
		int managerNum = userMapper.selectAllManageCount();
		return managerNum;
	}

	// 获取所有用户数量
	public int userNum() {
		int userNum = userMapper.selectAllCount();
		return userNum;
	}

	
	// 用户管理员查询用户列表
	public PageBean queryUserList(Integer currPage, Integer pageSize) {
		PageBean<User> pageBean = new PageBean<User>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = userMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<User> userList = userMapper.queryUserList(startRow, pageSize);
		pageBean.setPageList(userList);
		return pageBean;
	}

	// 更新用户信息
	public int updateUser(User user) {
			User one = userMapper.selectByPrimaryKey(user.getUserId());
			one.setGender(user.getGender());
			one.setLocation(user.getLocation());
			one.setUserId(user.getUserId());
			one.setName(user.getName());
			one.setNickname(user.getUsername());
			one.setPassword(user.getPassword());
			one.setPhoneNumber(user.getPhoneNumber());
			one.setUpdated(new Date());
			one.setBirthday(user.getBirthday());
			return userMapper.updateByPrimaryKeySelective(one);
		

	}

	// 查询单个用户信息
	public User selectOne(Long userId) {
		User user = new User();
		user.setUserId(userId);
		return userMapper.selectOne(user);
	}

	// 删除用户不删除数据将状态改为0
	public void deleteUser(Long userId) {
		userMapper.deleteUser(userId);
	}

	// 通过userid来查询用户的评论
	public PageBean queryCommentByUserId(Long userId, Integer currPage, Integer pageSize) {
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
		List<Desc> descList = descMapper.queryCommentByUserId(userId, startRow, pageSize);
		pageBean.setPageList(descList);
		return pageBean;

	}

	public PageBean managerList(Integer currPage, Integer pageSize) {
		PageBean<User> pageBean = new PageBean<User>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = userMapper.selectAllManageCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<User> managerList = userMapper.queryManager(startRow, pageSize);
		pageBean.setPageList(managerList);
		return pageBean;

	}

	// 根据ticket的值返回user的String对象
	public String queryUser(String result) {
		return redis.get(result);
	}

	public String selectUserByUsername(String username) {
		String password=userMapper.selectUserByUsername(username);
		return password;
	}
}

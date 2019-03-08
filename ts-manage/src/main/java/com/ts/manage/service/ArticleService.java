package com.ts.manage.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.ts.common.pojo.Article;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.manage.mapper.ArticleMapper;

@Service
public class ArticleService {

	@Autowired
	private ArticleMapper articleMapper;

	@Autowired
	private RedisClusterService redis;

	// 通过Id查看文章
	public Article queryArticleById(Long articleId) throws Exception {
		String key = "article_" + articleId;
		String value = "";
		if (redis.exists(key)) {
			value = redis.get(key);
			Article article = ObjectUtil.mapper.readValue(value, Article.class);
			return article;

		} else {
			Article article = new Article();
			article.setId(articleId);
			Article article2 = articleMapper.selectByPrimaryKey(article);
			value = ObjectUtil.mapper.writeValueAsString(article2);
			redis.set(key, value);
			return article2;
		}

	}

	// 通过热度查看文章
	public PageBean queryArticleByHot(Integer currPage, Integer pageSize) {
		PageBean<Article> pageBean = new PageBean<Article>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = articleMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Article> articleList = articleMapper.queryArticleListByHot(startRow, pageSize);

		pageBean.setPageList(articleList);
		return pageBean;
	}

	// 通过最新创建时间查看文章
	public PageBean queryArticleByTime(Integer currPage, Integer pageSize) {
		PageBean<Article> pageBean = new PageBean<Article>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = articleMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Article> articleList = articleMapper.queryArticleListByTime(startRow, pageSize);
		pageBean.setPageList(articleList);
		return pageBean;
	}

	// 查询所有article
	public PageBean articleList(Integer currPage, Integer pageSize) {
		PageBean<Article> pageBean = new PageBean<Article>();
		// 封装当前的页数
		pageBean.setCurrPage(currPage);
		// 每页显示的数据
		pageBean.setPageSize(pageSize);
		// 封装总记录数
		int total = articleMapper.selectAllCount();
		pageBean.setTotalCount(total);
		// 分装总页数
		int page = (int) Math.ceil(total / pageSize) + 1;
		pageBean.setTotalPage(page);
		// 计算当前页从第几行开始
		int startRow = currPage == 1 ? 0 : pageSize * (currPage - 1);
		// 封装每页显示的数据
		List<Article> articleList = articleMapper.selectAllArticle(startRow, pageSize);
		pageBean.setPageList(articleList);
		return pageBean;
	}

	public void updateArticle(Article article) {
		article.setUpdated(new Date());
		articleMapper.updateByPrimaryKeySelective(article);

	}

	// 文章总数
	public int articleNum() {
		int num = articleMapper.selectAllCount();
		return num;
	}

	public void deleteArticle(Long id) {
		articleMapper.deleteByPrimaryKey(id);
	}
}

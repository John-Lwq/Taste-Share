package com.ts.manage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Article;
import com.ts.common.redis.RedisClusterService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.SysResult;
import com.ts.manage.service.ArticleService;

@Controller
public class WebAritlcelController {

	@Autowired
	private ArticleService articleService;

	// 前台通过食评id查看食评
	@RequestMapping("rollarticle/{articleId}")
	@ResponseBody
	public Article queryArticleById(@PathVariable Long articleId) throws Exception {
		Article article = articleService.queryArticleById(articleId);
		return article;

	}
	

	// 前台通过食评热度查看食评
	@RequestMapping("articles/hot")
	@ResponseBody
	public PageBean queryArticleByHot(@RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer rows) {

		return articleService.queryArticleByHot(page, rows);

	}

	// 前台通过食评创建时间查看食评
	@RequestMapping("articles/time")
	@ResponseBody
	public PageBean queryArticleByTime(@RequestParam(defaultValue = "1") Integer currPage,
			@RequestParam(defaultValue = "10") Integer pageSize) {

		return articleService.queryArticleByTime(currPage, pageSize);

	}

}

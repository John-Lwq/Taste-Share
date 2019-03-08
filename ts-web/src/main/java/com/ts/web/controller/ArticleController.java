package com.ts.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ts.common.pojo.Article;
import com.ts.common.util.PageBean;
import com.ts.web.service.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	
	@RequestMapping("/article/list")
	public String goArticle(Model model,@RequestParam(defaultValue="1")Integer currPage,@RequestParam(defaultValue="10")Integer pageSize) throws Exception{
		PageBean<Article> pageBean = articleService.queryHotArticle(currPage, pageSize);
		//Я�����ݵ�ҳ��չʾ
		model.addAttribute("pageBean",pageBean);
		return "article/list";
	}
	
	//通过文章id来滚动
	@RequestMapping("article/details")
	public String rollArticle(Long articleId,Model model) throws Exception{
		Article article=articleService.rollArticle(articleId);
		model.addAttribute("article", article);
		return "article/details";
	}
	
	//2:返回按照热度排序的文章list
	@RequestMapping("article/hot")
	public String queryHotArticle(Model model,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows) throws Exception{
		try {
			PageBean<Article> pageBean = articleService.queryHotArticle(page, rows);
			//Я�����ݵ�ҳ��չʾ
			model.addAttribute("pageBean",pageBean);
		} catch (Exception e) {
			model.addAttribute("msg",e.getMessage());
		}
		return "article/hot";
	}
	
	//3：返回按照创建时间排序的文章list
	@RequestMapping("article/time")
	public String queryTimeArticle(Model model,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="10")Integer rows) throws Exception{

		try {
			PageBean<Article> pageBean = articleService.queryTimeArticle(page, rows);
			//Я�����ݵ�ҳ��չʾ
			model.addAttribute("pageBean",pageBean);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg",e.getMessage());
		}
		return "article/time";
	}
}

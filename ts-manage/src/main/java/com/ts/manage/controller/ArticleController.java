package com.ts.manage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.pojo.Article;
import com.ts.common.pojo.User;
import com.ts.common.util.PageBean;
import com.ts.manage.service.ArticleService;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	// 查看所有文章list
	@RequestMapping("/articlelist")
	public String atricleList(@RequestParam(defaultValue="1") Integer currentPage,
   		 @RequestParam(defaultValue="10") Integer pageSize,Model model){
		PageBean pageBean = articleService.articleList(currentPage, pageSize);
		model.addAttribute("pageBean", pageBean);
		return "article_manage";
	}
	
	// 跳转更新页面
	@RequestMapping("/articleupdate")
	public String articleUpdate(Long id,Model model) throws Exception{
		Article article = articleService.queryArticleById(id);
		model.addAttribute("article", article);
		return "article_update";
	}
	
	// 更新文章
	@RequestMapping("/articletoupdate")
	public String articleToUpdate(Article article){
		articleService.updateArticle(article);
		return "redirect:/articlelist";
	}
	
	
	@RequestMapping("/articledelete")
	public String deleteUser(Long id) {
		articleService.deleteArticle(id);
		return "redirect:/articlelist";
	}
	
	@RequestMapping("/articleview")
	public String userView(Long id, Model model) throws Exception {
		Article article = articleService.queryArticleById(id);
		model.addAttribute("article", article);
		return "article_view";
	}
	
}

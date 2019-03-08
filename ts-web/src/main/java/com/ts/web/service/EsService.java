package com.ts.web.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.Query;
import org.elasticsearch.Version;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.index.query.Operator;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ts.common.pojo.Article;
import com.ts.common.pojo.Menu;
import com.ts.common.pojo.Restaurant;
import com.ts.common.util.PageBean;

@Service
public class EsService {

	@Autowired
	private TransportClient client;

	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ArticleService articleService;
	// MatchQueryBuilder query = QueryBuilders.matchQuery("shop_name",
	// info).operator(Operator.AND);
	// // 必须包含全部的分词结果才能匹配
	// // 调用连接对象获取查询结果
	// // setFrom 和setSize两个方法的调用,可以查询分页内容
	// // 第一页内容,20条数据 from(0).size(20) page rows/size
	// // 第二页内容,from(20).size(20),from((page-1)*rows).size(rows)
	// SearchResponse response =
	// client.prepareSearch("restaurant_item").setQuery(query)
	// .setFrom((currPage - 1) * pageSize).setSize(pageSize).get();
	// SearchHits hits = response.getHits();
	// List<Restaurant> list = new ArrayList<Restaurant>();
	// System.out.println("总共获取:" + hits.totalHits());
	//
	// for (SearchHit hit : hits) {
	// Integer restaurantId = (Integer) hit.getSource().get("restaurant_id");
	// Restaurant restaurant =
	// restaurantService.queryRestaurant(Long.parseLong(restaurantId + ""));
	// list.add(restaurant);
	// }
	//
	// PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
	// pageBean.setCurrPage(currPage);
	// pageBean.setTotalCount((int) hits.totalHits());
	// pageBean.setPageSize(pageSize);
	// pageBean.setPageList(list);
	// int page = (int) Math.ceil(hits.totalHits() / pageSize) + 1;
	// pageBean.setTotalPage(page);
	//
	// return pageBean;

	public PageBean<Restaurant> searchRestaurantByShopName(String info, Integer currPage, Integer pageSize)
			throws Exception {
		// 必须包含全部的分词结果才能匹配

		MatchQueryBuilder query = QueryBuilders.matchQuery("shop_name", info).operator(Operator.AND);
		SearchResponse response = client.prepareSearch("restaurant_item").setQuery(query)
				.setFrom((currPage - 1) * pageSize).setSize(pageSize).get();
		SearchHits hits = response.getHits();
		List<Restaurant> list = new ArrayList<Restaurant>();
		System.out.println("总共获取:" + hits.totalHits);

		for (SearchHit hit : hits) {
			Integer restaurantId = (Integer) hit.getSource().get("restaurant_id");
			if(restaurantId!=null){
			Restaurant restaurant = restaurantService.queryRestaurant(Long.parseLong(restaurantId + ""));
			list.add(restaurant);
			}
		}

		PageBean<Restaurant> pageBean = new PageBean<Restaurant>();
		pageBean.setCurrPage(currPage);
		pageBean.setTotalCount((int) hits.totalHits);
		pageBean.setPageSize(pageSize);
		pageBean.setPageList(list);
		int page = (int) Math.ceil(hits.totalHits / pageSize) + 1;
		pageBean.setTotalPage(page);

		return pageBean;
	}

	public PageBean<Menu> searchMenuByTitle(String info, Integer currPage, Integer pageSize) throws Exception {
		MatchQueryBuilder query = QueryBuilders.matchQuery("assort", info).operator(Operator.AND);
		SearchResponse response = client.prepareSearch("menu_item").setQuery(query).setFrom((currPage - 1) * pageSize).setSize(pageSize).get();
		SearchHits hits = response.getHits();
		List<Menu> list = new ArrayList<Menu>();
		System.out.println("总共获取:" + hits.totalHits);

		for (SearchHit hit : hits) {
			Integer menuId = (Integer) hit.getSource().get("menu_id");
			Menu menu = menuService.queryMenu(Long.parseLong(menuId+""));
			list.add(menu);
		}

		PageBean<Menu> pageBean = new PageBean<Menu>();
		pageBean.setCurrPage(currPage);
		pageBean.setTotalCount((int) hits.totalHits);
		pageBean.setPageSize(pageSize);
		pageBean.setPageList(list);
		int page = (int) Math.ceil(hits.totalHits / pageSize) + 1;
		pageBean.setTotalPage(page);

		return pageBean;
	}

	public PageBean<Article> searchArticleByContent(String info, Integer currPage, Integer pageSize) throws Exception {
		MatchQueryBuilder query = QueryBuilders.matchQuery("content", info).operator(Operator.AND);
		SearchResponse response = client.prepareSearch("article_item").setQuery(query).setFrom((currPage - 1) * pageSize).setSize(pageSize).get();
		SearchHits hits = response.getHits();
		List<Article> list = new ArrayList<Article>();
		System.out.println("总共获取:" + hits.totalHits);

		for (SearchHit hit : hits) {
			Integer articleId = (Integer) hit.getSource().get("id");
			Article article = articleService.rollArticle(Long.parseLong(articleId+""));
			list.add(article);
		}

		PageBean<Article> pageBean = new PageBean<Article>();
		pageBean.setCurrPage(currPage);
		pageBean.setTotalCount((int) hits.totalHits);
		pageBean.setPageSize(pageSize);
		pageBean.setPageList(list);
		int page = (int) Math.ceil(hits.totalHits / pageSize) + 1;
		pageBean.setTotalPage(page);

		return pageBean; 
	}
}

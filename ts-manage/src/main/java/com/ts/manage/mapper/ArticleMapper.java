package com.ts.manage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ts.common.mapper.MyMapper;
import com.ts.common.pojo.Article;

public interface ArticleMapper extends MyMapper<Article>{

	// 通过热度查询文章
	public List<Article> queryArticleListByHot(@Param("start") int start,@Param("rows") int rows);
	
	// 通过最新创建时间查看文章
	public List<Article> queryArticleListByTime(@Param("start") int start,@Param("rows") int rows);

	// 查询列表总记录数
	public int selectAllCount();

	// 查看所有文章
	public List<Article> selectAllArticle(@Param("start") int start,@Param("rows") int rows);
	
	// 删除文章
	//public int deleteArticle(@Param("articleIds") Long[] articleIds);
}

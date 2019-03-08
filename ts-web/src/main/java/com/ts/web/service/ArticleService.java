package com.ts.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ts.common.pojo.Article;
import com.ts.common.service.HttpClientService;
import com.ts.common.util.ObjectUtil;
import com.ts.common.util.PageBean;
import com.ts.common.vo.HttpResult;
import com.ts.common.vo.SysResult;

@Service
public class ArticleService {

	@Autowired
	private HttpClientService client;
	
	@Autowired
	private ObjectMapper mapper = new ObjectMapper();

	// �������͵�collection json�ַ���ת��Ϊ����ķ���
	public JavaType getCollectionType(Class<?> collectionClass, Class<?>... elementClasses) {
		return mapper.getTypeFactory().constructParametricType(collectionClass, elementClasses);
	}
	
	public Article rollArticle(Long articleId) throws Exception {
		String url="http://manage.ts.com/rollarticle/"+articleId;
		/*Map<String, Object> map=new HashMap<>();
		map.put("articleId", articleId);*/
		String jsonData = client.doGet(url);
		
		Article article = ObjectUtil.mapper.readValue(jsonData,Article.class);
		return article;
	}

	//2：获取按点击热度排序的文章信息列表
		public PageBean<Article> queryHotArticle(Integer page, Integer rows) throws Exception {

		String url = "http://manage.ts.com/articles/hot";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("rows", rows);
		HttpResult response = client.doPost(url, map);
		String jsonData = response.getBody();
		PageBean<Article> pageBean = ObjectUtil.mapper.readValue(jsonData,PageBean.class);
		return pageBean;
		}

		// 3����ȡ������ʱ�������������Ϣ�б�
		public PageBean<Article> queryTimeArticle(Integer page, Integer rows) throws Exception {

			String url = "http://manage.ts.com/articles/time";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("page", page);
			map.put("rows", rows);

			HttpResult response = client.doPost(url, map);

			String jsonData = response.getBody();
			PageBean<Article> pageBean = ObjectUtil.mapper.readValue(jsonData,PageBean.class);
			return pageBean;
		}
	
}


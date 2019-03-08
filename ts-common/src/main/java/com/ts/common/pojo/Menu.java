package com.ts.common.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ts.common.po.BasePojo;

@Table(name="menu")
public class Menu extends BasePojo{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long menuId;
	private String name;
	private Long userId;
	private String ingredients;
	private String assort;
	private String making;
	private Long hot;
	private String tips;
	private String imgUrl;
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getAssort() {
		return assort;
	}
	public void setAssort(String assort) {
		this.assort = assort;
	}
	public String getMaking() {
		return making;
	}
	public void setMaking(String making) {
		this.making = making;
	}
	public Long getHot() {
		return hot;
	}
	public void setHot(Long hot) {
		this.hot = hot;
	}
	public String getTips() {
		return tips;
	}
	public void setTips(String tips) {
		this.tips = tips;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", name=" + name + ", userId=" + userId + ", ingredients=" + ingredients
				+ ", assort=" + assort + ", making=" + making + ", hot=" + hot + ", tips=" + tips + ", imgUrl=" + imgUrl
				+ "]";
	}
	
}

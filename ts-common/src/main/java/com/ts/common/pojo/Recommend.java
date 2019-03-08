package com.ts.common.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ts.common.po.BasePojo;

@Table(name="recommend")
public class Recommend extends BasePojo{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long reId;
	private String name;
	private Double price;
	private String recommendImg;
	private Long restaurantId;
	private Integer praiseNum;
	public Long getReId() {
		return reId;
	}
	public void setReId(Long reId) {
		this.reId = reId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getRecommendImg() {
		return recommendImg;
	}
	public void setRecommendImg(String recommendImg) {
		this.recommendImg = recommendImg;
	}
	public Long getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(Long restaurantId) {
		this.restaurantId = restaurantId;
	}
	public Integer getPraiseNum() {
		return praiseNum;
	}
	public void setPraiseNum(Integer praiseNum) {
		this.praiseNum = praiseNum;
	}
	@Override
	public String toString() {
		return "Recommend [reId=" + reId + ", name=" + name + ", price=" + price + ", recommendImg=" + recommendImg
				+ ", restaurantId=" + restaurantId + ", praiseNum=" + praiseNum + "]";
	}
	
}

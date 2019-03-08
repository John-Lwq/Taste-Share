package com.ts.common.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ts.common.po.BasePojo;

@Table(name="restaurant_desc")
public class Desc extends BasePojo{


	private String comment;
	private Long userId;
	private Long restaurantId;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long descId;
	private Integer status;
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Long getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(Long restaurantId) {
		this.restaurantId = restaurantId;
	}
	public Long getDescId() {
		return descId;
	}
	public void setDescId(Long descId) {
		this.descId = descId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Desc [comment=" + comment + ", userId=" + userId + ", restaurantId=" + restaurantId + ", descId="
				+ descId + ", status=" + status + "]";
	}
	
	
	
}


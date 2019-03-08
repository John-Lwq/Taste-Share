package com.ts.common.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.ts.common.po.BasePojo;

@Table(name="restaurant")
public class Restaurant extends BasePojo{

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long restaurantId;
	private Long userId;
	private String shopName;
	private String shopAddress;
	private Integer averPrice;
	private Integer type;
	private Integer tasteScore;
	private Integer environmentScore;
	private Integer serviceScore;
	private String defaultPic;
	private String sign;
	private Integer status;
	
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopAddress() {
		return shopAddress;
	}
	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}
	public Integer getAverPrice() {
		return averPrice;
	}
	public void setAverPrice(Integer averPrice) {
		this.averPrice = averPrice;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getTasteScore() {
		return tasteScore;
	}
	public void setTasteScore(Integer tasteScore) {
		this.tasteScore = tasteScore;
	}
	public Integer getEnvironmentScore() {
		return environmentScore;
	}
	public void setEnvironmentScore(Integer environmentScore) {
		this.environmentScore = environmentScore;
	}
	public Integer getServiceScore() {
		return serviceScore;
	}
	public void setServiceScore(Integer serviceScore) {
		this.serviceScore = serviceScore;
	}
	public String getDefaultPic() {
		return defaultPic;
	}
	public void setDefaultPic(String defaultPic) {
		this.defaultPic = defaultPic;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public Long getRestaurantId() {
		return restaurantId;
	}
	public void setRestaurantId(Long restaurantId) {
		this.restaurantId = restaurantId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Restaurant [restaurantId=" + restaurantId + ", userId=" + userId + ", shopName=" + shopName
				+ ", shopAddress=" + shopAddress + ", averPrice=" + averPrice + ", type=" + type + ", tasteScore="
				+ tasteScore + ", environmentScore=" + environmentScore + ", serviceScore=" + serviceScore
				+ ", defaultPic=" + defaultPic + ", sign=" + sign + ", status=" + status + "]";
	}
	
   
	
	
}

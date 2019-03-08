package com.ts.common.pojo;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

@Table(name="module")
public class Module {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long moduleId;
	private String module;
	private String moduleDesc;
	public Long getModuleId() {
		return moduleId;
	}
	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getModuleDesc() {
		return moduleDesc;
	}
	public void setModuleDesc(String moduleDesc) {
		this.moduleDesc = moduleDesc;
	}
	@Override
	public String toString() {
		return "Module [moduleId=" + moduleId + ", module=" + module + ", moduleDesc=" + moduleDesc + "]";
	}
	
}

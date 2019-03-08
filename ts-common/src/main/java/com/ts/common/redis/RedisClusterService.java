package com.ts.common.redis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import redis.clients.jedis.JedisCluster;

@Service
public class RedisClusterService {

	@Autowired
	private JedisCluster jedisCluster;
	
	public void set(String key,String value){
		jedisCluster.set(key, value);
	}
	
	/*
	 * seconds手动设置缓存超时时间
	 */
	public void set(String key,String value,int seconds){
		jedisCluster.setex(key, seconds, value);
	}
	
	public boolean exists(String key){
		return jedisCluster.exists(key);
	}
	
	public String get(String key){
		return jedisCluster.get(key);
	}
	
	public void del(String key){
		jedisCluster.del(key);
	}
	
}

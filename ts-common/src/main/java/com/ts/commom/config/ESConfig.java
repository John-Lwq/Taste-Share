package com.ts.commom.config;

import java.net.InetAddress;

import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.transport.client.PreBuiltTransportClient;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ESConfig implements InitializingBean, FactoryBean<TransportClient>
{

	@Value("${cluster-name}")
	private String clusterName;
	@Value("${cluster-nodes}")
	private String nodes;

	private TransportClient client;

	// 初始化方法,初始化TransportClient@Bean
	// 当前方法继承自初始化bean,实现数据的注入后,可以利用这个方法
	// 讲对象初始化
	@Override
	public void afterPropertiesSet() throws Exception
	{
		// 自定义setting一些值,例如clustername
		Settings settings = Settings.builder().put("cluster.name", clusterName).build();
		client = new PreBuiltTransportClient(settings);
		// 添加连接的节点,内部管理连接池.
		String[] hostAndPort = nodes.split(",");
		for (String node : hostAndPort)
		{
			String host = node.split(":")[0];
			int port = Integer.parseInt(node.split(":")[1]);
			client.addTransportAddress(new InetSocketTransportAddress(InetAddress.getByName(host), port));
		}
	}

	// get对象,这个方法的返回结果,不需要@Bean就会在注入使用时,调用返回
	// 框架管理
	@Override
	public TransportClient getObject() throws Exception
	{

		return client;
	}

	// 根据getObject方法返回的对象类型,返回类型反射对象
	@Override
	public Class<?> getObjectType()
	{
		// TODO Auto-generated method stub
		return TransportClient.class;
	}

	// true是单例,false多例维护
	@Override
	public boolean isSingleton()
	{
		// TODO Auto-generated method stub
		return false;
	}
}

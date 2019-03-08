package com.ts.web.listner;


import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyServletContextListner implements ServletContextListener{

	@Override
	public void contextInitialized(ServletContextEvent sce) {
//		//通过事件获得servletcontext对象
//		ServletContext sc=sce.getServletContext();
//		//通过servletcontext对象获得应用的虚拟路径
//		String contextPath=sc.getContextPath();
//		
//		sc.setAttribute("app", contextPath);
		// 通过事件对象获取ServletContext对象
		ServletContext sc=sce.getServletContext();
		// 通过ServletContext对象获取web应用映射的虚拟路径
		String contextPath=sc.getContextPath();
		// 将虚拟路径存入ServletContext作用域中
		sc.setAttribute("app", contextPath);
		System.out.println("web项目已启动*********");
		System.out.println(contextPath);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}

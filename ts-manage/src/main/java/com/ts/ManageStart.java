package com.ts;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ts.manage.mapper")
public class ManageStart {
	
	public static void main(String[] args) {
		SpringApplication.run(ManageStart.class, args);
	}
}

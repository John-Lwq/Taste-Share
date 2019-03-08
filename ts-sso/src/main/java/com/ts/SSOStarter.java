package com.ts;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ts.sso.mapper")
public class SSOStarter {

	public static void main(String[] args) {
		SpringApplication.run(SSOStarter.class, args);
	}
}

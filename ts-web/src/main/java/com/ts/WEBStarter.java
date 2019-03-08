package com.ts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class WEBStarter {

	public static void main(String[] args) {
		SpringApplication.run(WEBStarter.class, args);
		
	}
}

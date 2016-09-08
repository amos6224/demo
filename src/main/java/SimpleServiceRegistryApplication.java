package com.charter.vapor;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@EnableDiscoveryClient
@RestController

public class SimpleServiceRegistryApplication {
	
	@Value("${spring.application.name}")
	private String appName;
	
    @RequestMapping("/")
    public String home() {
        return "appName:" + appName;
    }
	public static void main(String[] args) {
        new SpringApplicationBuilder(SimpleServiceRegistryApplication.class).web(true).run(args);

		//SpringApplication.run(SimpleServiceRegistryApplication.class, args);
	}
}


package com.cognizant.spring_learn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringlearnApplication {

	private static final Logger LOGGER = LoggerFactory.getLogger(SpringlearnApplication.class);

	public static void main(String[] args) {
		
		
		SpringApplication.run(SpringlearnApplication.class, args);
		LOGGER.info("START of Spring Boot Application");
	}

}

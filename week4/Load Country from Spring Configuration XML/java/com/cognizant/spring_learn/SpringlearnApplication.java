package com.cognizant.spring_learn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringlearnApplication {

    private static final Logger LOGGER = LoggerFactory.getLogger(SpringlearnApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(SpringlearnApplication.class, args);
        displayCountry();
    }

    public static void displayCountry() {
        LOGGER.info("START");

        ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
        Country country = context.getBean("country", Country.class);

        LOGGER.debug("Country : {}", country.toString());

        LOGGER.info("END");
    }
}

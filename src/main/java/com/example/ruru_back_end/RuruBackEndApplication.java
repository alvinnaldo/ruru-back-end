package com.example.ruru_back_end;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.hibernate.autoconfigure.HibernateJpaAutoConfiguration;
import org.springframework.boot.jdbc.autoconfigure.DataSourceAutoConfiguration;

@SpringBootApplication
public class RuruBackEndApplication {

	public static void main(String[] args) {
		SpringApplication.run(RuruBackEndApplication.class, args);
	}

}

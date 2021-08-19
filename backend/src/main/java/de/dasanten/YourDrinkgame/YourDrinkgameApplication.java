package de.dasanten.YourDrinkgame;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.web.filter.CharacterEncodingFilter;

@SpringBootApplication
public class YourDrinkgameApplication {

	public static void main(String[] args) {
		SpringApplication.run(YourDrinkgameApplication.class, args);
	}

}

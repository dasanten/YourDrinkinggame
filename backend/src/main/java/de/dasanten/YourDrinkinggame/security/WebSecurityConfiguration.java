package de.dasanten.YourDrinkinggame.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/cardset/version").permitAll()
                .antMatchers(HttpMethod.POST, "/cardset/version").permitAll()
                .antMatchers(HttpMethod.GET, "/cardset/**", "/configure/cardset/**").permitAll()
                .and()
                .oauth2ResourceServer().jwt();
    }
}

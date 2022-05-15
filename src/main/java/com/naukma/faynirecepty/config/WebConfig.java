package com.naukma.faynirecepty.config;

import com.naukma.faynirecepty.repository.UserRepository;
import com.naukma.faynirecepty.service.CustomUserDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@EnableWebSecurity
@AllArgsConstructor
public class WebConfig extends WebSecurityConfigurerAdapter {

    UserRepository repo;

    @Override
    protected UserDetailsService userDetailsService() {
        return new CustomUserDetailsService(repo);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/profile").hasAuthority("user")
                .antMatchers("/admin").hasAuthority("admin")
                .antMatchers("/").permitAll()
                .antMatchers("/register").anonymous()
                .and()
                .formLogin().loginPage("/login")
                .defaultSuccessUrl("/").permitAll()
                .and().logout()
                .logoutSuccessUrl("/").permitAll();
    }
}

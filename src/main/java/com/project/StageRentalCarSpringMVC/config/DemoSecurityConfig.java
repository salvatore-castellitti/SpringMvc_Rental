package com.project.StageRentalCarSpringMVC.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

import javax.sql.DataSource;


@Configuration
@EnableWebSecurity
@ComponentScan("com.project.StageRentalCarSpringMVC")
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("customUserDetailsService")
    private UserDetailsService userDetailsService;


    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    /*@Bean
    @Override
    public UserDetailsService userDetailsService(){
        User.UserBuilder users = User.builder();

        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();

        manager.createUser(
                users.username("Nicola").password(new BCryptPasswordEncoder().encode("ciao"))
                        .roles("EMPLOYEE","ADMIN").build());

        return manager;
    }*/


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        //add user for in memory authentication
        /*auth.inMemoryAuthentication()
               .withUser(users.username("jhon").password("test123").roles("EMPLOYEE"))
               .withUser(users.username("mary").password("test123").roles("EMPLOYEE","MANAGER"))
               .withUser(users.username("susan").password("test123").roles("EMPLOYEE","ADMIN"));*/
        /*auth.userDetailsService(userDetailsService())
                .passwordEncoder(passwordEncoder());*/
        auth.authenticationProvider(authenticationProvider());
    }

    private DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();

        authenticationProvider.setUserDetailsService(userDetailsService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());

        return authenticationProvider;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/").hasAnyRole("ADMIN","CUSTOMER")
                .antMatchers("/reservation/").hasAnyRole("CUSTOMER","ADMIN")
                .antMatchers("/reservation/**").hasAnyRole("CUSTOMER","ADMIN")
                .antMatchers("/reservation/update/**").hasAnyRole("CUSTOMER","ADMIN")
                .antMatchers("/user/profile").hasAnyRole("ADMIN", "CUSTOMER")
                .antMatchers("/user/**").hasRole("ADMIN")
                .antMatchers("/vehicle").hasAnyRole("ADMIN","CUSTOMER")
                .and()
                    .formLogin()
                    .loginPage("/login/form")
                    .loginProcessingUrl("/loginTheUser")
                    .permitAll()
                .and()
                    .logout().permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/access-denied");
    }
}

package org.dongho.common;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
public class CommonConfig {

	@Bean
	public String config() {
		return "config";
	}

	@Bean
	public DataSource dataSource() {
		
		HikariConfig hikariConfig = new HikariConfig();
		hikariConfig.setDriverClassName("com.mysql.cj.jdbc.Driver");
		hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/dclass?serverTimezone=UTC");
		hikariConfig.setUsername("springuser");
		hikariConfig.setPassword("springuser");
		
		HikariDataSource dataSource = new HikariDataSource(hikariConfig);
		
		
		return dataSource;
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception{
		SqlSessionFactoryBean session = new SqlSessionFactoryBean();
		
		session.setDataSource(dataSource());
		
		return session.getObject();
	}
	
}

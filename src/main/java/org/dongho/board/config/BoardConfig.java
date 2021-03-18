package org.dongho.board.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = {"org.dongho.board.mapper"})
@ComponentScan(basePackages = "org.dongho.board.service")
@ComponentScan(basePackages = "org.dongho.board.aop")
public class BoardConfig {

}

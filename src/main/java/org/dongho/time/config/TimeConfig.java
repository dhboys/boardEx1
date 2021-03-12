package org.dongho.time.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan(basePackages = {"org.dongho.time.mapper"})
@ComponentScan(basePackages = {"org.dongho.time.service"})
public class TimeConfig {


}

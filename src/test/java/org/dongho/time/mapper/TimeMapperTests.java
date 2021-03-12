package org.dongho.time.mapper;

import org.dongho.common.CommonConfig;
import org.dongho.time.config.TimeConfig;
import org.dongho.time.mapper.TimeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class , TimeConfig.class})
@Log4j
public class TimeMapperTests {

	@Autowired
	private TimeMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper.getNow());
	}
	
}

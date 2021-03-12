package org.dongho.common;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class})
@Log4j
public class ConfigTests {

	
	@Test
	public void testConfigtest() {
		log.info("test...........");
	}
	
}

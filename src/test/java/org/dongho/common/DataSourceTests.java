package org.dongho.common;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CommonConfig.class })
@Log4j
public class DataSourceTests {

	@Autowired
	private DataSource dataSource;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testDataSource() {
		log.info(dataSource);
	}
	
	@Test
	public void testSession() {
		SqlSession session = sqlSessionFactory.openSession();
		
		log.info(session);
		
		session.close();
	}
	
}

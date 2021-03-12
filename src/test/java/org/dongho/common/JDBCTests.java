package org.dongho.common;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { CommonConfig.class })
@Log4j
public class JDBCTests {


	@Before
	public void setup() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnnection() {
		
		String url = "jdbc:mysql://localhost:3306/dclass?serverTimezone=UTC";
		String userName = "springuser";
		String password = "springuser";
		
		try( Connection con = DriverManager.getConnection(url , userName , password)) {
			
			log.info(con);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
}

package org.dongho.board.mapper;

import org.dongho.board.config.BoardConfig;
import org.dongho.board.domain.Board;
import org.dongho.common.CommonConfig;
import org.dongho.common.dto.PageDTO;
import org.dongho.time.config.TimeConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class , TimeConfig.class , BoardConfig.class})
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper mapper;
	private PageDTO pageDTO;
	
	@Test
	public void testGetList() {
		
		PageDTO pageDTO = PageDTO.builder().page(10).perSheet(10).type("t").keyword("10").build();
		
		log.info("mapper test......");
		log.info(mapper);
		log.info(mapper.getList(pageDTO.getskip(),pageDTO.getPerSheet(),pageDTO.getArr(),pageDTO.getKeyword()).toString());
	}
	
	@Test
	public void testGetCount() {
		PageDTO pageDTO = PageDTO.builder().page(10).perSheet(10).type("t").keyword("10").build();
		log.info(mapper.getTotalCount(pageDTO.getArr(),pageDTO.getKeyword()));
	}
	
	@Test
	public void testRead() {
		log.info(mapper.selectOne(3));
	}
	
	@Test
	public void testInsert() {
		Board board = Board.builder().title("mapperTest").content("mapperTest").writer("mapperTest").build();
		mapper.insert(board);
	}
	
	@Test
	public void testDelete() {
		mapper.delete(2039);
	}
	
	@Test
	public void testUpdate() {
		Board board = Board.builder().bno(1526)
									 .title("updateMapper")
									 .content("updateMapper")
									 .writer("updateMapper")
									 .build();
		mapper.update(board);
	}
	
}

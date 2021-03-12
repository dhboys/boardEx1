package org.dongho.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dongho.board.domain.Board;
import org.dongho.board.dto.BoardDTO;

public interface BoardMapper {
	
	public List<Board> getList(@Param("skip") int skip ,
							   @Param("perSheet") int perSheet,
							   @Param("arr")String[] type,
							   @Param("keyword") String keyword);
	
	public int getTotalCount(@Param("arr") String[] type,
							 @Param("keyword") String keyword);
	
	public Board selectOne(@Param("bno") Integer bno);
	
	public void insert(Board board);
	
	public void delete(Integer bno);
	
	public void update(Board board);
	
}

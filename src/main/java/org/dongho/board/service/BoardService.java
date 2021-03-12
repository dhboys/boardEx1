package org.dongho.board.service;

import java.util.List;

import org.dongho.board.domain.Board;
import org.dongho.board.dto.BoardDTO;
import org.dongho.common.dto.PageDTO;

public interface BoardService {

	public List<BoardDTO> getList(PageDTO pageDTO);
	
	public int getTotalCount(PageDTO pageDTO);
	
	public Board selectOne(Integer bno);
	
	public void insert(BoardDTO boardDTO);
	
	public void delete(Integer bno);
	
	public void update(BoardDTO boardDTO);
	
	
	default Board toDomain(BoardDTO boardDTO) {
		
		Board vo = Board.builder().bno(boardDTO.getBno())
					   .title(boardDTO.getTitle())
					   .content(boardDTO.getContent())
					   .writer(boardDTO.getWriter())
					   .regdate(boardDTO.getRegdate())
					   .updateDate(boardDTO.getUpdateDate())
					   .build();
		
		return vo;	
	}
	
	default BoardDTO toDTO(Board board) {
		
		BoardDTO dto = BoardDTO.builder().bno(board.getBno())
					   .title(board.getTitle())
					   .content(board.getContent())
					   .writer(board.getWriter())
					   .regdate(board.getRegdate())
					   .updateDate(board.getUpdateDate())
					   .build();
		
		return dto;	
	}
}

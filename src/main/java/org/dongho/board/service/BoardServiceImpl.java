package org.dongho.board.service;

import java.util.List;
import java.util.stream.Collectors;

import org.dongho.board.domain.Board;
import org.dongho.board.dto.BoardDTO;
import org.dongho.board.mapper.BoardMapper;
import org.dongho.common.dto.PageDTO;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{

	
	private final BoardMapper mapper;
	
	@Override
	public List<BoardDTO> getList(PageDTO pageDTO) {
		
		
		return mapper.getList(pageDTO.getskip() , pageDTO.getPerSheet() , pageDTO.getArr(),pageDTO.getKeyword()).stream().map(board -> {
			return toDTO(board);
		}).collect(Collectors.toList());
		
	}



	@Override
	public int getTotalCount(PageDTO pageDTO) {
		return mapper.getTotalCount(pageDTO.getArr(),pageDTO.getKeyword());
	}



	@Override
	public Board selectOne(Integer bno) {
		return mapper.selectOne(bno);
	}



	@Override
	public void insert(BoardDTO boardDTO) {
		Board board = toDomain(boardDTO);
		mapper.insert(board);
		
	}



	@Override
	public void delete(Integer bno) {
		mapper.delete(bno);
		
	}



	@Override
	public void update(BoardDTO boardDTO) {
		Board board = toDomain(boardDTO);
		mapper.update(board);
	}

}

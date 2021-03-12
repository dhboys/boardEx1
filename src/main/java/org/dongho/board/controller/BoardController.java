package org.dongho.board.controller;

import javax.validation.Valid;

import org.dongho.board.dto.BoardDTO;
import org.dongho.board.service.BoardService;
import org.dongho.common.dto.PageDTO;
import org.dongho.common.dto.PageMaker;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@Log4j
@RequiredArgsConstructor
public class BoardController {

	
	private final BoardService service;
	
	@GetMapping({"/list","/"})
	public String listGet(@ModelAttribute("pageDTO") PageDTO pageDTO, Model model) {
		
		model.addAttribute("list" , service.getList(pageDTO));
		model.addAttribute("pageMaker" , new PageMaker(pageDTO , service.getTotalCount(pageDTO)));
		
		return "/board/list";
	}
	
	@GetMapping({"/read" , "/modify"})
	public void readGet(PageDTO pageDTO, Integer bno ,Model model) {
		
		model.addAttribute("board" , service.selectOne(bno));
		model.addAttribute("pageMaker" , new PageMaker(pageDTO , service.getTotalCount(pageDTO)));
	}
	
	@PostMapping("/modify")
	@ResponseBody
	public void modifyPost(@RequestBody BoardDTO boardDTO) {
		
		log.info(boardDTO);
		service.update(boardDTO);
		
	}
	
	
	
	@GetMapping("/register")
	public void registerGet(PageDTO pageDTO , Model model) {
		
	}
	
	@PostMapping(value = {"/register"} , produces = {"text/plain"})
	@ResponseBody
	public String registerPost(@RequestBody BoardDTO boardDTO) {
		
		log.info(boardDTO);
		service.insert(boardDTO);
		
		return "success";
		
	}
	
	@PostMapping(value = {"/remove"} , produces = {"text/plain"})
	@ResponseBody
	public ResponseEntity<String> removePost(@Valid @RequestBody Integer bno , BindingResult result ) {
		log.info("=========================");
		log.info(bno);
		
		if(result.hasErrors()) {
			return new ResponseEntity<String>("fail" , HttpStatus.NOT_FOUND);
		}
		

		service.delete(bno);
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
		
}

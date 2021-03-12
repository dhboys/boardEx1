package org.dongho.board.controller;

import org.dongho.board.dto.BoardDTO;
import org.dongho.board.service.BoardService;
import org.dongho.common.dto.PageDTO;
import org.dongho.common.dto.PageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void readGet(@ModelAttribute("pageDTO") PageDTO pageDTO, @ModelAttribute("bno") Integer bno ,Model model) {
		
		model.addAttribute("board" , service.selectOne(bno));
		model.addAttribute("pageMaker" , new PageMaker(pageDTO , service.getTotalCount(pageDTO)));
	}
	
	@GetMapping("/register")
	public void registerGet(@ModelAttribute("pageDTO") PageDTO pageDTO , Model model) {
		
	}
	
	@PostMapping("/register")
	public void registerPost(@ModelAttribute("boardDTO") BoardDTO boardDTO,Model model) {
		
	}
	
	@PostMapping(value = {"/remove"} , produces = {"text/plain"})
	public String removePost(@ModelAttribute("bno") Integer bno,BindingResult result,Model model) {
		
		service.delete(bno);
		
		return "redirect:/board/list";
	}
		
}

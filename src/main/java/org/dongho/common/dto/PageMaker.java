package org.dongho.common.dto;

import lombok.Data;

@Data
public class PageMaker {

	private PageDTO pageDTO;
	private int start, end;
	private int total;
	private boolean prev, next;
	private int lastPage;

	public PageMaker(PageDTO pageDTO, int total) {
		this.total = total;
		this.pageDTO = pageDTO;

		int perSheet = pageDTO.getPerSheet();

		// 현재 페이지
		double currentPage = (double) pageDTO.getPage();

		int tempEnd = (int)(Math.ceil(currentPage / perSheet) * perSheet);

		int realEnd = (int)(Math.ceil(total / (double)perSheet));

		end = realEnd < tempEnd ? realEnd : tempEnd;

		start = tempEnd - (perSheet - 1);
		
		prev = start > 1;
		
		next = end * perSheet < total;
		
		lastPage = (int)(Math.ceil(total / (double)perSheet));

	}
}

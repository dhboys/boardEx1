package org.dongho.board.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Data;
@Data
@Builder
public class BoardDTO {

	private Integer bno;
	private String title,content,writer;
	private Date regdate,updateDate;
	
	
}

package org.dongho.board.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {

	private Integer bno;
	private String title,content,writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date regdate,updateDate;
	
	
}

package org.dongho.board.dto;

import java.sql.Date;


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
	private Date regdate,updateDate;
	
	
}

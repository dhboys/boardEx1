package org.dongho.board.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Board {

	private Integer bno;
	private String title,content,writer;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date regdate,updateDate;
	
}

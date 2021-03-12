package org.dongho.common.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Builder.Default;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PageDTO {

	@Default
	private int page = 1;
	@Default
	private int perSheet = 10;
	
	private String type;
	private String keyword;
	
	
	public int getskip() {
		return (page - 1) * perSheet;
	}
	
	public String[] getArr() {
		if(keyword == null || keyword.trim().length() == 0) {
			return null;
		}
		
		if(type == null) {
			return null;
		}
		
		return type.split("");
	}
	
}

package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatVO {
	
	private String ctitle;
	
	private String mid;
	
	private String ccategory;

	private String cimage;
	
	private Date cregdate;
	
	private long cno;
	
}

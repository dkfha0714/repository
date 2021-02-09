package org.zerock.domain;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class SellboardVO {
	
	private long sno;
	private String mid;
	private String sname;
	private String scategory;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sregdate;
	private String scontent;
	private String sthumb;
	private String simage;
	private int smoney;
	private String saddress;
	private String sphone;
}

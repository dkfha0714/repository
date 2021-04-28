package org.zerock.domain;


import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class BuyboardVO {
	
	private long bno;
	private String mid;
	private String bname;
	private String bcategory;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bregdate;
	private String bcontent;
	private int bmoney;
	private String baddress;
	private String bphone;
	private String burl;
	private String bcomment;
}

package com.bit.web.play.vo;

import lombok.Data;

import java.util.Date;

@Data
public class NoticeBoardBean {
	private int noticeboard_no;
	private String writer_id;
	private String title;
	private String content;
	private Date regdate;
	//private String job;
	
}

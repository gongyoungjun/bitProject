package com.bit.web.play.vo;

import java.util.Date;

import lombok.Data;

@Data
public class membersBean {

	private int members_no=1;
	private String id;
	private String password;
	private String nickname;
	private String birth;
	private String email;
	private String tel;
	private Date regdate;
	private String genre1;
	private String genre2;
	private String aboutme;
	private String profile_img;
	private int follow_cnt;
	private int review_cnt;
	private int grade;
	private int stopcnt;
	private String isDeleted;

	
	
	
}
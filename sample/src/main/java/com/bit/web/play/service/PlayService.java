package com.bit.web.play.service;

import java.util.List;

import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.page;
import com.bit.web.play.vo.searchType;
import com.bit.web.play.vo.squadboardBean;



public interface PlayService {

	
    String find_user_id(String email);

    void insertSeqNumber(membersBean bean); 

    Object selectSearchList(int squadboard_no);

    public List<squadboardBean> selectHostNameList(String hostname);
    
    public List<squadboardBean> selectTitleList(String title);
    


    
}
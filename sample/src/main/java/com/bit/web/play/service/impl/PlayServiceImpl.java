package com.bit.web.play.service.impl;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.page;
import com.bit.web.play.vo.squadboardBean;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class PlayServiceImpl implements PlayService {

    private final playDao dao;

    @Override
    public String find_user_id(String email) {
        return dao.find_user_id(email);
    }

    @Override
    public void insertSeqNumber(membersBean bean) {
        dao.insertSeqNumber(bean);
    }


	@Override
	public Object selectSearchList(int squadboard_no) {
		return dao.selectSearchList(squadboard_no);
	}
    
	@Override
	public List<squadboardBean> selectHostNameList(String hostname){
		return dao.selectHostNameList(hostname);
	}
	
	@Override
	public List<squadboardBean> selectTitleList(String title) {
		return dao.selectTitleList(title);
	}

	
}
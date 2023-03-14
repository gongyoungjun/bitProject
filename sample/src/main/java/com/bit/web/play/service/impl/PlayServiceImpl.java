package com.bit.web.play.service.impl;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.vo.membersBean;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
}
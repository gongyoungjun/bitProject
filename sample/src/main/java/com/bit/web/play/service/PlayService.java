package com.bit.web.play.service;

import com.bit.web.play.vo.membersBean;

public interface PlayService {
    String find_user_id(String email);

    void insertSeqNumber(membersBean bean);
}

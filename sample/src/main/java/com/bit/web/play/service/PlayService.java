package com.bit.web.play.service;

import com.bit.web.play.vo.membersBean;

public interface PlayService {

	
    String find_user_id(String email);

    void insertSeqNumber(membersBean bean);  // static으로 선언을 하게 되면 에러가 발생합니다.

}

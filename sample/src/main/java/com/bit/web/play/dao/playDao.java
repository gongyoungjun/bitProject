package com.bit.web.play.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.web.play.vo.membersBean;

@Repository
public class playDao extends SqlSessionDaoSupport{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}	
	
	//아이디 찾는거 
	public String find_user_id(String email) {
		return this.getSqlSession().selectOne("idSearch", email);
	}
	//비밀번호 찾기
	public String find_user_pw(HashMap<String,Object> map) {
		return this.getSqlSession().selectOne("pwSearch", map);
	}
	//로그인 
	public String loginPass(String inputId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("loginPass", inputId);
	}

	//회원가입
	public void insertSeqNumber(membersBean bean) {
		this.getSqlSession().insert("insertSeqNumber", bean);
	}
	public Integer newAjaxGetSequence() {
		return this.getSqlSession().selectOne("newAjaxGetSequence");
	}
	
	//회원가입 - 아이디 중복
	public String ajaxGetId(String id) {
		return this.getSqlSession().selectOne("ajaxGetId", id);
	}
	//회원가입 - 닉네임 중복
	public String ajaxGetNickname(String nickname) {
		return this.getSqlSession().selectOne("ajaxGetNickname", nickname);
	}
	
	//프로필수정
	
	public Integer getSequence() {
		return this.getSqlSession().selectOne("getSequence");
	}
	public void updateReply(HashMap<String, Object>map) {
		this.getSqlSession().update("updateReply",map);
	}
	public void updateStep(HashMap<String, Object>map) {
		this.getSqlSession().update("updateStep",map);
	}

	//프로필 수정(창영씨 버전)
	public void updateBoard(membersBean bean) {
		this.getSqlSession().update("updateBoard", bean);
	}


	
	


//	@Override
//	public void updateData(Map<String, Object> map) throws Exception{
//		SqlSession.insert("updateData",map);
//	}


	
	
	
	
	
	//로그인
	public String newgetDbPass(String id) {
		return this.getSqlSession().selectOne("com.bit.web.play.play-mapper.newgetDbPass", id);
	}
	
	
}



	
	//아이디 중복체크
//	@Repository
//	public class UserDAOImpl implements UserDAO {
//	    
//	    @Autowired
//	    private SqlSession sqlSession;
//
//	    @Override
//	    public User getUserById(String id) {
//	        return sqlSession.selectOne("user.getUserById", id);
//	    }
//	}
	
	
//	
//	//게시물 작성
//	public void insertBoard(ReplyBoard2 Board) {
//		this.getSqlSession().insert("insertBoard", Board);
//	}
//	
//	//게시물
//	public Integer getSequence() {
//		return this.getSqlSession().selectOne("getSequence");
//	}
//	public void insertSeqNumber2(homeworkBean bean) {
//		this.getSqlSession().insert("insertSeqNumber2", bean);
//	}
//	
//	public void updateHit(int no) {
//		this.getSqlSession().update("updateHit", no);
//	}
//	
//	
//	
//	public void updateReply(HashMap<String, Object>map) {
//		this.getSqlSession().update("updateReply",map);
//	}
//	public void updateStep(HashMap<String, Object>map) {
//		this.getSqlSession().update("updateStep",map);
//	}
//	
//	
//	
//	
//	
//	
//	public String newAjaxGetId(String id) {
//		return this.getSqlSession().selectOne("newAjaxGetId",id);
//	}
//	
//	
//	public String newgetDbPass(String id) {
//		return this.getSqlSession().selectOne("com.bit.homework.homework-mapper.newgetDbPass", id);
//	}
//	
//	public List<ReplyBoard>selectReplyBoard2(HashMap<String, Object>map){
//		return this.getSqlSession().selectList("selectReplyBoard",map);
//	}
//	
//
//	

package com.bit.web.play.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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

import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.squadboardBean;



@Repository
public class playDao extends SqlSessionDaoSupport{

	@Autowired
	SqlSession sqlSession;

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
	// 스쿼드 모집 게시판 PK 생성
	public int getSquadBoardSequence() {
		return this.getSqlSession().selectOne("getSquadBoardSequence");
	}
	// 스쿼드 모집 글 insert
	public void insertSquadBoard(squadboardBean bean) {
		this.getSqlSession().insert("insertSquadBoard", bean);
	}
	// 유저 아이디로 회원번호 return
	public int getUserNo(String writerId) {
		return this.getSqlSession().selectOne("getUserNo", writerId);
	}
	// 유저 아이디로 닉네임 return
	public String getUserName(String writerId) {
		return this.getSqlSession().selectOne("getUserName", writerId);
	}

	//회원가입
	public void insertSeqNumber(membersBean bean) {
		this.getSqlSession().insert("insertSeqNumber", bean);
	}
	public String newAjaxGetSequence() {
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
	//이미지
	public void updateImg(membersBean bean) {
		this.getSqlSession().update("updateImg", bean);
	}
	//아이디 가져오기
	public String loginCheck(String checkId) {
		return this.getSqlSession().selectOne("loginCheck", checkId);
	}
	
	public void updateReply(HashMap<String, Object>map) {
		this.getSqlSession().update("updateReply",map);
	}	

//	public String getTotalRow(HashMap<String, Object>map) {
//		// TODO Auto-generated method stub
//		return this.getSqlSession().selectOne("getTotalRow",map);
//	}


	
	//스쿼드게시판 

	//스쿼드게시판 - 상세검색
	public Object selectSquadBoardInfo(int no) {
		return this.getSqlSession().selectOne("selectSquadBoardInfo", no);
	}
	
	//스쿼드게시판 - 호스트기준 스쿼드 정보 검색
	public List<squadboardBean>selectSquadBoardHost(String id){
		return this.getSqlSession().selectList("selectSquadBoardHost", id);
	}
	//호스트리뷰 검색 - 호스트기준
	public List<hostreviewBean>selectHostReviewHost(String id){
		return this.getSqlSession().selectList("selectHostReviewHost", id);
	}

	//검색
	

	// 게시물 목록
	// 호스트 닉네임 기준
	public List<squadboardBean> selectHostNameList(String hostname) {
		return this.getSqlSession().selectList("selectHostNameList",hostname);
	}
	// 게임장르 기준
	public Object selectGamegenre_noList2(Object gamegenre_no) {
		return this.getSqlSession().selectOne("selectGamegenre_noList",gamegenre_no);
	}
	public List<squadboardBean> selectGamegenre_noList(Object gamegenre_no) {
		return this.getSqlSession().selectList("selectGamegenre_noList",gamegenre_no);
	}
	
}



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
	
	//���̵� ã�°� 
	public String find_user_id(String email) {
//		sqlSession.selectOne("idSearch", email);
		return this.getSqlSession().selectOne("idSearch", email);
	}
	//��й�ȣ ã��
	public String find_user_pw(HashMap<String,Object> map) {
//		sqlSession.selectOne("pwSearch", map);
		return this.getSqlSession().selectOne("pwSearch", map);
	}
	//�α��� 
	public String loginPass(String inputId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("loginPass", inputId);
	}
	// ������ ���� �Խ��� PK ����
	public int getSquadBoardSequence() {
		return this.getSqlSession().selectOne("getSquadBoardSequence");
	}
	// ������ ���� �� insert
	public void insertSquadBoard(squadboardBean bean) {
		this.getSqlSession().insert("insertSquadBoard", bean);
	}
	// ���� ���̵�� ȸ����ȣ return
	public int getUserNo(String writerId) {
		return this.getSqlSession().selectOne("getUserNo", writerId);
	}
	// ���� ���̵�� �г��� return
	public String getUserName(String writerId) {
		return this.getSqlSession().selectOne("getUserName", writerId);
	}

	//ȸ������
	public void insertSeqNumber(membersBean bean) {
		this.getSqlSession().insert("insertSeqNumber", bean);
	}
	public String newAjaxGetSequence() {
		return this.getSqlSession().selectOne("newAjaxGetSequence");
	}
	
	//ȸ������ - ���̵� �ߺ�
	public String ajaxGetId(String id) {
		return this.getSqlSession().selectOne("ajaxGetId", id);
	}
	//ȸ������ - �г��� �ߺ�
	public String ajaxGetNickname(String nickname) {
		return this.getSqlSession().selectOne("ajaxGetNickname", nickname);
	}
	
	//�����ʼ���
	//�̹���
	public void updateImg(membersBean bean) {
		this.getSqlSession().update("updateImg", bean);
	}
	//���̵� ��������
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


	
	//������Խ��� 
	

	
	//������Խ��� - �󼼰˻�
	public Object selectSquadBoardInfo(int no) {
		return this.getSqlSession().selectOne("selectSquadBoardInfo", no);
	}
	
	//������Խ��� - ȣ��Ʈ���� ������ ���� �˻�
	public List<squadboardBean>selectSquadBoardHost(String id){
		return this.getSqlSession().selectList("selectSquadBoardHost", id);
	}
	//ȣ��Ʈ���� �˻� - ȣ��Ʈ����
	public List<hostreviewBean>selectHostReviewHost(String id){
		return this.getSqlSession().selectList("selectHostReviewHost", id);
	}



	
	
	
	//�α���
	public String newgetDbPass(String id) {
		return this.getSqlSession().selectOne("com.bit.web.play.play-mapper.newgetDbPass", id);
	}
	
	
}



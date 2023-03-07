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
	
	//���̵� ã�°� 
	public String find_user_id(String email) {
		return this.getSqlSession().selectOne("idSearch", email);
	}
	//��й�ȣ ã��
	public String find_user_pw(HashMap<String,Object> map) {
		return this.getSqlSession().selectOne("pwSearch", map);
	}
	//�α��� 
	public String loginPass(String inputId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne("loginPass", inputId);
	}

	//ȸ������
	public void insertSeqNumber(membersBean bean) {
		this.getSqlSession().insert("insertSeqNumber", bean);
	}
	public Integer newAjaxGetSequence() {
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
	
	public Integer getSequence() {
		return this.getSqlSession().selectOne("getSequence");
	}
	public void updateReply(HashMap<String, Object>map) {
		this.getSqlSession().update("updateReply",map);
	}
	public void updateStep(HashMap<String, Object>map) {
		this.getSqlSession().update("updateStep",map);
	}

	//������ ����(â���� ����)
	public void updateBoard(membersBean bean) {
		this.getSqlSession().update("updateBoard", bean);
	}


	
	


//	@Override
//	public void updateData(Map<String, Object> map) throws Exception{
//		SqlSession.insert("updateData",map);
//	}


	
	
	
	
	
	//�α���
	public String newgetDbPass(String id) {
		return this.getSqlSession().selectOne("com.bit.web.play.play-mapper.newgetDbPass", id);
	}
	
	
}



	
	//���̵� �ߺ�üũ
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
//	//�Խù� �ۼ�
//	public void insertBoard(ReplyBoard2 Board) {
//		this.getSqlSession().insert("insertBoard", Board);
//	}
//	
//	//�Խù�
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

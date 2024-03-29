package com.bit.web.play.service.impl;

import com.bit.web.play.dao.PlayDao;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.vo.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PlayServiceImpl implements PlayService {

	private final PlayDao dao;

	/* 
	 * 로그인 페이지 > 로그인 > 아이디찾기 
	 */
	@Override
	public String find_user_id(String email) {
		return dao.find_user_id(email);
	}
	/*
	 * 로그인 페이지 > 로그인 > 비밀번호 찾기
	 */
	public String find_user_pw(HashMap<String,Object> map) {
		return dao.find_user_pw(map);
	}
	/*
	 * 로그인 페이지 > 로그인 > 비밀번호 비교
	 */
	@Override
	public String loginPass(String inputId) {
		return dao.loginPass(inputId);
	}
	/*
	 * 로그인 권한
	 */
	@Override
	public String selectAuthority(String inputId) {
		return dao.selectAuthority(inputId);
	}
	/* 
	 * 회원가입 페이지 > 회원가입 > 데이터 넣기
	 */
	@Override
	public void insertSeqNumber(MembersBean bean) {
		dao.insertSeqNumber(bean);
	}
	/* 
	 * 회원가입 페이지 > 회원가입 > 아이디 중복체크
	 */ 
	@Override
	public String ajaxGetId(String id) {
		return dao.ajaxGetId(id);
	}  
	/* 
	 * 회원가입 페이지 > 회원가입 > 닉네임 중복체크 
	 */     
	@Override
	public String ajaxGetNickname(String nickname) {
		return dao.ajaxGetNickname(nickname);
	}   
	/*
	 * 마이 페이지 > 프로필 수정 > 검색
	 */       	
	@Override
	public MembersBean getViewProfile(String members_id) throws Exception {
		return dao.getViewProfile(members_id);
	}
	/*
	 * 마이 페이지 > 프로필 수정 > 수정
	 */       	
	@Override
	public void postViewProfile(MembersBean bean) {
		dao.postViewProfile(bean);
	}
	/*
	 * 마이 페이지 > 게스트 후기 > 기본키 생성
	 */
	@Override
	public Integer getGuestReviewSequence() {
		return dao.getGuestReviewSequence();
	}
	/*
	 * 마이 페이지 > 게스트 후기 > 데이터 넣기
	 */	
	@Override
	public void insertGuestReview(GuestReviewBean bean) {
		dao.insertGuestReview(bean);
	}
	/*
	 * 마이 페이지 > 게스트 후기 > 호스트리뷰 검색(작성자 기준) 
	 */	
	@Override
	public List<GuestReviewBean> selectGuestReview1(String id){
		return dao.selectGuestReview1(id);
	}
	/*
	 * 마이 페이지 > 사용자 정보 insert 임의로
	 */

	/*@Override
	public GuestReviewBean getReviewInfo(String host_id) {
	 return dao.getReviewInfo(host_id);
	}*/

	@Override
	public String insertMyInfo(MembersBean bean) {
		return dao.insertMyInfo(bean);
	}
	/*
	 * 마이 페이지 > 사용자 정보 select 
	 */	
	@Override
	public List<MembersBean> selectMyInfo(String id) {
		return dao.selectMyInfo(id);
	}
	/*
	 * 검색 페이지
	 */
	@Override
	public List<SquadboardBean> selectBoardList(HashMap<String, Object>map) {
		return dao.selectBoardList(map);
	}
	/*
	 * 메인 페이지 > 모집중인 스쿼드 > 리스트 검색
	 */
	@Override
	public List<SquadboardBean> squadstate0Select() {
		return dao.squadstate0Select();
	}
	/*
	 * 메인 페이지 > 인기 스쿼드 > 리스트 호스트 팔로워순 검색
	 */
	@Override
	public List<SquadboardBean> squadPopularSelect(){
		return dao.squadPopularSelect();
		/*
		 * 메인 페이지 > 인기게임 리스트 검색
		 */	
	}
	@Override
	public List<GamegenreBean> popularGameListSelect(){
		return dao.popularGameListSelect();
	}
	/*
	 * 스쿼드 게시판 > 생성 페이지 > 아이디로 닉네임 return 
	 */	
	@Override
	public String getUserName(String writerId) {
		return dao.getUserName(writerId);
	}
	/*
	 * 스쿼드 게시판 > 생성 페이지 > 게임 이미지 호출 
	 */	
	@Override
	public String gameImgSrcSelect(int no) {
		return dao.gameImgSrcSelect(no);
	}
	/*
	 * 스쿼드 게시판 > 생성 페이지 > 스쿼드 모집 게시판 PK 생성
	 */	
	@Override
	public int getSquadBoardSequence() {
		return dao.getSquadBoardSequence();
	}
	/*
	 * 스쿼드 게시판 > 생성 페이지 > 스쿼드 모집 글 insert
	 */	
	@Override
	public void insertSquadBoard(SquadboardBean bean) {
		dao.insertSquadBoard(bean);
	}
	/*
	 * 스쿼드 게시판 페이지 > 스쿼드 상세내용 검색
	 */	
	@Override
	public Object selectSquadBoardInfo(int squadboardno) {
		return dao.selectSquadBoardInfo(squadboardno);
	}
	/*
	 * 스쿼드 게시판 페이지 > 호스트 기준 > 스쿼드 정보 리스트 검색
	 */	
	@Override
	public List<SquadboardBean>selectSquadBoardHost (HashMap<String, Object> map){
		return dao.selectSquadBoardHost(map);
	}
	/*
	 * 스쿼드 게시판 페이지 > 호스트 기준 > 리뷰 리스트 검색
	 */	
	@Override
	public List<HostreviewBean>selectHostReviewHost(String hostId){
		return dao.selectHostReviewHost(hostId);
	}
	/*
	 * 스쿼드 게시판 페이지 > 호스트 기준 > 게시판 수 
	 */	
	@Override
	public int selectSquadCnt(String hostId) {
		return dao.selectSquadCnt(hostId);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 참가기록 넣기
	 */	
	@Override
	public void insertSquadHistory(SquadhistoryBean bean) {
		dao.insertSquadHistory(bean);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 수락대기 넣기
	 */	
	@Override
	public void insertAcceptWaitting(AcceptwaittingBean bean) {
		dao.insertAcceptWaitting(bean);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 참가기록 기본키 생성
	 */	
	@Override
	public Integer getSequence_SquadHistory() {
		return dao.getSequence_SquadHistory();
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 수락대기 기본키 생성
	 */	
	@Override
	public Integer getSequence_AcceptWaitting() {
		return dao.getSequence_AcceptWaitting();
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 참가자 수 증가
	 */	
	@Override
	public void updateSB_acceptcnt_increase(int squadboardno) {
		dao.updateSB_acceptcnt_increase(squadboardno);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 참가자 수 감소
	 */	
	@Override
	public void updateSB_acceptcnt_decrease(int squadboardno) {
		dao.updateSB_acceptcnt_decrease(squadboardno);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가버튼 > 참가자수 비교
	 */
	@Override
	public String selelctCompareUserCnt(int squadboardno) {
		return dao.selelctCompareUserCnt(squadboardno);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가나 신청 중인지 여부 확인(참가기록 테이블)
	 */	
	@Override
	public String selectIdSquadHistory(HashMap<String, Object>map) {
		return dao.selectIdSquadHistory(map);
	}
	/*
	 * 스쿼드 게시판 페이지 > 참가나 신청 중인지 여부 확인(신청여부 테이블)
	 */	
	@Override
	public String selectIdAcceptWaitting(HashMap<String, Object>map) {
		return dao.selectIdAcceptWaitting(map);
	}
	/*
	 * 스쿼드 게시판 페이지 > Ajax검색(예약시간)
	 */	
	@Override
	public String selectReserveDate(int squadboardno) {
		return dao.selectReserveDate(squadboardno);
	}	
	/*
	 * 스쿼드 게시판 페이지 > 상태 수정
	 */	
	@Override
	public void updateSquadState(HashMap<String, Object>map) {	
		dao.updateSquadState(map);
	}

	/*
	 *  내 스쿼드 페이지 > 게스트 기준 진행 전 스쿼드 검색
	 */
	@Override
	public List<SquadboardBean>selectParticipationSquad(String hostId) {
		return dao.selectParticipationSquad(hostId);
	}
	/*
	 *  내 스쿼드 페이지 > 게스트 기준 참가 기록 
	 */
	@Override
	public List<SquadboardBean>selectGuestHistory(String hostId) {
		return dao.selectGuestHistory(hostId);
	}
	/*
	 *  내 스쿼드 페이지 > 호스트 기준 종료 전 스쿼드 검색
	 */
	@Override
	public List<SquadboardBean>selectHostingSquad(String hostId) {
		return dao.selectHostingSquad(hostId);
	}
	/*
	 *  내 스쿼드 페이지 > 호스트 기준 호스팅 기록
	 */
	@Override
	public List<SquadboardBean>selectHostingHistory(String hostId) {
		return dao.selectHostingHistory(hostId);
	}
	/*
	 * 삭제페이지(게스트) > 삭제버튼 > 수락대기 삭제  
	 */
	@Override
	public void deleteAcceptWaittingGuest(HashMap<String, Object>map) {
		dao.deleteAcceptWaittingGuest(map);
	}
	/*
	 * 삭제페이지(게스트) > 삭제버튼 > 참가기록 삭제
	 */
	@Override
	public void deleteSquadHistoryGuest(HashMap<String, Object>map) {
		dao.deleteSquadHistoryGuest(map);
	}
	/*
	 * 삭제페이지(호스트) > 삭제버튼 > 수락대기 삭제(조건게시판)  
	 */
	@Override
	public void deleteAcceptWaittingSB(int squadboardno) {
		dao.deleteAcceptWaittingSB(squadboardno);
	}
	/*
	 * 삭제페이지(호스트) > 삭제버튼 > 참가기록 삭제(조건게시판)
	 */
	@Override
	public void deleteSquadHistorySB(int squadboardno) {
		dao.deleteSquadHistorySB(squadboardno);
	}
	/*
	 *  호스팅관리페이지 > 참가신청 완료 인원 확인
	 */
	@Override
	public List<SquadboardBean>selectSquadHistoryNo(int squadboardno) {
		return dao.selectSquadHistoryNo(squadboardno);
	}
	/*
	 *  호스팅관리페이지 > 수락대기 인원 확인
	 */
	@Override
	public List<SquadboardBean>selectAcceptWaittingNo(int squadboardno) {
		return dao.selectAcceptWaittingNo(squadboardno);
	}

	/*
	 * 공지사항 페이지 > 기본키 생성
	 */	
	@Override
	public Integer getSequence2() {
		return dao.getSequence2();
	}
	/*
	 * 공지사항 페이지 > 데이터 넣기
	 */	
	@Override
	public String insertNoticeBoard(NoticeBoardBean bean) {
		return dao.insertNoticeBoard(bean);
	}
	/*
	 * 공지사항 페이지 > 검색
	 */	
	@Override
	public List<NoticeBoardBean> selectNoticeBoard() {
		return dao.selectNoticeBoard();
	}

	/*
	 * 메인페이지 > 인기게임 > 게임별 스쿼드 리스트
	 */
	@Override
	public List<SquadboardBean> squadListForEachGameSelect(int gamegenre_no){
		return dao.squadListForEachGameSelect(gamegenre_no);
	}
	/*
	 * 메인페이지 > 인기게임 > 게임별 호스트 리스트
	 */
	@Override
	public List<MembersBean> hostListForEachGameSelect(int gamegenre_no){
		return dao.hostListForEachGameSelect(gamegenre_no);
	}
	/*
	 * 메인페이지 > 인기게임 > 게임별 게임 정보
	 */
	@Override
	public List<GamegenreBean> popularGameInfoSelect(int gamegenre_no){
		return dao.gameInfoForEachGameSelect(gamegenre_no);
	}
	/* 
	 * 스쿼드 수 업데이트
	 */
	@Override
	public void squadCntUpdate() {
		dao.squadCntUpdate();
	}
	/* 
	 * 아이디로 닉네임 구해오기 
	 */
	@Override
	public String getNicknameById(String inputId) {
		return dao.getNicknameById(inputId);
	}
	/*
	 * 신청 가능한 스쿼드(마이페이지)
	 */
	@Override
	public List<SquadboardBean> registerSquadInfoSelect(String userId){
		return dao.registerSquadInfoSelect(userId);
	}
	
	@Override
	public List<GamegenreBean> mainGamePlay(String userId){
		return dao.mainGamePlay(userId);
	}

	/*
	 * 기타??
	 */	
	@Override
	public int getUserNo(String writerId) {
		return dao.getUserNo(writerId);
	}
	@Override
	public int followTableSequence() {
		return dao.followTableSequence();
	}
	@Override
	public List<Map<String, Object>> followCheck(String my_id){
		return dao.followCheck(my_id);
	}
	@Override
	public void followTableInsert(HashMap<String, Object>map) {
		dao.followTableInsert(map);
	}
	@Override
	public void followCntDown(String host_id) {
		dao.followCntDown(host_id);
	}
	@Override
	public void followDelete(HashMap<String, Object>map) {
		dao.followDelete(map);
	}
	@Override
	public void followCntUpdate(String host_id) {
		dao.followCntUpdate(host_id);
	}
	@Override
	public int selectFollowCnt(String id) {
		return dao.selectFollowCnt(id);
	}
	


}
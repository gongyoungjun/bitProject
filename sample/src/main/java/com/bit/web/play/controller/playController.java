package com.bit.web.play.controller;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.email.MailUtil;
import com.bit.web.play.service.PlayService;
import com.bit.web.play.service.impl.PlayServiceImpl;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.searchType;
import com.bit.web.play.vo.squadboardBean;
import com.bit.web.play.vo.gamegenreBean;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.web.play.vo.NoticeBoardBean;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.FileOutputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

@Controller
//TODO 0314
@RequiredArgsConstructor
@Slf4j
public class playController {

	private final playDao dao;
	//TODO 0314 ���񽺸� wired ���ּž��մϴ�.
	private final PlayService playService;
	
	
//	���̵� ã��
	@RequestMapping(value = "idSearch", method = RequestMethod.GET)
	@ResponseBody
	public String sendId(@RequestParam(value ="email", required = false)String email) {
		String checkedId = dao.find_user_id(email);
		MailUtil.naverMailSend(email, "PlaySquad ID�Դϴ�.", checkedId);
		return "success";
	};

//	��й�ȣã��
	@RequestMapping(value="pwSearch", method=RequestMethod.GET)
	@ResponseBody
	public String pwSearch(@RequestParam(value="user_id", required = false)String userId, @RequestParam(value="pw_find_email", required=false)String pw_find_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pw_find_email", pw_find_email);
		return dao.find_user_pw(map);
	};
	
	//�α��� üũ
	@RequestMapping(value = "playsquadLoginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam(value = "id", required = false)String inputId, @RequestParam(value = "password", required = false)String inputPassword,
							HttpServletRequest req) {
		
		 String loginPass = dao.loginPass(inputId);
		 String authority = dao.selectAuthority(inputId);
		 System.out.println(inputId);
		 System.out.println(inputPassword);
		 System.out.println(loginPass);
		 if(loginPass.equals(inputPassword)) {
			 req.getSession().setAttribute("userId", inputId);
			 req.getSession().setAttribute("userAuthority", authority);
			 System.out.println(dao.selectAuthority(inputId));
			 req.getSession().setMaxInactiveInterval(60*60*24);
			 return "success";
		 }else { 
			 return "failed";
		 }
	};
	
//	�α׾ƿ�
	@RequestMapping(value = "logoutAction")
	@ResponseBody
	public String logoutAction(HttpServletRequest req) {
		System.out.println("User Logout");
		req.getSession().invalidate();
		System.out.println("Session Deleted");
		return "Logout Success";
	};
	
	
	@RequestMapping(value = "playsquadListAction", method = RequestMethod.POST)
	public String playsquadListAction() {
		System.out.println("List Action In Process..");
		
		return "play/mainpage";
	};
	// ������ ���� �� �ۼ�
		// ���ǿ��� ���̵� �о����, �ؽ��±� �޾Ƽ� db�� �ִ� ��� �̱���
		@PostMapping(value = "squadBoardInsert")
		public String squadBoardInsert(squadboardBean bean, @RequestParam(value="reservedate_input")String reservedate_input
				// , @RequestParam(value ="id", required=false)String writerId
				) {
			System.out.println("Board Insert In Process..");
			// �׽�Ʈ�� �ۼ��� ���̵� blue�� �ӽ� ����. �α��κ��� ����� parameter���� �����;� ��.
			// ������ �Ʒ� �ڵ� �����ؾ�
			String writerId = "blue";
			
			// squadboard_no
			bean.setSquadboard_no(dao.getSquadBoardSequence());
			// gamegenre_no - view���� ������
			
			// members_no - db���� �ۼ��� ���̵�� �����´�
			// bean.setMembers_no(dao.getUserNo(writerId));
			bean.setMembers_id(writerId);
			// hostname - db���� �ۼ��� ���̵�� �����´�
			bean.setHostname(dao.getUserName(writerId));
			
			// user_acceptcnt - �ű� ������ �ۼ��̹Ƿ� insert�� ������ 0
			bean.setUser_acceptcnt(0);
			
			// user_maxcnt - view���� ������
			// recruitoption - view���� ������
			// playtime - view���� ������
			// regdate - mapper���� sysdate��
			
			// reservedate - view���� ���������� ����ȯ �ʿ�. parsing �� insert
			System.out.println(reservedate_input);
			String newReservedate = reservedate_input.replace("T", " ");
			System.out.println(reservedate_input + newReservedate);
			LocalDateTime reservedate = LocalDateTime.parse(newReservedate, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
			System.out.println(reservedate);
			bean.setReservedate(reservedate);
		
			// squadstate - insert�� ������ 0(������)
			bean.setSquadstate(0);
			
			// price - view���� ������
			// payedstate - view���� ������
			// filename - view���� ������
			
			// tags �̱���. �ӽ÷� �⺻�±� ����
			bean.setTags("defaultHashtag");
			
			// db�� �ֱ� �� �ֿܼ� �ѷ��� üũ
			System.out.println(bean);
			// insert
			dao.insertSquadBoard(bean);		
			System.out.println("Board Insert Success!");
			return"insert success";
		};
		
	// �������� ������
	@GetMapping(value = "squadstate0ListAction")
	@ResponseBody
	public List<squadboardBean> mainPageListAction(Model model) {
		//model.addAttribute("mojib", dao.squadstate0Select());
		//System.out.println(model);
		System.out.println(dao.squadstate0Select());
		return  dao.squadstate0Select();
	};
	
	// �α����
	@GetMapping(value = "popularGameListAction")
	@ResponseBody
	public List<gamegenreBean> popularGameListAction(){
		System.out.println(dao.popularGameListSelect());
		return dao.popularGameListSelect();
	};
	
	// �α⽺���� ȣ��Ʈ �ȷο���
	@GetMapping(value = "squadPopularSelectAction")
	@ResponseBody
	public List<squadboardBean> squadPopularSelectAction(){
		return dao.squadPopularSelect();
	};
	


	//ȸ������
	
	@RequestMapping(value = "newMember")

	public String newAjaxCrudReplyAction(membersBean bean) {
	
		log.debug("ȸ������ {}", bean);

		playService.insertSeqNumber(bean); 
		return "redirect:/play/login.jsp";
	};
	
	//ȸ������ - ���̵� �ߺ�üũ
	@PostMapping(value = "ajaxFindID")
	@ResponseBody
	public String findId(@RequestParam(value = "id",required = false,defaultValue = "BLUE")String id) {	 
		   System.out.println(dao);
		//return "Test";
		return dao.ajaxGetId(id)!=null?String.valueOf(true):String.valueOf(false);
	}
	//ȸ������ - ���� �ߺ� üũ
	@PostMapping(value = "ajaxFindNickname")
	@ResponseBody
	public String findNickname(@RequestParam(value = "Nickname",required = false,defaultValue = "BLUE")String ninckname) {	 
		   System.out.println(dao);
		//return "Test";
		return dao.ajaxGetNickname(ninckname)!=null?String.valueOf(true):String.valueOf(false);
	}

	    

	    
	    //������ 
	    // ������ ��������
	    @RequestMapping(value = "/play/viewProfile", method = RequestMethod.GET)
	    public String getView(membersBean bean, String id ,Model model) throws Exception {
	    	
	    	membersBean vo = playService.getViewProfile(id);
	    	
	    	model.addAttribute("view", vo);
	    	
//	    	bean.setMembers_id(id);
	    	
	    	System.out.println(vo);
	    	return "play/profile";
	    }
	    //������ ����
//	    @RequestMapping(value = "/play/updateProfile", method = RequestMethod.POST)
//	    public String postView(membersBean bean)  {
//	    	
//	    	playService.postViewProfile(bean);
//	    	 
//	    	System.out.println(bean);
//	    	return "play/mypage";
//	    }
	    
		@RequestMapping(value = "/play/updateProfile", method = RequestMethod.POST )
		public String updateProfile(membersBean bean,
				@RequestParam(value = "profileimg", required = false, defaultValue = "profileimg") MultipartFile file) {
	       
			String loc = "C:\\Users\\BIT\\git\\bitProject\\sample\\src\\main\\webapp\\resources\\img\\play\\upload\\";
			
			FileOutputStream fos = null;
			String orginFile = file.getOriginalFilename();
			if (orginFile.length() > 0) {
				try {
					fos = new FileOutputStream(loc + orginFile);
					fos.write(file.getBytes());
					bean.setProfile_img(orginFile);
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}
			playService.postViewProfile(bean);
	    	 
	    	System.out.println(bean);
	    	return "play/mypage";
			
			}

	
	    
	    
	    

		//������ �Խ���
		//������ �Խ��� - �˻�
		@RequestMapping(value="squadBoardInfoSelect", method = RequestMethod.GET)
		public String squadboardInfoSelectProcess(Model model, squadboardBean squadboard, 
				hostreviewBean hostreview, int no, String job, String hostid) {
			//System.out.println(dao.selectSquadBoardInfo(no));
			model.addAttribute("squad", dao.selectSquadBoardInfo(no));
			model.addAttribute("squadList", dao.selectSquadBoardHost(hostid));
			model.addAttribute("reviewList", dao.selectHostReviewHost(hostid));
			return "play/squadboard";
		}


		//��������
		@RequestMapping(value="NoticeBoardInsert", method = RequestMethod.POST)
		public String NoticeBoardInsert(NoticeBoardBean bean, Model model, @RequestParam String writer_id) {
			bean.setNoticeboard_no(dao.getSequence2());
			//bean.setWriter_id(writer_id);
			System.out.println(bean);
			dao.insertNoticeBoard(bean);
			return "play/noticeboard";
			
		}
		
		@RequestMapping(value="selectNoticeBoard", method=RequestMethod.GET)
			public String selectNoticeBoard(Model model) {
			model.addAttribute("notice", dao.selectNoticeBoard());
			System.out.println(model);
			return "play/noticeboard";
		}		
		
		//�˻�
		
		@RequestMapping(value="/play/listPageSearch")
		public String selectBoardList(ModelMap model, HttpServletRequest request) {
			//�˻� �� ����
			HashMap<String, Object>map  = new HashMap<String, Object>();
			map.put("query", request.getParameter("query"));
			map.put("data", request.getParameter("data"));
//			//����¡ �� ����
//			PageBean pageBean = pageAction.paging(request, map);
//			map.put("start",  pageBean.getStart());
//			map.put("end",  pageBean.getEnd());
			//�� ����
//			model.addAttribute("pageBean", pageBean);
			model.addAttribute("list", playService.selectBoardList(map));
			//System.out.println(playService.selectBoardList(map));
			System.out.println(map);
			return "play/search";
		}

		
		
}
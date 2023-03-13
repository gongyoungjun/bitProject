package com.bit.web.play.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.web.play.service.PlayService;
import lombok.extern.slf4j.Slf4j;
import org.apache.velocity.texen.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.play.dao.playDao;
import com.bit.web.play.email.MailUtil;
import com.bit.web.play.vo.hostreviewBean;
import com.bit.web.play.vo.membersBean;
import com.bit.web.play.vo.squadboardBean;
import com.google.common.util.concurrent.Service;

@Controller
@Slf4j
public class playController {
	@Autowired
	private playDao dao;

	@Autowired
	private PlayService playService;

//	아이디 찾기
	@RequestMapping(value = "idSearch", method = RequestMethod.GET)
	@ResponseBody
	public String sendId(@RequestParam(value ="email", required = false)String email) {
//		String checkedId = dao.find_user_id(email);
		//TODO 0313
		//서비스를 사용해주어야합니다.
		//트렌젝션의 발생도 서비스에서 시작되어야하구요
		//서비스는
		String checkedId = playService.find_user_id(email);
		MailUtil.naverMailSend(email, "PlaySquad ID입니다.", checkedId);
		return "success";
	};

//	비밀번호찾기
	@RequestMapping(value="pwSearch", method=RequestMethod.GET)
	@ResponseBody
	public String pwSearch(@RequestParam(value="user_id", required = false)String userId, @RequestParam(value="pw_find_email", required=false)String pw_find_email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("pw_find_email", pw_find_email);
		return dao.find_user_pw(map);
	};
	
	//로그인 체크
	@RequestMapping(value = "playsquadLoginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@RequestParam(value = "id", required = false)String inputId, @RequestParam(value = "password", required = false)String inputPassword,
							HttpServletRequest req) {
		
		 String loginPass = dao.loginPass(inputId);
		 System.out.println(inputId);
		 System.out.println(inputPassword);
		 System.out.println(loginPass);
		 if(loginPass.equals(inputPassword)) {
			 req.getSession().setAttribute("userId", inputId);
			 req.getSession().setMaxInactiveInterval(60*60*24);
			 return "success";
		 }else { 
			 return "failed";
		 }
	};
	
//	로그아웃
	@RequestMapping(value = "logoutAction", method = RequestMethod.GET)
	@ResponseBody
	public String logoutAction(HttpServletRequest req) {
		System.out.println("User Logout");
		req.getSession().invalidate();
		return "logout success";
	};
	
	
	@RequestMapping(value = "playsquadListAction", method = RequestMethod.POST)
	public String playsquadListAction() {
		System.out.println("List Action In Process..");
		
		return "play/mainpage";
	};
	// 스쿼드 모집 글 작성
		// 세션에서 아이디 읽어오기, 해시태그 받아서 db에 넣는 기능 미구현
		@PostMapping(value = "squadBoardInsert")
		public String squadBoardInsert(squadboardBean bean, @RequestParam(value="reservedate_input")String reservedate_input
				// , @RequestParam(value ="id", required=false)String writerId
				) {
			System.out.println("Board Insert In Process..");
			// 테스트용 작성자 아이디 blue로 임시 설정. 로그인부터 연결시 parameter에서 가져와야 함.
			// 구현시 아래 코드 수정해야
			String writerId = "blue";
			
			// squadboard_no
			bean.setSquadboard_no(dao.getSquadBoardSequence());
			// gamegenre_no - view에서 가져옴
			
			// members_no - db에서 작성자 아이디로 가져온다
			// bean.setMembers_no(dao.getUserNo(writerId));
			bean.setMembers_id(writerId);
			// hostname - db에서 작성자 아이디로 가져온다
			bean.setHostname(dao.getUserName(writerId));
			
			// user_acceptcnt - 신규 모집글 작성이므로 insert시 무조건 0
			bean.setUser_acceptcnt(0);
			
			// user_maxcnt - view에서 가져옴
			// recruitoption - view에서 가져옴
			// playtime - view에서 가져옴
			// regdate - mapper에서 sysdate로
			
			// reservedate - view에서 가져오지만 형변환 필요. parsing 후 insert
			System.out.println(reservedate_input);
			String newReservedate = reservedate_input.replace("T", " ");
			System.out.println(reservedate_input + newReservedate);
			LocalDateTime reservedate = LocalDateTime.parse(newReservedate, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
			System.out.println(reservedate);
			bean.setReservedate(reservedate);
		
			// squadstate - insert시 무조건 0(모집중)
			bean.setSquadstate(0);
			
			// price - view에서 가져옴
			// payedstate - view에서 가져옴
			// filename - view에서 가져옴
			
			// tags 미구현. 임시로 기본태그 설정
			bean.setTags("defaultHashtag");
			
			// db에 넣기 전 콘솔에 뿌려서 체크
			System.out.println(bean);
			// insert
			dao.insertSquadBoard(bean);		
			System.out.println("Board Insert Success!");
			return"insert success";
		}



	//회원가입
	
	@RequestMapping(value = "newMember")

	public String newAjaxCrudReplyAction(membersBean bean) { //requestparam 부분은 이미지를 받아오기

		//bean.setMembers_id(dao.newAjaxGetSequence());
		//TODO 0313  log.debug 사용해주세요
		//@Slf4j 롬복을 class에 선언해주시면 간단히 사용가능합니다.
//		System.out.println(bean); //값이 들어가는지
		log.debug("회원가입 {}", bean);

		//TODO 0313 service interface가 필요합니다.
		//controller 에서 바로 dao 호출하는건 권장하지 않는 방법입니다.
		//단순한 로직이라도 서비스 인터페이스를 사용해야합니다.
		//인터페이스는 약속이고, dao Repository는 서비스를 제공하는 사람이 자유롭게 사용하는 영역으로 나누어야 할거같습니다.
		//서비스 인터페이스를 생성한다는건 서비스를 제공하는사람과 사용하는 사람의 약속입니다.
		//서비스 인터페이스를 만들고 (insertSeqNumber)
		//이서비스를 호출하면 회원을 가입해준다고 약속하는것이 인터페이스입니다.
		//인터페이스로 제공하면, 누구나 가져다쓸수있게되며..(다른서비스에서),
		//본인이 만든 서비스가 변경이 필요할경우, (파라미터 변경, 응답값 변경)
		//이미 insertSeqNumber를 사용하는 사람은 오류가 날수있으므로, 변경이 필요해도 기존에 사용하던사람이
		//오류없이 사용할수 있도록 하위호환을 지켜주셔야하며 (호출하면 어떤값이 온다 라는것을 지켜주어야합니다.)
		//변경이 많다면 새로운 서비스를 만들어주는것이 일반적입니다./v1/insertSeqNumber -> /v2/insertSeqNumber

//		dao.insertSeqNumber(bean);
		//반면 서비스에서 가져다 사용하는 dao의 경우는
		//필요하 바로 참조하는 서비스가 아니기에
		// dao를 가져다 쓰는 사람의 하위호환가지 지켜줄 필요가 없습니다.
		//dao는 반드시 서비스를 통해 호출하도록 강제하여
		//서비스를 제공하는 사람의 자율성을 높여주어야 합니다.
		playService.insertSeqNumber(bean);
		return "redirect:/play/login.jsp";
		
	};
	
	//회원가입 - 아이디 중복체크
	@PostMapping(value = "ajaxFindID")
	@ResponseBody
	public String findId(@RequestParam(value = "id",required = false,defaultValue = "BLUE")String id) {	 
		   System.out.println(dao);
		//return "Test";
		return dao.ajaxGetId(id)!=null?String.valueOf(true):String.valueOf(false);
	}
	//회원가입 - 별명 중복 체크
	@PostMapping(value = "ajaxFindNickname")
	@ResponseBody
	public String findNickname(@RequestParam(value = "Nickname",required = false,defaultValue = "BLUE")String ninckname) {	 
		   System.out.println(dao);
		//return "Test";
		return dao.ajaxGetNickname(ninckname)!=null?String.valueOf(true):String.valueOf(false);
	}

	    
	    //프로필 내용 수정하는 페이지
 
	    @GetMapping("update/profileForm")
	    public String profileForm() {
	    	return "update/profileForm";
	    }
	    
	    //프로필 수정
	    
		@RequestMapping(value = "profileUpdate")
		public String profileUpdate(membersBean bean,
				@RequestParam(value = "id", required = false)String checkId,
				@RequestParam(value = "file", required = false, defaultValue = "noImage.jpg") MultipartFile file) {
	       
			String loc = "C:\\Users\\BIT\\git\\bitProject\\sample\\src\\main\\webapp\\resources\\img\\play\\upload\\";
			FileOutputStream fos = null;
			String orginFile = file.getOriginalFilename();
			if (orginFile.length() > 0) {
				try {
					fos = new FileOutputStream(loc + orginFile);
					fos.write(file.getBytes());
					bean.setProfile_img(orginFile);;
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

			}
			String loginCheck = dao.loginCheck(checkId);
			
			if(loginCheck.equals("checkId")) {
				
				HashMap<String, Object>map=new HashMap<String, Object>();
				map.put("ninkname", bean.getNickname());
				map.put("tel", bean.getTel());
				map.put("email", bean.getEmail());
				map.put("genre1", bean.getGenre1());
				map.put("genre2", bean.getGenre2());
				map.put("aboutme", bean.getAboutme());
				dao.updateReply(map);
				
			}else {
				
				return "redirect:/play/login.jsp";
				
			}
			return "redirect: newMember";

		}

		//스쿼드 게시판
		//스쿼드 게시판 - 검색
		@RequestMapping(value="squadBoardInfoSelect", method = RequestMethod.GET)
		public String squadboardInfoSelectProcess(Model model, squadboardBean squadboard, 
				hostreviewBean hostreview, int no, String job, String hostid) {
			//System.out.println(dao.selectSquadBoardInfo(no));
			model.addAttribute("squad", dao.selectSquadBoardInfo(no));
			model.addAttribute("squadList", dao.selectSquadBoardHost(hostid));
			model.addAttribute("reviewList", dao.selectHostReviewHost(hostid));
			return "play/squadboard";
		}





}
	        


			

	
	    


	 
	 
	 


	
	

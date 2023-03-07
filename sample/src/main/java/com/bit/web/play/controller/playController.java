package com.bit.web.play.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.velocity.texen.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.bit.web.play.vo.membersBean;
import com.google.common.util.concurrent.Service;

@Controller
public class playController {
	@Autowired
	private playDao dao;
	
	
//	아이디 찾기
	@RequestMapping(value = "idSearch", method = RequestMethod.GET)
	@ResponseBody
	public String sendId(@RequestParam(value ="email", required = false)String email) {
		String checkedId = dao.find_user_id(email);
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



	//회원가입
	
	@RequestMapping(value = "newMember")

	public String newAjaxCrudReplyAction(membersBean bean) { //requestparam 부분은 이미지를 받아오기
	
		bean.setMembers_no(dao.newAjaxGetSequence());
		System.out.println(bean); //값이 들어가는지 
		
		dao.insertSeqNumber(bean);
		
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
	

	    
	    
	    //프로필 수정
	   // @PostMapping("ajax")
	    //@RequestMapping(value = "ajax", method = RequestMethod.POST)
	 @RequestMapping(value = "ajax", method = RequestMethod.POST, 
	             produces = "text/html")
	    @ResponseBody 	    
		public String testBoardUpdateProcess(membersBean bean,
				@RequestParam(value = "profile_img")MultipartFile profile_img){
			System.out.println("profile_img="+profile_img);	
			System.out.println(bean);
			//String loc_img="C:\\spring\\springWeb\\sample\\src\\main\\webapp\\resources\\img\\play\\upload\\";
			//
			/*
			 * FileOutputStream fos = null; String originImgFile =
			 * file_img.getOriginalFilename(); if(originImgFile.length()>0) { try { fos= new
			 * FileOutputStream(loc_img+originImgFile); fos.write(file_img.getBytes());
			 * bean.setProfile_img(originImgFile);
			 * 
			 * }catch (Exception e) { e.printStackTrace(); } }else {
			 * bean.setProfile_img(bean.getProfile_img()); }
			 */

			//System.out.println(bean);

			//dao.updateBoard(bean);
			return "test.jpg";
			
		}

	    

}	
	



   //프로필 수정 동기방식으로 수정하자.
//	@RequestMapping(value = "profile")
//	public String updateProfile(membersBean bean,
//			@RequestParam(value = "file", required = false, defaultValue = "basic.jpg")MultipartFile file) {
//       
//		String loc = "C:\\spring\\springWeb\\sample\\src\\main\\webapp\\resources\\img\\play\\upload\\";
//		FileOutputStream fos = null;
//		String orginFile = file.getOriginalFilename();
//		if (orginFile.length() > 0) {
//			try {
//				fos = new FileOutputStream(loc + orginFile);
//				fos.write(file.getBytes());
//				bean.setProfile_img(orginFile);
//			} catch (Exception e) {
//				// TODO: handle exception
//				e.printStackTrace();
//			}
//
//		}

//
////이미지 업데이트
// private String path="c:\\spring\\springWeb\\sample\\src\\main\\webapp\\resources\\img\\play\\upload"; //path 경로를 미리 지정.
//  
// 
// @RequestMapping("/form")
//    public String form()
//    {
//        return "form";
//    }
//    
// 
//  @RequestMapping("/result111111") //"/result" URL에 대한 GET 요청을 처리하는 메소드임을 선언합니다.
//    public String result(@RequestParam("file1") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model)
//    {
//        String url = null;
//        
//        try {
// 
//            //String uploadpath = request.getServletContext().getRealPath(path);
//            String uploadpath = path; //업로드할 파일이 저장될 경로를 지정합니다. 이 경로는 외부 설정 파일에서 설정할 수 있습니다.
//            String originFilename = multi.getOriginalFilename(); //업로드된 파일의 원래 이름을 가져옵니다.
//            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length()); //업로드된 파일의 확장자를 가져옵니다.
//            long size = multi.getSize();
//            String saveFileName = genSaveFileName(extName); //현재 시간을 기준으로 파일 이름을 생성합니다. 생성된 파일 이름은 확장자를 포함합니다.
//            
//            System.out.println("uploadpath : " + uploadpath);
//            System.out.println("originFilename : " + originFilename);
//            System.out.println("extensionName : " + extName);
//            System.out.println("size : " + size);
//            System.out.println("saveFileName : " + saveFileName);
//            
//            if(!multi.isEmpty())
//            {
//                File file = new File(uploadpath, multi.getOriginalFilename()); //업로드된 파일을 저장할 파일 객체를 생성합니다.
//                multi.transferTo(file); //업로드된 파일을 서버에 저장합니다.
//                
//                model.addAttribute("filename", multi.getOriginalFilename()); //뷰에 업로드된 파일의 원래 이름을 전달합니다.
//                model.addAttribute("uploadPath", file.getAbsolutePath()); //뷰에 업로드된 파일의 저장 경로를 전달합니다.
//                
//                return "redirect:/play/profile.jsp"; //업로드가 완료된 후, 파일 목록 페이지로 이동합니다.
//            }
//        }catch(Exception e)
//        {
//            System.out.println(e);
//        }
//        return "redirect:form";
//    }
//    // 현재 시간을 기준으로 파일 이름 생성
//    private String genSaveFileName(String extName) {
//        String fileName = "";
//        
//        Calendar calendar = Calendar.getInstance();
//        fileName += calendar.get(Calendar.YEAR);
//        fileName += calendar.get(Calendar.MONTH);
//        fileName += calendar.get(Calendar.DATE);
//        fileName += calendar.get(Calendar.HOUR);
//        fileName += calendar.get(Calendar.MINUTE);
//        fileName += calendar.get(Calendar.SECOND);
//        fileName += calendar.get(Calendar.MILLISECOND);
//        fileName += extName;
//        
//        return fileName;
//    }	






	
	
	
	
	
	

	


	
	
	
	
	
	
	
	
	
	
	
	
	

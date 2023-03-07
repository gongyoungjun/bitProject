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
	
//	�α׾ƿ�
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



	//ȸ������
	
	@RequestMapping(value = "newMember")

	public String newAjaxCrudReplyAction(membersBean bean) { //requestparam �κ��� �̹����� �޾ƿ���
	
		bean.setMembers_no(dao.newAjaxGetSequence());
		System.out.println(bean); //���� ������ 
		
		dao.insertSeqNumber(bean);
		
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
	

	    
	    
	    //������ ����
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
	



   //������ ���� ���������� ��������.
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
////�̹��� ������Ʈ
// private String path="c:\\spring\\springWeb\\sample\\src\\main\\webapp\\resources\\img\\play\\upload"; //path ��θ� �̸� ����.
//  
// 
// @RequestMapping("/form")
//    public String form()
//    {
//        return "form";
//    }
//    
// 
//  @RequestMapping("/result111111") //"/result" URL�� ���� GET ��û�� ó���ϴ� �޼ҵ����� �����մϴ�.
//    public String result(@RequestParam("file1") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model)
//    {
//        String url = null;
//        
//        try {
// 
//            //String uploadpath = request.getServletContext().getRealPath(path);
//            String uploadpath = path; //���ε��� ������ ����� ��θ� �����մϴ�. �� ��δ� �ܺ� ���� ���Ͽ��� ������ �� �ֽ��ϴ�.
//            String originFilename = multi.getOriginalFilename(); //���ε�� ������ ���� �̸��� �����ɴϴ�.
//            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length()); //���ε�� ������ Ȯ���ڸ� �����ɴϴ�.
//            long size = multi.getSize();
//            String saveFileName = genSaveFileName(extName); //���� �ð��� �������� ���� �̸��� �����մϴ�. ������ ���� �̸��� Ȯ���ڸ� �����մϴ�.
//            
//            System.out.println("uploadpath : " + uploadpath);
//            System.out.println("originFilename : " + originFilename);
//            System.out.println("extensionName : " + extName);
//            System.out.println("size : " + size);
//            System.out.println("saveFileName : " + saveFileName);
//            
//            if(!multi.isEmpty())
//            {
//                File file = new File(uploadpath, multi.getOriginalFilename()); //���ε�� ������ ������ ���� ��ü�� �����մϴ�.
//                multi.transferTo(file); //���ε�� ������ ������ �����մϴ�.
//                
//                model.addAttribute("filename", multi.getOriginalFilename()); //�信 ���ε�� ������ ���� �̸��� �����մϴ�.
//                model.addAttribute("uploadPath", file.getAbsolutePath()); //�信 ���ε�� ������ ���� ��θ� �����մϴ�.
//                
//                return "redirect:/play/profile.jsp"; //���ε尡 �Ϸ�� ��, ���� ��� �������� �̵��մϴ�.
//            }
//        }catch(Exception e)
//        {
//            System.out.println(e);
//        }
//        return "redirect:form";
//    }
//    // ���� �ð��� �������� ���� �̸� ����
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






	
	
	
	
	
	

	


	
	
	
	
	
	
	
	
	
	
	
	
	

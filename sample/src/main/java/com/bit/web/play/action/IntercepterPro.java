package com.bit.web.play.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/* TODO 0313 lombok�� ����ؼ� �α��� ���ϰ� : @Slf4j */
@Slf4j
public class IntercepterPro extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		//TODO 0313
		//System.out.println("preHandle");
		//System.out.println ����Ͻø� �ڵ帮��� �����ǿ�
		log.debug("preHandle");
		//or
		log.debug("preHandle : {}", request.getParameter("user_id"));
		log.debug("preHandle : {}", request.getParameter("user_passwd"));
		// �α�� {} ��뿩�ΰ� ���� ������ �Ǳ⵵�մϴ�.
		// {}������� �ʰ� preHandle + request.getParameter("user_passwd")) ������� �α� ����ϸ�
		// ���ڿ� ������ �Ͼ�ϴ�. �ݸ� {}����Ͽ� �Ķ���ͷ� �ѱ��, ������ �Ͼ�� �ʰ�ó���˴ϴ�..

		// �� preHandle + request �� �α����ϸ�, ���ڿ� ������ �Ͼ �� �α� ������ �˻��Ͽ� �ֿܼ��� ������ �ʰ� ó���Ǳ⶧����
		//���ҽ��� ����ϰ�, ��ȿ�����Դϴ�.
		//{} ��ȣ�� ����ϸ�, debug ������ ���, trace�� �ƿ� ������ �ʿ䰡 ���� ������ trace�� �˻縸 �ϰ�, �α׸� �������� �ʽ��ϴ�.

		//TODO 0313
		//�ڹٴ� camelcase�� �ۼ����ּž��մϴ�.  user_id-> userId
		String user_id=request.getParameter("user_id");
		String user_passwd=request.getParameter("user_passwd");		
		if(!(user_id.equals("Admin")&& user_passwd.equals("1234"))) {
			response.sendRedirect("intercepterMvc/adminLogin.jsp");
			return false;
		}
		return true;
		
	}
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("postHandle");
		System.out.println(modelAndView.getModel().get("message"));
		modelAndView.getModel().put("message", "ModifyMessage");
		//int rs=10/0; error afterCompletion���� Exception��ü ���� 
		/***
         * View�� �������ϱ� ���� 
         * postHandle �޼ҵ尡 ȣ��ȴ�.        
         * modelAndView ������ �� �� �ִ�.
         * Ư�� View�� modelAndView ���� �����ؾ��� �ʿ䰡 �ִٸ�
         * postHandle �޼ҵ忡�� �۾��� �̷����� �ȴ�.
         */
			
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ex="+ex);
		System.out.println("afterCompletion");
		/***
         * Ŭ���̾�Ʈ���� 
         * ���������� Response�� �����ϱ� ����
         * ȣ��Ǵ� afterCompletion �޼ҵ忡��
         * Exception ������ ��ܿ´�.       
         * afterCompletion �޼ҵ忡����
         * response�� ���� Control �ϰų�
         * Exception ���� ���� �ڵ鸵�� �ϸ� �ȴ�.
         */
		
	}	

}

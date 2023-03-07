package com.bit.web.play.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class IntercepterPro extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("preHandle");
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

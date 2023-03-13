package com.bit.web.play.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/* TODO 0313 lombok을 사용해서 로깅을 편하게 : @Slf4j */
@Slf4j
public class IntercepterPro extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub

		//TODO 0313
		//System.out.println("preHandle");
		//System.out.println 사용하시면 코드리뷰시 감점되요
		log.debug("preHandle");
		//or
		log.debug("preHandle : {}", request.getParameter("user_id"));
		log.debug("preHandle : {}", request.getParameter("user_passwd"));
		// 로깅시 {} 사용여부가 면접 문제가 되기도합니다.
		// {}사용하지 않고 preHandle + request.getParameter("user_passwd")) 방식으로 로그 출력하면
		// 문자열 연산이 일어납니다. 반면 {}사용하여 파라미터로 넘기면, 연산이 일어나지 않고처리됩니다..

		// 또 preHandle + request 로 로깅을하면, 문자열 연산이 일어난 후 로그 레벨을 검사하여 콘솔에만 보이지 않게 처리되기때문에
		//리소스를 사용하고, 비효율적입니다.
		//{} 괄호를 사용하면, debug 레벨인 경우, trace는 아예 동작할 필요가 없기 때문에 trace는 검사만 하고, 로그를 생성하지 않습니다.

		//TODO 0313
		//자바는 camelcase로 작성해주셔야합니다.  user_id-> userId
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
		//int rs=10/0; error afterCompletion으로 Exception객체 전달 
		/***
         * View를 렌더링하기 전에 
         * postHandle 메소드가 호출된다.        
         * modelAndView 정보를 알 수 있다.
         * 특정 View에 modelAndView 값을 수정해야할 필요가 있다면
         * postHandle 메소드에서 작업이 이뤄지면 된다.
         */
			
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ex="+ex);
		System.out.println("afterCompletion");
		/***
         * 클라이언트에게 
         * 최종적으로 Response를 전달하기 전에
         * 호출되는 afterCompletion 메소드에는
         * Exception 정보가 담겨온다.       
         * afterCompletion 메소드에서는
         * response의 값을 Control 하거나
         * Exception 값에 따른 핸들링을 하면 된다.
         */
		
	}	

}

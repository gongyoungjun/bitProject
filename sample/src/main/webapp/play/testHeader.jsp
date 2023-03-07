<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/play/index.css">
<style>
	.search{
		/* position: relative; */
	
	}
	.topFixBanner {

        text-align: left; 

        background-color: #ffffff;

        padding: 20px 0px 20px 20px;

		/* border-bottom:#666666 solid 2px; */
		
		display:flex;
		
		flez-wrap:wrap;
		
		justify-content:space-between;
		
		align-items:center;
      }
      .topFixBannerFixed {

        position: sticky;
        
		/* border-bottom:#666666 solid 2px; */
		
		display:flex;
		
		flez-wrap:wrap;
		
		justify-content:space-between;
		
		align-items:center;
		
        top: 0px;
      }

</style> 
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(function(){
	var bannerOffset = $('.topFixBanner').offset();
    $(window).scroll(function() {
          if ($(document).scrollTop() > bannerOffset.top) {
            $('.topFixBanner').addClass('topFixBannerFixed');
          }
          else {
            $('.topFixBanner').removeClass('topFixBannerFixed');
          }
     });
    $("button#logout").click(function(){
    	$.ajax({
			   url:'/web/logoutAction',
			   type:'GET',
			   contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			   success:function(s){
				   console.log(s);
				   location.reload(true);
			   },
			   error:function(e){
				   console.log('error');
			   }
		}); 
   });
    
});
</script>
</head>
<body>

<c:choose>
<c:when test="${userId == null}"> <%-- 로그인 안 한 경 우 --%>
<nav class="topFixBanner" style="background:transparent; display:flex; flez-wrap:wrap; justify-content:space-between; align-items:center;">
	<a align="right"   href="mainpage.jsp" style="width: 45px; height: auto; margin-left:0px;">
	<img src="/web/resources/img/play/technology.png" style="width:60px; height: auto; margin-left:50px;">
	</a>
	
	<div class="banner_middle" style="flex-grow:1; text-align:left;"></div>
		<!-- <span class="new_squad">
			<button style="margin:3px">새 스쿼드</button>
		</span>
		<span class="my_squad">
			<button style="margin:3px">내 스쿼드</button>
		</span>
		<span class="my_wallet">
			<button style="margin:3px">지갑</button>
		</span> -->
		
	<div class="banner_right" style="flex-grow:2; float:right; text-align:right;">	
		<span class="search">
			<input type="text" style="height:40px;width:200px; background-color: #141414; border:1; border-color:white;" placeholder="" />
					
					<a type="button" href="search.jsp"> 
						<i class="fa-solid fa-magnifying-glass"></i>
					</a>
					
	
		</span>

		<span class="login">	
			<a type="button" href="login.jsp" style="margin-left: 30px">로그인
			</a>
		</span>
		<span class="signup">
			<a type="button" href="signup.jsp" style="margin-left: 30px;margin-right: 30px">회원가입
			</a>
		</span>
	</div>
</nav>
</c:when>

<c:otherwise> <%-- 로그인 한 경 우 --%>

<nav class="topFixBanner" style="background:transparent; display:flex; flez-wrap:wrap; justify-content:space-between; align-items:center;">
	<div class="banner_left" style="flex-grow:1; float:left; text-align:left;"><a href="mainpage.jsp"><img src="/web/resources/img/play/technology.png"  style="width:60px; height: auto; margin-left:50px;"></a></div>
	<div class="banner_middle" style="flex-grow:1; text-align:left;"></div>
		<span class="new_squad">
			<button id="new_squad" class="btn" style="margin:3px; background-color: #141414;">새 스쿼드</button>
		</span>
		<span class="my_squad">
			<button id="my_squad" onclick="location.href='play/mysquad.jsp'" class="btn" style="margin:3px; background-color: #141414;">내 스쿼드</button>
		</span>
		<span class="my_wallet">
			<button id="my_wallet" onclick="location.href='play/pay.jsp'" class="btn" style="margin:3px; background-color: #141414;">지갑</button>
		</span>
		
	<div class="banner_right" style="flex-grow:2; float:right; text-align:right;">	
		<span class="search">
			<input type="text" placeholder="" />
					<i class="fa-solid fa-magnifying-glass"></i>
		</span>

		<span class="my_page">
			<button class="btn" onclick="location.href='play/mypage.jsp'" style="margin:3px; background-color: #141414;">마이페이지</button>
		</span>
		<span class="logout">
				<button id="logout" type="button" class="btn" style="margin:3px; background-color: #141414;">로그아웃</button>
		</span>
	</div>
</nav>
</c:otherwise>      
</c:choose>    


<div class ="testContents">

</div>



</body>
</html>
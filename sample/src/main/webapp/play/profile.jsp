<%@page import="com.bit.web.play.vo.membersBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>play</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"   
    integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/play/index.css">
 	<!-- Bootstrap Core CSS -->
<link href="/web/resources/boardFront/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/login.css" rel="stylesheet"> -->
<link href="/web/resources/boardFront/css/clean-blog.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>


</head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	
	
<!-- <script> 
//파일 업로드
function fn_submit(){
        
        var form = new FormData();
        form.append("profile_img", $("#profile_img")[0].files[0] );
        
         jQuery.ajax({
             url : "/web/result"
           , type : "POST"
           , processData : false
           , contentType : false
           , data : form
           , success:function(response) {
               alert("성공하였습니다.");
               console.log(response);
           }
           ,error: function (jqXHR) 
           { 
               alert(jqXHR.responseText); 
           }
       });
}
</script>	-->
	

<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#profile_img").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>
	
<script>
		
		//포로필 업데이트
   $(function(){
	 $("a#sendButton").click(function(){
		 if($("input[name='nickname']").val().length!=0
			 ||$("input#genre1").val().length!=0
			 ||$("input#genre2").val().length!=0
			 ||$("input#tel").val().length!=0
			 ||$("input#email").val().length!=0
			 ||$("input#aboutme").val().length!=0
		
			 
		 ){
			return false;
		 
// 		{if($("[type='password']").val().length==0|| $("textarea").val().length==0){
// 			 alert('password or textarea Check!');
// 			 $("[type='password']").val('');
// 			 $("textarea").val('');
// 			 return false;
		 }
		 $("form").submit();
		 
	 });
 });		 
	
</script>




<body>

    <form name="profileUpdate" method="post">
<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->
    
    
<%--     <input type="hidden" name="id" value="${user_id}"/> --%>
    <main >
        <div class="profile1"  align="center" >
            <img id="img" src="${profile_img}" style="max-width: 12%; height: auto; margin-top:70px; background-color: #141414;"/>
            
            <div>
<!--             <div class="card"></div> -->
         		<label for="profile_img"></label> 
                <input type="file" name="profile_img" id="profile_img" size="50"/>
                
			</div>
			<a id="btn_submit" class="btn btn-sm btn-info btn-block" style="font-size: 1.2rem; width:300px; height: 30px;"
			onclick="javascript:fn_submit()">사진 업데이트</a>
			<div>

</div>
			
		</div>

	</main>

    <section>
    	<div class="profile" style="font-style: white; border:1; border-color=white">

		<p>
		<br>
		
    	<div class="form-group" align="center">
            <input type="text" value="${nickname}" style="background-color: #141414; margin-top:10px; width:300px; height: 50px"  
          	 id="nickname" name="nickname"   />
		</div>
		

		
    	<div class="form-group" align="center">
            <input type="text" value="${tel}" style="background-color: #141414; margin-top:10px; width:300px; height: 50px" 
            name="tel" id="tel" placeholder="  휴대전화"/>
		</div>
		
        <div class="form-group" align="center">
            <input type="email" value="${email}" style="background-color: #141414; margin-top:10px; width:300px; height: 50px" 
            name="email" id="email" placeholder="  이메일"/>
		</div>
		
		
		<div class="form-group" align="center" style="font-style: white;">
		<select  id="genre1"  name="genre1"
				style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
           		<option value="${genre1}" style="font-style: white;"/>
           		<option value="롤">리그오브레전드</option>
           		<option value="배그">배틀그라운드</option>
           		<option value="카트">카트라이더</option>
           		<option value="옵치">오버워치</option>
    	</select>
		</div>		
		
		<div class="form-group" align="center">
		<select  id="genre2"  name="genre2"
				style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
           		<option value="${genre2}" style="font-color: white;"/>
           		<option value="롤">리그오브레전드</option>
           		<option value="배그">배틀그라운드</option>
           		<option value="카트">카트라이더</option>
           		<option value="옵치">오버워치</option>
    	</select>
		</div>		
				
									
    	<div class="form-group" align="center">
            <input type="password"  style="background-color: #141414; margin-top:10px; width:300px; height: 50px" 
            id="password1" name="password1" placeholder="  비밀번호"/>
		</div>		
        <div class="content-list" align="center">
            <input type="password"  style="background-color: #141414; margin-top:10px; width:300px; height: 50px" 
            id="password2" name="password2" placeholder="  비밀번호 변경"/>
            <input type="hidden" name="password" id="password" class="form-control" />
		</div>
		
		
		
		
    	<div class="form-group" align="center" >
    	
    		
    		<a id="sendButton" href="#" class="btn btn-sm btn-info btn-block" style="font-size: 1.2rem; width:300px; height: 30px">확인</a>
		</div>		
	</div>
	   
</section>
</form> 

</body>
</html>
<%@page import="com.bit.web.play.vo.membersBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/header/default.jsp"></jsp:include>
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
    $(document).ready(function () {
        $("#profile_img").on("change", handleImgFileSelect);

        //포로필 업데이트
        $("#sendButton").click(function () {
            if ($("input[name='nickname']").val().length != 0
                || $("input#genre1").val().length != 0
                || $("input#genre2").val().length != 0
                || $("input#tel").val().length != 0
                || $("input#email").val().length != 0
                || $("input#aboutme").val().length != 0
            ) {
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

    function handleImgFileSelect(e) {
        let files = e.target.files;
        let filesArr = Array.prototype.slice.call(files);

        let reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

        filesArr.forEach(function (f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            let reader = new FileReader();
            reader.onload = function (e) {
                $("#img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>

</head>
<body>

<form name="profileUpdate" method="post">
    <!--header  -->
    <jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->


    <%--     <input type="hidden" name="id" value="${user_id}"/> --%>
    <main>
        <div class="profile1" align="center">
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
                       id="nickname" name="nickname"/>
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
                <select id="genre1" name="genre1"
                        style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
                    <option value="${genre1}" style="font-style: white;"/>
                    <option value="롤">리그오브레전드</option>
                    <option value="배그">배틀그라운드</option>
                    <option value="카트">카트라이더</option>
                    <option value="옵치">오버워치</option>
                </select>
            </div>

            <div class="form-group" align="center">
                <select id="genre2" name="genre2"
                        style="background-color: #141414; margin-top: 10px; width: 300px; height: 50px; font-style: white;vertical-align: middle; font-size: 0.4cm;">
                    <option value="${genre2}" style="font-color: white;"/>
                    <option value="롤">리그오브레전드</option>
                    <option value="배그">배틀그라운드</option>
                    <option value="카트">카트라이더</option>
                    <option value="옵치">오버워치</option>
                </select>
            </div>


            <div class="form-group" align="center">
                <input type="password" style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       id="password1" name="password1" placeholder="  비밀번호"/>
            </div>
            <div class="content-list" align="center">
                <input type="password" style="background-color: #141414; margin-top:10px; width:300px; height: 50px"
                       id="password2" name="password2" placeholder="  비밀번호 변경"/>
                <input type="hidden" name="password" id="password" class="form-control"/>
            </div>


            <div class="form-group" align="center">


                <a id="sendButton" href="#" class="btn btn-sm btn-info btn-block" style="font-size: 1.2rem; width:300px; height: 30px">확인</a>
            </div>
        </div>

    </section>
</form>

</body>
</html>
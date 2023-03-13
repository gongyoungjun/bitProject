<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css"> --%>
<style>
.skin-4 .num-in {
	float: left;
	width: 80px;
	padding: 8px 0;
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
}

.skin-4 .in-num {
	width: 47px;
	float: left;
	height: 36px;
	font-size: 30px;
	text-align: center;
	outline: none;
}

.skin-4 .all-span {
	position: relative;
	float: right;
	width: 23px;
	height: 36px;
	border-left: 1px solid #000;
}

.skin-4 .all-span span {
	float: left;
	width: 100%;
	height: 18px;
	position: relative;
	cursor: pointer;
}

.skin-4 .all-span span:before {
	content: '';
	position: absolute;
	left: 50%;
	margin-left: -5px;
}

.skin-4 span.minus:before {
	top: 3px;
	border-top: 5px solid #000;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
}

.skin-4 span.minus.dis:before {
	opacity: 0.5;
}

.skin-4 span.plus:before {
	bottom: 3px;
	border-bottom: 5px solid #000;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	}
</style>
<script>
$(function(){
	/* form submit 코드 */	
	$("button#squadInsert").click(function(){
		
		if($("input#gamegenre_no").val().length == 0){
			alert("게임을 선택하세요");
		}
		else if($("input#title").val().length == 0){
			alert("제목을 입력하세요");
		}
		else if($("input#reservedate").val().length == 0){
			alert("시작시간을 선택하세요");
		}
		else if($("input#payedstate").is(":checked") == true && $("input#price").val() < 5 ){
			alert('최소금액을 확인하거나 무료로 전환하세요');
			
		}
		/* else if($("input#thumbnail_url_saved").val().length == 0){
			alert('대표 영상 URL을 입력하거나 파일을 업로드하세요');
		} */
		else if($("textarea#contents").val().length < 10){
			alert('10자 이상 설명을 적어주세요');
		}
		else{
			
			$("form#squadBoardInsert").submit();
		}
		
		return false;
	});
	
	$(document).ready(function() {
		/* 최대 모집인원 선택 코드 */
		  $('.num-in span').click(function () {
		      var $input = $(this).parents('.num-block').find('input.in-num');
		    if($(this).hasClass('minus')) {
		      var count = parseFloat($input.val()) - 1;
		      count = count < 1 ? 1 : count;
		      if (count < 2) {
		        $(this).addClass('dis');
		      }
		     
		      else {
		        $(this).removeClass('dis');
		      }
		      $input.val(count);
		    }
		    
		    else {
		      var count = parseFloat($input.val()) + 1
		      if (count > 1) {
		        $(this).parents('.num-block').find(('.minus')).removeClass('dis');
		      }
		      if(count <= 20){
		    	  $input.val(count);
		      }
		      else{
		    	  $(this).parents('.num-block').find(('.plus')).addClass('dis');
		      }
		    }
		    
		    $input.change();
		    return false;
		  });
		  	  
		  
		});
})
</script>
</head>
<body>

<!--
게임장르번호    게임 선택 -
제목 -
내용 -

최대인원 -
모집설정(선착순 수락대기) -

예약일 -
플레이시간 -

참가비 -
금액설정(0,1) -
썸네일 - 
홍보파일 -
해시태그 -
 -->
<form action="/web/squadBoardInsert" name="squadBoardInsert" id="squadBoardInsert" method="post" enctype="multipart/form-data">


<!-- 게임 선택 -->
<input type="text" id="gamegenre_no" name="gamegenre_no" placeholder="게임 선택"> <br>

<!-- 스쿼드 제목 -->
<input type="text" id="title" name="title" placeholder="스쿼드 이름(제목)"> <br>


<!-- 모집 인원 -->
<div class="num-block skin-4">
<label for="num-in">인원 선택</label>
  <div class="num-in">
    <input id="user_maxcnt" name="user_maxcnt" type="text" class="in-num" value="1">
    <div class="all-span">
      <span class="plus"></span>
      <span class="minus dis"></span>
    </div>
  </div>
</div>
<br>
<br>
<div>

<!-- 선착순 / 수락대기 -->
	<select id="recruitoption" name="recruitoption">
        <option value="0">선착순</option>
        <option value="1">수락대기</option>
    </select>
</div> <br>


<!-- 시작 날짜 및 시간 -->
<div>
<label for="reservedate">시작시간</label> <br>
<input type="datetime-local" id="reservedate_input" name="reservedate_input">
</div> <br>


<!-- 예상 플레이시간 -->
<div>
<label for="playtime_input">플레이시간</label> <br>
30분<input type="range" min="30" step="30" value="30" max="360" id="playtime_input" oninput="playTimeFunction()" >6시간<br>
<span id="playtime_show">30분</span>
<input type="number" id="playtime" name="playtime" value="30" style="display:none">
</div> <br>
<script>
    function playTimeFunction(){
        let val = document.getElementById('playtime_input').value;        
        if (val == 30){
        	console.log("30분");
        	$("#playtime_show").text("30분");
        }
        else if (val % 60 == 0){
        	console.log((val/60)+"시간")
        	$("#playtime_show").text((val/60)+"시간");
        }
        else{
        	console.log(parseInt(val/60)+"시간 30분");
        	$("#playtime_show").text(parseInt(val/60)+"시간 30분");
        }
        console.log(playtime);
        $("input#playtime").val(val);
        console.log($("input#playtime").val());
       /*  $("#playtime_output").text(playtime_output); */
    }
    $(function(){
    	/* 예상플레이시간 설정시 화면에 표시 시켜주는 코드 */
    	var no = $("span#playtime_input").val();
    	$("input#playtime").val(no);
    })
</script>


<!-- 유료, 무료 / 참가비 -->
<div>
<label for="price">참가비</label> <br>
<input type="number" min="0" step="5" max="1000" placeholder="0" value="0" id="price_input" name="price_input" disabled>
<input type="hidden" id="price" name="price">
</div> <br>
<input type="checkbox" id="payedstate" name="payedstate"> 유료 <br>
<script>
document.getElementById('payedstate').onchange = function(){
	if($("input#payedstate").is(":checked") == true){
		console.log('유료');
		$("input#price_input").val('');
		$("input#price_input").prop('disabled', false);
	}
	else if($("input#payedstate").is(":checked") == false){
		console.log('무료');
		$("input#price_input").val('');
		$("input#price_input").prop('disabled', true);
	}
};
$(function(){
	var price = $("input#price_input").val();
	$("input#price").val(price);
});

</script>


<!-- 썸네일 -->
<h4>대표영상 / 썸네일</h4>
<button type="button" id="thumbnail_file">파일</button><br>
<input type="file" id="thumbnail_file" name="thumbnail_file" style="display:none"><br>
<button type="button" id="thumbnail_url">URL</button><br>
<!-- <span>입력한 주소</span> -->
<div id="modal" class="modal" style="display:none; position:fixed; z-index:1; left:0; top:0; width:100%; height:100%; overflow:auto; background-color:rgba(0,0,0,0.3);">
	<div id="modal_content" class="modal" style="background-color:#fefefe; margin:15%auto; padding:20px; border:1px solid #888; width:50%; text-align:center; box-shadow:2px 2px 2px 2px black, 0 0 25px grey;">
		<span>URL: <input type="text" id="thumbnail_url_input">
		<button type="button" id="url_input_btn">입력</button>
		<button type="button" id="modal_close">닫기</button> </span>
	</div>
</div>
<input type="hidden" id="filename" name="filename">
<script>
/* 버튼 - 파일업로드 연동코드 */
$("button#thumbnail_file").click(function(){
	$("input#thumbnail_file").click();
});

/* 모달창 코드 */
var btn = document.getElementById("thumbnail_url");
var modal = document.getElementById('modal');
var close = document.getElementById('modal_close');
btn.onclick = function(){
	modal.style.display = "block";
}
close.onclick = function(){
	/* $("input#thumbnail_url_input").val(''); */
	modal.style.display = "none";
}
window.onclick = function(event){
	if (event.target == modal){
		$("input#thumbnail_url_input").val('');
		/* modal.style.display = "none"; */
		close.click();
	}
}

$("button#url_input_btn").click(function(){
	if ($("input#thumbnail_url_input").val().length==0){
		alert('url이 입력되지 않았습니다');
	}
	else{
		$("input#filename").val($("input#thumbnail_url_input").val());
		console.log($("input#filename").val());
		$("button#modal_close").click();
	}
});
</script>


<!-- 스쿼드 설명 글 -->
<div>
<span>스쿼드 설명<button type="button" id="tagsBtn">+태그</button> <input type="text" style="display:none" id="tags" name="tags" value="defaultTag"><br></span>
<span>
<textarea id="contents" name="contents" style="width:500px; height:300px; resize:none;">스쿼드 목적, 준비사항 등 스쿼드에 대해 자세히 설명해주세요</textarea>
</span>
<br>
<span id="inputlength"> </span><span>/500</span>
</div>
<script>
$("textarea#contents").focus(function(){
	$("textarea#contents").text("");
})
$("textarea#contents").blur(function(){
	$("textarea#contents").text("스쿼드 목적, 준비사항 등 스쿼드에 대해 자세히 설명해주세요");
})
$("textarea").keyup(function(){
		$("span#inputlength").text($(this).val().length);
		if(($(this).val().length)>500){
			alert('500글자 초과');
			$(this).val($(this).val().substring(0,500));
			$("span#inputlength").text(500);
			return false;
		}
	});
</script>

<!-- form.submit 버튼 -->
<button id="squadInsert" type="submit">스쿼드 등록!</button>
</form>
</body>
</html>
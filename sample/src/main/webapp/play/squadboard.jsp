<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SquadBoard</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">

</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
        
</script>



<body>


	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->

	<main>
		<div class="center"
			style="height: 300px; min-width: 400px; margin-left: 200px; margin-bottom: 100px">
			<h2>${squad.title}</h2>
			<img src="/web/resources/img/play/${squad.filename}"
				style="width: 250px; height: 200px; margin-top: 30px;" />
			
			<div class="text">
				<h3 style="margin-left: 1000px; margin-top: 10px">${squad.hostname}</h3>
				<input type="hidden" name="members_id" value="${squad.members_id}"/>
				<h3 style="margin-left: 1000px; margin-top: 10px">평점 0 / 5.0(댓글수)</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">스쿼드수 0</h3>
				<div class="buttons"style="margin-left: 1000px; margin-top: 10">
					<a class="button" href="profile.jsp">호스팅 정보</a>
				</div>
			</div>
			
			<div class="text">
				
				<h3 style="margin-left: 1000px; margin-top: 10px">시작시간 ${squad.reservedate}</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">예상진행시간 ${squad.playtime}분</h3>
				<h3 style="margin-left: 1000px; margin-top: 10px">신청 인원 ${squad.user_acceptcnt}명/${squad.user_maxcnt}명</h3>
				<div class="buttons" style="margin-left: 1000px; margin-top: 10">				

					<button class="btn" style="background-color: #141414;">
						<i class="fa-solid fa-edit"></i><span>수정</span>
					</button>
					<button class="btn" style="background-color: #141414;">
						<i class="fa-solid fa-times"></i><span>삭제</span>
					</button>
					<button class="btn" style="background-color: green;">
						<span>스쿼드 참가</span>
					</button>
				</div>
			</div>

			<!--             <div class= "text"> -->
			<!--             	<h1 style="margin-left: 400px; margin-top:0">별명*</h1> -->
			<!--             </div> -->
		</div>

	</main>

	<section>
		<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<h3>스쿼드 설명</h3>
			<h4>${squad.contents}</h4>
		</div>
		<div class="content-list" style="height: 300px; min-width: 1200px;">
			<h5>호스트의 다른 스쿼드</h5>
			<c:forEach var="i" items="${squadList}" varStatus="cnt">

				
					<div class="title">
						<a href="/web/squadBoardInfoSelect?no=1&hostid=blue&job=info">
						<img src="/web/resources/img/play/gamegenre/${i.gamegenre_game_img}" width="140" height="80" style="background-color: #141414;"/> 
							${i.title}
						</a>
					</div>
					
					<div class="board-meta" style="font-weight: 400; font-size: 1.2rem; color: #141414;">
						<p>
							<i class="glyphicon glyphicon-user"></i> ${i.gamegenre_name}
							<i class="glyphicon glyphicon-time"></i> ${i.reservedate}
							<i class="glyphicon glyphicon-eye-open"></i> ${i.squadstate_statename}
						</p>
					</div>
				

			</c:forEach>
			<div align="center"></div>
		</div>

		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h5>주로하는 게임</h5>
			<div class="slider">
				<a href="gamepage.jsp"> <img
					src="/web/resources/img/play/overwatch2.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="gamepage1.jsp"> <img
					src="/web/resources/img/play/lol.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="gamepage2.jsp"> <img
					src="/web/resources/img/play/battleground.jpg"
					style="width: 250px; height: 200px;" />
				</a> <a href="gamepage3.jsp"> <img
					src="/web/resources/img/play/lostark.jpg"
					style="width: 250px; height: 200px;" />
				</a>
			</div>
		</div>
		
		<div class="contents-list" style="height: 200px; min-width: 1200px;">
			<h5>게스트 후기</h5>
			<div class="list_cmt">
				<div class="cmt_head"></div>
				<div class="cmt_body">
					<c:forEach var="i" items="${reviewList}" varStatus="cnt">
						<img src="/web/resources/img/play/host.jpg" class="rounded-circle"
							alt="host" width="50" height="30">
						<span class="info_append"> <span class="txt_name">${i.name}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${i.score}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${i.regdate}</span>
							<span class="txt_bar">|</span> <span class="txt_time">좋아요 버튼 / 좋아요수</span>
						</span>
						<p class="txt_desc">${i.contents} <a href="#none">신고</a></p>
						
					</c:forEach>
				</div>
				<div class="cmt_foot">
				</div>
			</div>
		</div>
		
		
	</section>
</body>
</html>
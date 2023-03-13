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
<title>mypage</title>
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
        const next = document.querySelectorAll('.next');
        const prev = document.querySelectorAll('.prev');
        const slider = document.querySelectorAll('.slider')

        for(let i =0;i<slider.length;i++){
            getMovies(slider[i],i+1);
            makeSlider(slider[i],prev[i],next[i]);
        }
        function makeSlider(element,prev,next){
            next.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                element.scrollBy(offsetX,0)
            })
            prev.addEventListener('click',()=>{
                const offsetX = element.offsetWidth;
                element.scrollBy(-offsetX,0)
            })
        }
        function getMovies(element,page){
            fetch(`https://yts.mx/api/v2/list_movies.json?limit=20&sort_by=rating&page=${page}`)
                .then(data=>data.json())
                .then(data=>{
                    const movies = data.data.movies;
                    movies.forEach(movie=>{
                        const div = document.createElement('div');
                        div.className='item';
                        div.innerHTML = `<img src="${movie.medium_cover_image}" alt="">`;
                        element.appendChild(div);
                    })
                })
        }
    </script>



<body>


	<!--header  -->
	<jsp:include page="testHeader.jsp"></jsp:include>
	<!--header  -->

	<main>
		<div class="center"
			style="height: 400px; min-width: 400px; margin-left: 200px; margin-bottom: 100px">
			<img src="/web/resources/img/play/mypage.png"
				style="width: 250px; height: 200px; margin-top: 30px;" />
			<!-- <span class="rate">����</span>-->
			<div class="text">
				<h3 style="margin-left: 450px; margin-top: 30">/ 5.0</h3>
				<h3 style="margin-left: 450px; margin-top: 30">0 Hosted</h3>
				<h3 style="margin-left: 450px; margin-top: 30">0 Followers</h3>

			</div>

			<!--             <div class= "text"> -->
			<!--             	<h1 style="margin-left: 400px; margin-top:0">����*</h1> -->
			<!--             </div> -->

			<!--<div class="buttons">
				<span class="button"> <a href="profile.jsp"
					style="font-size: 1.2rem">������ ����</a>
				</span> <br> <span class="button"> <a href="#"
					style="font-size: 1.2rem">�ȷο�</a>
				</span> <br> <span class="button"> <a href="#"
					style="font-size: 1.2rem">������ ����</a>
				</span>

			</div>-->
			<div class="buttons">
				<!--<button class="btn" style="background-color: #141414"><a href="profile.jsp"></a>
					<i class="fa-sharp fa-solid fa-gear"></i><span>������ ����</span>
					
				</button>-->
				<a class="button" href="profile.jsp">������ ����</a>

				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-person"></i><span>�ȷο�</span>
				</button>
				<button class="btn" style="background-color: #141414;">
					<i class="fa-sharp fa-solid fa-gamepad"></i><span>������ ����</span>
				</button>
			</div>
		</div>

		<!-- 		div class="profile2" style="height: 500px; min-width: 600px;"> -->
		<!--             <img src="/web/resources/img/play/basic.jpg" style="max-width: 15%; height: auto; margin-right: 300px; margin-top:70px;"/> -->
		<!-- 		</div> -->
	</main>

	<section>
		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h5>���� ������ ������</h5>
			<div class="slider">
				<img src="/web/resources/img/play/squad.jpg"
					style="width: 250px; height: 200px;" /> <img
					src="/web/resources/img/play/squad2.jpg"
					style="width: 250px; height: 200px;" />
			</div>

		</div>

		<div class="content-list" style="height: 200px; min-width: 1200px;">
			<h5>�ַ��ϴ� ����</h5>
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
			<h5>�Խ�Ʈ �ı�</h5>
			<div class="list_cmt">
				<div class="cmt_head"></div>
				<div class="cmt_body">
					<c:forEach var="i" items="${reviewList}" varStatus="cnt">
						<img src="/web/resources/img/play/host.jpg" class="rounded-circle"
							alt="host" width="50" height="30">
						<span class="info_append"> <span class="txt_name">${i.name}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${i.score}</span>
							<span class="txt_bar">|</span> <span class="txt_time">${i.regdate}</span>
						</span>
						<p class="txt_desc">${i.contents}</p>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<div class="left" style="margin-bottom: 200px; margin-left:200px">
			<div class="row">
			<h5>�Խ�Ʈ �ı�</h5>
			<c:forEach var="i" items="${reviewList}" varStatus="cnt">
				<a href="/web/squadBoardInfoSelect?no=1&hostid=blue&job=info" class="list-group-item">
					<div class="title">
						<!-- <img src="/web/resources/img/play/profile/${i.profile_img}" width="140" height="80" /> --> 
							${i.name}
					</div>
					
				</a>	
				<div class="board-meta" style="font-weight: 400; font-size: 1.2rem; color: #404040">
					<p>
						<i class="glyphicon glyphicon-time"></i> ${i.regdate} |
						<i class="glyphicon glyphicon-user"></i> ${i.score}�� |
						<i class="glyphicon glyphicon-eye-open"></i> ${i.contents}
					</p>
				</div>
			</c:forEach>
			</div>			
		</div>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>TogetherSquad</title>
<link rel="stylesheet"
	href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/play/index.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<body>

<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->


	<!-- <nav>
		<div class="left">

			<div class="logo">
				<a href="#"><img src="/webapp/sample2/img/logo.jpg" alt=""></a>
			</div>

			<div class="buttons">
				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-plus"></i><span>스쿼드 만들기</span>
				</button>
				<button class="btn" onclick="location.href='mysquad.jsp'"style="background-color: #141414;">
					<i class="fa-sharp fa-solid fa-inbox"></i><span>내 스쿼드</span>
				</button>
				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-wallet"></i><span>내 지갑</span>
				</button>

			</div>
			

		</div>

		<div class="right">
			 <div class="mobile-menu"></div>
			<ul class="menu-list">
				<li><a href="#">마이페이지</a></li>
				<li><a href="login.jsp">로그아웃</a></li>
			</ul>

			<div class="buttons1">
				<button class="btn" style="background-color: #141414;">
					<i class="fa-solid fa-pager"></i><span>마이페이지</span>
				</button>
				<button class="btn" onclick="location.href='login.jsp'" style="background-color: #141414;">
					<i class="fa-sharp fa-solid fa-right-from-bracket"></i><span>로그아웃</span>
				</button>

			</div>


			<div class="icon search">
				<div class="search-bar">
					<input type="text" placeholder="" />
					<i class="fa-solid fa-magnifying-glass"></i> 
				
				</div>
			</div>
		</div>
	</nav> -->
	<main>
		<div class="video">
			<video src="./video/doctor.mp4" autoplay muted loop></video>
		</div>
		<div class="description">
			<p></p>

		</div>

	</main>
	<section>
		<div class="content-list">
			<h3>인기 호스트</h3>
			
			<div class="prev">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center">
					<img src="/web/resources/img/play/host.jpg" class="rounded-circle" alt="host" width="200" height="100">
					<p>호스트명</p>
					<img src="/web/resources/img/play/host.jpg" class="rounded-circle" alt="host" width="200" height="100">
					<p>호스트명</p>
					<img src="/web/resources/img/play/host.jpg" class="rounded-circle" alt="host" width="200" height="100">
					<p>호스트명</p>
					<img src="/web/resources/img/play/host.jpg" class="rounded-circle" alt="host" width="200" height="100">
					<p>호스트명</p>
			</div>
			<div class="next">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		<div class="content-list">
			<h3>모집 중인 스쿼드</h3>
			
			<div class="prev">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			<div class="slider" align="center">
				<img src="/web/resources/img/play/squad.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/squad2.jpg" style="max-width: 15%; height: auto; "/>
			</div>
			<div class="next">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		
		<div class="content-list">
			<h3>인기 게임</h3>
			
			<!--  <div class="populargame" style="height: 500px; min-width: 400px;" align="center">
            	<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/battleground.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            </div>-->            
			<div class="prev">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center">
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/battleground.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/battleground.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/battleground.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; margin-top:70px;"/>


			</div>
			<div class="next">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
	</section>

	
	
	
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
            fetch(`https://yts.mx/api/v2/list_movies.json?limit=1&sort_by=rating&page=${page}`)
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


</body>
</html>
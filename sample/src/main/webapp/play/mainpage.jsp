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

</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 

<script>
    var index = 0;   //이미지에 접근하는 인덱스
    window.onload = function(){
        slideShow();
    }
    
    function slideShow() {
    var i;
    var x = document.getElementsByClassName("slide1");  //slide1에 대한 dom 참조
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";   //처음에 전부 display를 none으로 한다.
    }
    index++;
    if (index > x.length) {
        index = 1;  //인덱스가 초과되면 1로 변경
    }   
    x[index-1].style.display = "block";  //해당 인덱스는 block으로
    setTimeout(slideShow, 3000);   //함수를 3초마다 호출
 
}
</script>



<body>

<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->




	<main >
	<div align="center">
	
  <img class="slide1" src="/web/resources/img/play/lol.jpg"  style="max-width: auto; height: 400px; ">
  <img class="slide1" src="/web/resources/img/play/pubg.jpg" style="max-width: auto; height: 400px; ">
  <img class="slide1" src="/web/resources/img/play/lostark.jpg" style="max-width: auto; height: 400px; ">
  <img class="slide1" src="/web/resources/img/play/overwatch2.jpg" style="max-width: auto; height: 400px; ">
  
  
	</div>

	</main>
	
	<section>
		<div class="content-list">
			<h1>인기 스쿼드</h1>
       
			<div class="prev">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center">
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/pubg.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/pubg.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>

			</div>
			<div class="next">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		
		
		<div class="content-list">
			<h1>모집 중인 스쿼드</h1>
       
			<div class="prev">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center">
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/pubg.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/pubg.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>


			</div>
			<div class="next">
				<i class="fa-solid fa-angle-right"></i>
			</div>
		</div>
		
 		<div class="content-list">
			<h1>인기 게임</h1>
       
			<div class="prev">
				<i class="fa-solid fa-angle-right prev-arrow"></i>
			</div>
			
			<div class="slider" align="center">
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/battleground.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>
				<img src="/web/resources/img/play/overwatch2.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lol.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/battleground.jpg" style="max-width: 15%; height: auto; "/>
            	<img src="/web/resources/img/play/lostark.jpg" style="max-width: 15%; height: auto; "/>


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
            fetch(`https://yts.mx/api/v2/list_movies.json?limit=10&sort_by=rating&page=${page}`)
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
<footer>
	<jsp:include page="footer.jsp"></jsp:include>
</footer>
</html>
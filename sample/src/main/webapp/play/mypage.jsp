<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
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
 
</head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
        <div class="profile1" style="height: 500px; min-width: 400px;" align="center">
            <img src="${profile_img}" style="max-width: 15%; height: auto; margin-top:70px;"/>

<!--             <div class= "text"> -->
<!--             	<h1 style="margin-left: 400px; margin-top:0">별명*</h1> -->           
<!--             </div> -->
        	
            <div class="button">
                <span class="button">
                <a href="profile.jsp" style="font-size: 1.2rem">프로필 수정</a>
				</span>
			</div>
		</div>
		
<!-- 		<div class="profile2" style="height: 500px; min-width: 600px;"> -->
<!--             <img src="/web/resources/img/play/basic.jpg" style="max-width: 15%; height: auto; margin-right: 300px; margin-top:70px;"/> -->
<!-- 		</div> -->
		
	</main>

    <section>
        <div class="content-list" style="height: 200px; min-width: 1200px;">
            <h1 style="margin-left: 300px;">예약 가능한 스쿼드</h1>
            <div class="slider">
            </div>

        </div>
        <div class="content-list" style="height: 200px; min-width: 1200px;">
            <h1 style="margin-left: 300px;">게스트 후기</h1>
            <div class="slider">
            </div>

        </div>
        <div class="content-list" style="height: 200px; min-width: 1200px;">
            <h1 style="margin-left: 300px;">주로하는 게임</h1>
            <div class="slider">
            </div>

        </div>
    </section>



</body>
</html>
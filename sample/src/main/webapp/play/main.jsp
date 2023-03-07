<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>flix</title>
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
        <div class="video">
            <video src="./video/doctor.mp4" autoplay muted loop></video>
        </div>
        <div class="description">
            <h1>Doctor Strange 2</h1>
            <h3>���� ���ο� Ʈ���Ϸ� ����</h3>
            <p>
                5��, ������ ��谡 �������� ���� ��Ʈ�������� �´�
                �� ���踦 ����� ����� ��Ƽ���� ������ ����!
                [���� ��Ʈ������: ��ȥ���� ��Ƽ����] Ƽ�� ������ ����!
            </p>
            <div class="buttons">
                <button class="play"><i class="fa-solid fa-play"></i><span>���</span></button>
                <button class="detail"><i class="fa-solid fa-circle-info"></i>�� ����</button>
            </div>
        </div>
        <div class="age-info">
            <i class="fa-solid fa-rotate-right"></i>
            <div class="age">15+</div>
        </div>
    </main>
    <section>
        <div class="content-list">
            <h1>�ѱ��� ���� ������</h1>
            <div class="slider">
            </div>
            <div class="prev"><i class="fa-solid fa-angle-right prev-arrow"></i></div>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
        <div class="content-list">
            <h1>���� �ߴ� ������</h1>
            <div class="slider">
            </div>
            <div class="prev"><i class="fa-solid fa-angle-right prev-arrow"></i></div>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
        <div class="content-list">
            <h1>���� �ѱ��� TOP 10 ������</h1>
            <div class="slider">
            </div>
            <div class="prev"><i class="fa-solid fa-angle-right prev-arrow"></i></div>
            <div class="next"><i class="fa-solid fa-angle-right"></i></div>
        </div>
    </section>
 

   


</body>
</html>
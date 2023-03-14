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

<script>
$(function(){
	 $("span#search a").click(function(){
		if($("#query").val().length==0|| $("#data").val().length==0){
			alert('query or data Check!');
			$("select#query").prop("selectedIndex",0);
			$("input#data").val('');
			return false;
		}
		$("form").submit();
	 }) 
 });

</script>



<body>

<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->
    
	<!--검색창 -->

    <form method="get" action="/web/searchInfoSelect">
        <div class="search" style="height: 300px; min-width: 400px; margin-top: 300px" align="center">
           <td> 
            <select id="query" name="query" style="height: 60px; width:100px; background-color: #141414; font-style: white;vertical-align: middle; font-size: 0.4cm;">
            	<option value="all">전체</option>
            	<option value="host">호스트</option>
            	<option value="category">카테고리</option>
            </select> 
            <input type="text" class="button" id="data" name="data" style="height: 60px; width:400px; background-color: #141414; font-style: white;  font-size: 0.4cm;">
			<button  class="btn btn-info search-btn" style="height: 60px; width:auto; background-color: #141414; font-style: white;
																		border: 1px; border-color: white">
			검색</button>
			</td>
		</div>
	</form>


    <table style="margin-left:300px">
    
        <thead class="content-list" style="height: 100px; min-width: 1200px;">
        	<h1 style="margin-left: 300px;">호스트</h1>
           <tr> 
			<th scope="col" class="fir">NO.</th>
			<th scope="col">IMG</th>
			<th scope="col">TITLE</th>
			<th scope="col">WRITER</th>
			<th scope="col">REGDATE</th>
			<th scope="col">HIT</th>		

			</tr>
        </thead>
        
		<tbody>
		
		<td>
			${gamegenre_no}
		</td>
		<td>
			${members_id}
		</td>
		<td>
			${hostname}
		</td>
		<td>
			${title}
		</td>
		<td>
			${contents} 
		</td>
		<td>
			${playtime}
		</td>										
		</tbody>




</body>
</html>
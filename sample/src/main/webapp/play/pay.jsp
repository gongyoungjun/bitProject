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
 

	
	
	<div style=" margin-top:150px; margin-left:400px; font-size: 1cm;">
	코인 충전하기<br>
	<a style="font-size: 0.3cm;">
	코인은 유료 스쿼드 신청에 필요한 PR1 내 재화입니다.
	</a>
	</div>

<table border= "1" bordercolor="white" width ="1200" height="300" style="margin-left:350px; border-left: none; border-right:none; border-bottom:none" >
    <tr align ="center">  
    
		<!--로그인한 계정 이미지 -->
		
		<td style="color:white; border: none; width: 150px; height:150px;">
			<img src="/web/resources/img/play/basicProfile.jpg" style="max-width: 80%; height: auto; margin-top:15px; margin-left:0px;"/>
		</td>
		
		<!-- 세로줄 -->
		<td rowspan=12 style="color:white; border-top: none; border-right:none; border-bottom: none; width:5px;">
<!-- 			<a style="color:white; border-top: none; border-right:none; border-bottom: none; "></a> -->
		</td>
		
		<!-- 양쪽 화살표 -->
		<td rowspan=5 style="border:none;">
			<img align="left" src="/web/resources/img/play/left.jpg" style="max-width: 40px;margin-left:40px;"/>
		</td>
		
		<td rowspan=5 style="border:none;">
			<img align="right" src="/web/resources/img/play/left.jpg" style="max-width: 40px;margin-right:40px;"/>
		</td>
		
		
<!-- 		<td rowspan=5 style="color:white; border-top: none; border-right:none; border-bottom: none; "> -->
<!-- 			<a style="border:1; width:100px; height:1200px"></a> -->
<!-- 		</td> -->
		
    </tr>
		<!--의미없는 칸 만든거 -->
    <tr>
		<td style="border:none; width:50px; height:50px;"></td>
    </tr>
    
    <tr align="center">
		<td style="border:none; font-size: 0.5cm">충전 계정 이메일</td>
    </tr>
    
    <!--의미없는 칸 만든거 -->
    <tr>
		<td style="border:none; height:15px;"></td>
    </tr>
    
		<!--내가 가입한 이메일 -->
    <tr align="center">
		<td style="border:none; width:150px;  font-size: 0.4cm;">
			bitcom@naver.com
<!-- <a style="border:1 width:0px; height:1200px"></a> -->
		</td>
	
	<!--의미없는 칸 만든거 -->
   	 <tr>
		<td style="border:none; height:8px;"></td>
    </tr>	
		

    	<!--가로줄 -->
    <tr>
		<td style="border-left: none; border-right:none; border-bottom: none; width:150px;"></td>
    </tr>
    
    <!--의미없는 칸 만든거 -->
    <tr>
		<td style="border:none; height:15px;"></td>
		
		<td colspan=2 style="color:white; width:1200px; border-left: none; border-right:none; border-bottom: none; ">
		</td>
    </tr>
    
    <tr>
		<td style="border:none; font-size: 0.5cm">충전 상품</td>
		
		<td style="border:none; font-size: 0.5cm">결제수단</td>
    </tr>

    <tr style="border:none; height: 250px">
		<td style="border:none; "></td>
		
		<!-- 결제 체크박스 -->
		<td style="border:none; font-size: 0.35cm;">
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> 전체 항목에 동의합니다. <br><br>
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> 결제를 진행하는 본인의 명의로 결제합니다. <br><br>
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> 이용약관 및 환불정책에 동의합니다. <br><br>
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> 결제대행사 결제정보 위탁에 동의합니다. <br><br>
		</td>
    </tr>
    
	<tr style="border:none;">
		<td style="border:none;"></td>
		
		<td align="center" colspan=4 style="border:none;">
			<a  href="#" style="font-size: 1.2rem">결제하기</a>
		</td>
	</tr>
	

</table>

</body>
</html>
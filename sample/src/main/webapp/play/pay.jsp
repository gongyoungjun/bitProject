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
	���� �����ϱ�<br>
	<a style="font-size: 0.3cm;">
	������ ���� ������ ��û�� �ʿ��� PR1 �� ��ȭ�Դϴ�.
	</a>
	</div>

<table border= "1" bordercolor="white" width ="1200" height="300" style="margin-left:350px; border-left: none; border-right:none; border-bottom:none" >
    <tr align ="center">  
    
		<!--�α����� ���� �̹��� -->
		
		<td style="color:white; border: none; width: 150px; height:150px;">
			<img src="/web/resources/img/play/basicProfile.jpg" style="max-width: 80%; height: auto; margin-top:15px; margin-left:0px;"/>
		</td>
		
		<!-- ������ -->
		<td rowspan=12 style="color:white; border-top: none; border-right:none; border-bottom: none; width:5px;">
<!-- 			<a style="color:white; border-top: none; border-right:none; border-bottom: none; "></a> -->
		</td>
		
		<!-- ���� ȭ��ǥ -->
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
		<!--�ǹ̾��� ĭ ����� -->
    <tr>
		<td style="border:none; width:50px; height:50px;"></td>
    </tr>
    
    <tr align="center">
		<td style="border:none; font-size: 0.5cm">���� ���� �̸���</td>
    </tr>
    
    <!--�ǹ̾��� ĭ ����� -->
    <tr>
		<td style="border:none; height:15px;"></td>
    </tr>
    
		<!--���� ������ �̸��� -->
    <tr align="center">
		<td style="border:none; width:150px;  font-size: 0.4cm;">
			bitcom@naver.com
<!-- <a style="border:1 width:0px; height:1200px"></a> -->
		</td>
	
	<!--�ǹ̾��� ĭ ����� -->
   	 <tr>
		<td style="border:none; height:8px;"></td>
    </tr>	
		

    	<!--������ -->
    <tr>
		<td style="border-left: none; border-right:none; border-bottom: none; width:150px;"></td>
    </tr>
    
    <!--�ǹ̾��� ĭ ����� -->
    <tr>
		<td style="border:none; height:15px;"></td>
		
		<td colspan=2 style="color:white; width:1200px; border-left: none; border-right:none; border-bottom: none; ">
		</td>
    </tr>
    
    <tr>
		<td style="border:none; font-size: 0.5cm">���� ��ǰ</td>
		
		<td style="border:none; font-size: 0.5cm">��������</td>
    </tr>

    <tr style="border:none; height: 250px">
		<td style="border:none; "></td>
		
		<!-- ���� üũ�ڽ� -->
		<td style="border:none; font-size: 0.35cm;">
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> ��ü �׸� �����մϴ�. <br><br>
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> ������ �����ϴ� ������ ���Ƿ� �����մϴ�. <br><br>
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> �̿��� �� ȯ����å�� �����մϴ�. <br><br>
			<input type="checkbox" style="margin-left:40px; transform : scale(1.4)"> ��������� �������� ��Ź�� �����մϴ�. <br><br>
		</td>
    </tr>
    
	<tr style="border:none;">
		<td style="border:none;"></td>
		
		<td align="center" colspan=4 style="border:none;">
			<a  href="#" style="font-size: 1.2rem">�����ϱ�</a>
		</td>
	</tr>
	

</table>

</body>
</html>
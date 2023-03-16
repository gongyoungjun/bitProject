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
	


<script>


</script>



<body>

<!--header  -->
<jsp:include page="testHeader.jsp"></jsp:include>
    <!--header  -->
    
	<!--검색창 -->

    <form method="get" name="search-form">
        <div class="search" style="height: 300px; min-width: 400px; margin-top: 300px" align="center">

           <td> 
           
            <select id="searchType" name="searchType" style="height: 60px; width:100px; background-color: #141414; font-style: white;vertical-align: middle; font-size: 0.4cm;">
            	<option value="all">전체</option>
            	<option value="host">호스트</option>
            	<option value="category">카테고리</option>
            </select> 
            <input type="text" class="button" id="data" name="data" style="height: 60px; width:400px; background-color: #141414; font-style: white;  font-size: 0.4cm;">
			<a href="/web/searchInfoSelect">
			<button   class="btn btn-info search-btn" style="height: 60px; width:auto; background-color: #141414; font-style: white;
																		border: 1px; border-color: white">
				검색</button></a>
			</td>
			

			
		</div>
	</form>
	
	<c:forEach  var="list" >
	
	<div class="board-meta" style="font-weight: 400; font-size: 1.2rem; color: #141414;">

 <p>
 <i class="glyphicon glyphicon-user"></i>${list.hostname} 
 <i class="glyphicon glyphicon-user"></i>${list.contents}
 <i class="glyphicon glyphicon-user"></i> ${list.playtime}
 <i class="glyphicon glyphicon-user"></i> ${list.regdate}
 </p>


</div>
</c:forEach>
</body>
</html>
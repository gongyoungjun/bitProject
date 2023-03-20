<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/web/resources/boardFront/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<!-- <link href="css/login.css" rel="stylesheet"> -->
<link href="/web/resources/boardFront/css/clean-blog.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='http://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="../resources/css/play/index.css">



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<head>
<title>게시물 목록</title>

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


</head>
<body>

	<jsp:include page="testHeader.jsp"></jsp:include>


	<div align="center" style="margin:200px; color:black; background:#141414;">
		<select id="query" name="query" >
		    <option value="all">전체</option>
	        <option value="host">호스트</option>
		    <option value="squard">스쿼드</option>

		</select>
		
		<input type="text" name="data" id="data" class="inputText" size="30" />
		
		<span class="button" id="search"><a href="#">검색</a></span>
		
	</div>
	
	<form action="listPageSearch" method="post">
		<table class="bbsWrite mgb35">
			<caption></caption>
			<colgroup>
				<col width="30" />
				<col width="100" />
				<col width="100" />
				<col width="100" />
				<col width="100" />
				<col width="100" />		
			</colgroup>
		</table><!-- formend -->
		</form>

		<table class="bbsList">
			<colgroup>
				<col width="120" />
				<col width="120" />
				<col width="120" />
				<col width="120" />
				<col width="120" />
					
			</colgroup>
			<thead>
			

			<tr>
				<th scope="col" class="fir">게임</th>   
				<th scope="col">닉네임</th>
				<th scope="col">컨텐츠</th>
				<th scope="col">게임시간</th>
				<th scope="col">시간</th>

			</tr>
			</thead>

	<tbody>

		<c:forEach items="${squadList}" var="list">
			<tr>
				<td>${squadList.gamegenre_no}</td>
				<td type="hidden">${squadList.members_id}</td>
				<td>${squadList.hostname}</td>
				<td>${squadList.contents}</td>
				<td>${squadList.playtime}</td>
				<td>${squadList.regdate}</td>		

			</tr>
		</c:forEach>
	</tbody>

</table>





	
	




</body>
</html>
<%@page import="good.GoodDTO"%>
<%@page import="good.GoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파라미터 받음
String idx = request.getParameter("idx");
//  DB연결
GoodDAO dao = new GoodDAO();
// DAO의 메서드 호출해서 레코드 1개를 DTO로 반환받음
GoodDTO dto = dao.selectView(idx);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script>
$(function () {
	$('#btn02').click(function() {
		// alert("좋아요를 1 증가 시킴")
		let params = {
				idx:$('#idx').val()
			};
		$.post(
			'PlusGood.jsp',
			params,
			function(rData) {
				console.log(rData);
				// 기존의 좋아요 갯수를 얻어온다.
				let getCnt = $('#getCnt').html();
				// 숫자형식으로 변경한 후 1을 더한다.
				let plusCnt = parseInt(getCnt)+1;
				// 변경된 갯수를 다시 적용한다.
				$('#getCnt').html(plusCnt);
			}
		);
	});
});
</script>
</head>
<body>
	<h2>좋아요 갯수 카운트</h2>
	<p>
		<a href="?idx=1">게시물1</a> &nbsp;
		<a href="?idx=138">게시물138</a>
	</p>
	됴아요 : <sapn id="getCnt"><%= dto.getGcnt() %></sapn>
	<img src="../images/good.gif" alt="조아여" id="btn02" width="100px" style="cursor:pointer;"/>
	
	<input type="hid-den" name="idx" id="idx" value="<%=idx %>" />
</body>
</html>
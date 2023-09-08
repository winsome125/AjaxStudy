<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
/* 
 <form> 하위 태그인 input, select, textarea에서는 this를 사용할 수 있다.
 따라서 this.form을 통해 DOM을 매개변수로 전달할 수 있다.
 */
function jsSubmit(f) {
	if(f.good.value=='') {
		alert('좋아요를 입력하세요');
		f.good.focus();
		return;
	}
	f.submit();
}
/*
 <form>의 하위태그가 아닌 a, img와 같은 태그에서는 this를 사용할 수 없으므로
 문서객체(document)를 통해 DOM을 얻어와야 한다.
 */
function imgSubmit() {
	var f2 = document.frm;
	if(f2.good.value=='') {
		alert('좋아요를 입력하세요(2)');
		f2.good.focus();
		return;
	}
	f2.submit()
}
 
 // jQuery의 출발점(Entry point)
$(function() {
	$('#btn01').click(function() {
		// alert("클릭해보시지ㅋㅋㅋ");
		$.post('formSubmit.jsp',
			{'good':$("#good").val()},
			function(responseData) {
					console.log("콜백데이터", responseData);
			}
		);
	});
});
</script>

	<form name="frm" method="post" action="formSubmit.jsp">
	
		<input type="text" name="good" id="good" value="조아여" />
		<input type="submit" value="전송(only HTML)" />
		<input type="button" value="전송(with Javascript)" onclick="jsSubmit(this.form);" />
		
		<a href="javascript:imgSubmit()" ><img src="../images/button.jpg" alt="나는 버튼이다!" /></a>
		
		<input type="button" value="전송(ajax-$.post())" id="btn01" />
		
	</form>
	
</body>
</html>

























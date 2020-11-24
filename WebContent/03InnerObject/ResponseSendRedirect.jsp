<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
//폼값받기
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");

//equalsIgnoreCase() : 대소문자 구분 없이 아이디/패스워드 일치 여부 확인
if (id.equalsIgnoreCase("kosmo") && pwd.equalsIgnoreCase("1234")) {
	//JS의 location.href와 동일하게 해당 경로로 이동하게 된다.
	response.sendRedirect("../common/Welcome.jsp");
}
else {
%>
	<script>
		alert("아이디와 패스워드가 일치하지 않습니다.");
		history.go(-1);
	</script>	
<%
	/*
	JS코드와 JSP코드가 동일한 실행 블럭내에 존재하는 경우,
	JSP코드가 우선순위가 높으므로 JS코드는 무시된다.
	즉, 이와 같은 경우는 JS코드는 실행되지 않고,
	아래 JSP코드만 실행되게 된다.
	경고창을 띄우기 위해서는 JSP코드로만 실행창을 만드는 것이 바람직
	*/
	//response.sendRedirect("./ResponseMain");
}
%>
</body>
</html>
<%@page import="Util.CookieUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일명 : CookieLoginProc.jsp --%>
<%
//클라이언트가 전송한 폼값을 받아온다.
String userid = request.getParameter("user_id");
String userpw = request.getParameter("user_pw");
/*  
	checkbox의 경우 여러 항목이 존재할 수 있으므로 getParameterValues()를통해 배열로 받는것이 기본이지만,
	항목이 하나만 있는 경우에는 아래와 같이 처리가능하다.
*/
String id_save = request.getParameter("id_save");

if("kosmo".equals(userid) && "1234".equals(userpw)){
	//JDBC연동없이 회원정보가 위와 같으면 로그인 성공..
	
	//로그인 성공시 회원 아이디를 쿠키로 생성한다.
	CookieUtil.makeCookie(request, response, "LoginId", "kosmo", 60*60*24);
	
	//아이디 저장하기 체크박스를..
	if(id_save == null){
		//체크해제하면 쿠키를 삭제한다.
		CookieUtil.makeCookie(request, response, "SaveId", "", 0);
	}
	else{
		//체크하면 쿠키를 생성한다.
		CookieUtil.makeCookie(request, response, "SaveId", "kosmo", 60*60*24);
		
	}
	response.sendRedirect("CookieLoginMain.jsp");
}
else{
	request.setAttribute("ERROR_MSG", "회원이 아닙니다.");
	request.getRequestDispatcher("CookieLoginMain.jsp").forward(request, response);
}
%>
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
	
</body>
</html>
<%@page import="model.MemberDTO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//폼값받기
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

//web.xml에 저장된 컨텍스트 초기화 파라미터 가져옴
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//DAO객체생성 및 DB연결
MemberDAO dao = new MemberDAO(drv, url);

/*
연습문제] 작성용교안에 있는 getMemberDTO()를 MemberDAO클래스에 작성한 후 
	아래코드를적당히수정하여 로그임 페이지에 회원의 이름이 출력되도록 구현하시오.
*/
//폼값으로 받은 아이디, 패스워드를 통해 로그인 처리 함수 호출
MemberDTO memberDTO = dao.getMemberDTO(id, pw);/*  
		해당 함수는 count()를 사용하므로 로그인시 사용한 아이디, 패스워드 외의 정보를 얻어올 수 없다.
	*/

if(memberDTO.getId()!=null){
	//로그인 성공시 세션영역에 아래 속성을 저장한다.
	session.setAttribute("USER_ID", memberDTO.getId());
	session.setAttribute("USER_PW", memberDTO.getPass());
	session.setAttribute("USER_NAME", memberDTO.getName());
	
	//로그인 페이지로 이동
	response.sendRedirect("Login.jsp");
}
else{
	//로그인 실패시 리퀘스트 영역에 속성을 저장 후 로그인 페이지로 포워드한다.
	request.setAttribute("ERROR_MSG", "넌 회원이 아니시군-_-;");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>
</body>

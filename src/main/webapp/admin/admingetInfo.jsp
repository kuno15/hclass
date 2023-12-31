<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="DB.MemberVO"%>
<%@ page import="DB.MemberDAO"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getadminInfo</title>
</head>
<body>
	<%
	// 정보수정 화면으로 가기전에
	// 아이디 기준으로 회원정보를 조회해서 다음 화면으로 전달

	try {
		String id = request.getParameter("idx");

		MemberVO vo = new MemberVO();
		MemberDAO dao = new MemberDAO();

		vo = dao.admingetInfo(id);

		request.setAttribute("id", id);
		request.setAttribute("pw", vo.getPw());
		request.setAttribute("email", vo.getEmail());
		request.setAttribute("name", vo.getName());
		request.setAttribute("phone", vo.getPhone());
		request.setAttribute("zipcode", vo.getZipcode());
		request.setAttribute("address", vo.getAddress());
		request.setAttribute("address2", vo.getAddress2());
		request.setAttribute("grade", vo.getGrade());

		request.getRequestDispatcher("adminupdate.jsp").forward(request, response);
	} catch (Exception e) {
		response.sendRedirect("adminpage.jsp");
	}
	%>
</body>
</html>
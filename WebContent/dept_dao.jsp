
<%@page import="edu.global.ex.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="edu.global.ex.dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  DeptDAO dao = new DeptDAO();
   List<DeptVO> vos = dao.deptSelect();
   
   for(DeptVO vo  : vos) {
	   out.print("부서번호" + vo.getDeptno() + "</br>");
	   out.print("장소" + vo.getLoc() + "</br>");
	   out.print("부서이름" + vo.getDname() + "</br>");
	   out.print("<hr>");
	   
   }


%>
</body>
</html>


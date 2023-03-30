<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
   String url = "jdbc:oracle:thin:@localhost:1521/xe";
   /* new oracle.jdbc.driver.OracleDriver(); */ /* 밑에 Class랑 같음 */
   Class.forName("oracle.jdbc.driver.OracleDriver");


   String sql = "SELECT * FROM emp";
   
   Connection con = DriverManager.getConnection(url, "scott", "tiger"); /* 오라클하고 빨대 꽂음
 */   Statement st = con.createStatement(); 
   ResultSet rs = st.executeQuery(sql); /* 결과물을 받아옴. 한마디로 테이블을 받아옴. */
   
   while(rs.next()){  
      
      out.print("사원번호" + rs.getString("empno") + "<br>" );
      out.print("직업" + rs.getString("job") + "<br>" );
      out.print("관리자번호" + rs.getString("mgr") + "<br>" );
      out.print("커밋션" + rs.getString("comm") + "<br>" );
      out.print("부서번호" + rs.getString("deptno") + "<br>" );
      out.print("<hr>");
      
      
   }
   
   rs.close();  /* 다 쓰면 끊어줘야함. 메모리 정리하겠다. close도 순서대로. 끝에서 부터 닫아줘야함.(안에서부터 닫기) */ 
   st.close();
   con.close();
   
%>
</body>
</html>
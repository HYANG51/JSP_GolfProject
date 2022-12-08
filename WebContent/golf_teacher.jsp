<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 조회</title>
<style type="text/css">
	header{background-color: #333333; width: 100%; height: 65px; text-align: center; display:inline-block;}
	#title{color: white; margin: 8px 0 0 40px}
	#nav{background-color: #666666; width: 100%; height: 35px; padding: 7px 0 1px 0}
	#nav a{text-decoration: none; color: white;}
	#name{font-size: 30px;}
	section{background-color: #CDCDCD; width: 100%; height: 610px; text-align: center}
	footer{background-color: #333333; width: 100%; height: 25px; text-align: center; font-weight: lighter;
			position: absolute; bottom: 0;}
</style>
</head>
<body>
<header><h1 id="title">골프연습장 회원관리 프로그램 V1.0</h1></header>
<nav id="nav">&nbsp;&nbsp;<a href="golf_teacher.do">강사조회</a>&nbsp;&nbsp;<a href="golf_regist.do">수강신청</a>&nbsp;&nbsp;
			  <a href="golf_student.do">회원정보조회</a>&nbsp;&nbsp;<a href="golf_sum.do">강사매출현황</a>&nbsp;&nbsp;
			  <a href="homepage.jsp">홈으로</a></nav>
<section>
<a id="name">수강신청</a>
<table width="600px" border="1" text-align="center" align="center">
	<tr>
		<td>강사코드</td>
		<td>강사명</td>
		<td>강의명</td>
		<td>수강료</td>
		<td>강사자격취득일</td>
	</tr>
	
	 <c:forEach var="golf_teacher" items="${teacher}">
	      <tr>
			<td>${golf_teacher.teacher_code}</td>
			<td>${golf_teacher.teacher_name}</td>
			<td>${golf_teacher.class_name}</td>
			<td>${golf_teacher.class_price}</td>
			<td>${golf_teacher.teacher_regist_date}</td>
		  </tr>
      
      </c:forEach>
      </table>
</section>
<footer><font color=white>Copyright&copy;&nbsp;All rights reserved.</font></footer>
</body>
</html>